// Copyright 2022 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/tint/reader/wgsl/parser_impl_test_helper.h"

namespace tint::reader::wgsl {
namespace {

TEST_F(ParserImplTest, LHSExpression_NoPrefix) {
    auto p = parser("a");
    auto e = p->lhs_expression();
    ASSERT_FALSE(p->has_error()) << p->error();
    ASSERT_FALSE(e.errored);
    ASSERT_NE(e.value, nullptr);
    ASSERT_TRUE(e->Is<ast::IdentifierExpression>());
}

TEST_F(ParserImplTest, LHSExpression_And) {
    auto p = parser("&a");
    auto e = p->lhs_expression();
    ASSERT_FALSE(p->has_error()) << p->error();
    ASSERT_FALSE(e.errored);
    ASSERT_NE(e.value, nullptr);
    ASSERT_TRUE(e->Is<ast::UnaryOpExpression>());

    auto* u = e->As<ast::UnaryOpExpression>();
    EXPECT_EQ(u->op, ast::UnaryOp::kAddressOf);
    EXPECT_TRUE(u->expr->Is<ast::IdentifierExpression>());
}

TEST_F(ParserImplTest, LHSExpression_Star) {
    auto p = parser("*a");
    auto e = p->lhs_expression();
    ASSERT_FALSE(p->has_error()) << p->error();
    ASSERT_FALSE(e.errored);
    ASSERT_NE(e.value, nullptr);
    ASSERT_TRUE(e->Is<ast::UnaryOpExpression>());

    auto* u = e->As<ast::UnaryOpExpression>();
    EXPECT_EQ(u->op, ast::UnaryOp::kIndirection);
    EXPECT_TRUE(u->expr->Is<ast::IdentifierExpression>());
}

TEST_F(ParserImplTest, LHSExpression_Multiple) {
    auto p = parser("*&**&&*a");
    auto e = p->lhs_expression();
    ASSERT_FALSE(p->has_error()) << p->error();
    ASSERT_FALSE(e.errored);
    ASSERT_NE(e.value, nullptr);

    std::vector<ast::UnaryOp> results = {ast::UnaryOp::kIndirection, ast::UnaryOp::kAddressOf,
                                         ast::UnaryOp::kIndirection, ast::UnaryOp::kIndirection,
                                         ast::UnaryOp::kAddressOf,   ast::UnaryOp::kAddressOf,
                                         ast::UnaryOp::kIndirection};

    auto* expr = e.value;
    for (auto op : results) {
        ASSERT_TRUE(expr->Is<ast::UnaryOpExpression>());

        auto* u = expr->As<ast::UnaryOpExpression>();
        EXPECT_EQ(u->op, op);

        expr = u->expr;
    }

    EXPECT_TRUE(expr->Is<ast::IdentifierExpression>());
}

TEST_F(ParserImplTest, LHSExpression_PostfixExpression) {
    auto p = parser("*a.foo");
    auto e = p->lhs_expression();
    ASSERT_FALSE(p->has_error()) << p->error();
    ASSERT_FALSE(e.errored);
    ASSERT_NE(e.value, nullptr);
    ASSERT_TRUE(e->Is<ast::MemberAccessorExpression>());

    auto* access = e->As<ast::MemberAccessorExpression>();
    ASSERT_TRUE(access->structure->Is<ast::UnaryOpExpression>());

    auto* u = access->structure->As<ast::UnaryOpExpression>();
    EXPECT_EQ(u->op, ast::UnaryOp::kIndirection);

    ASSERT_TRUE(u->expr->Is<ast::IdentifierExpression>());
    auto* struct_ident = u->expr->As<ast::IdentifierExpression>();
    EXPECT_EQ(struct_ident->symbol, p->builder().Symbols().Get("a"));

    ASSERT_TRUE(access->member->Is<ast::IdentifierExpression>());
    auto* member_ident = access->member->As<ast::IdentifierExpression>();
    EXPECT_EQ(member_ident->symbol, p->builder().Symbols().Get("foo"));
}

}  // namespace
}  // namespace tint::reader::wgsl
