// Copyright 2021 The Tint Authors.
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

#include "src/tint/resolver/resolver.h"

#include "gtest/gtest.h"
#include "src/tint/resolver/resolver_test_helper.h"
#include "src/tint/sem/expression.h"

using namespace tint::number_suffixes;  // NOLINT

namespace tint::resolver {
namespace {

using ResolverConstantsTest = ResolverTest;

////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction
////////////////////////////////////////////////////////////////////////////////////////////////////

TEST_F(ResolverConstantsTest, Scalar_i32) {
    auto* expr = Expr(99_i);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    EXPECT_TRUE(sem->Type()->Is<sem::I32>());
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_EQ(sem->ConstantValue().ElementType(), sem->Type());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 1u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 99);
}

TEST_F(ResolverConstantsTest, Scalar_u32) {
    auto* expr = Expr(99_u);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    EXPECT_TRUE(sem->Type()->Is<sem::U32>());
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_EQ(sem->ConstantValue().ElementType(), sem->Type());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 1u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 99u);
}

TEST_F(ResolverConstantsTest, Scalar_f32) {
    auto* expr = Expr(9.9_f);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    EXPECT_TRUE(sem->Type()->Is<sem::F32>());
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_EQ(sem->ConstantValue().ElementType(), sem->Type());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 1u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 9.9f);
}

TEST_F(ResolverConstantsTest, Scalar_bool) {
    auto* expr = Expr(true);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    EXPECT_TRUE(sem->Type()->Is<sem::Bool>());
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_EQ(sem->ConstantValue().ElementType(), sem->Type());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 1u);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(0), true);
}

TEST_F(ResolverConstantsTest, Vec3_ZeroInit_i32) {
    auto* expr = vec3<i32>();
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::I32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 0);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 0);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 0);
}

TEST_F(ResolverConstantsTest, Vec3_ZeroInit_u32) {
    auto* expr = vec3<u32>();
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::U32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::U32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 0u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 0u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 0u);
}

TEST_F(ResolverConstantsTest, Vec3_ZeroInit_f32) {
    auto* expr = vec3<f32>();
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 0.0);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, 0.0);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 0.0);
}

TEST_F(ResolverConstantsTest, Vec3_ZeroInit_bool) {
    auto* expr = vec3<bool>();
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::Bool>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::Bool>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(0), false);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(1), false);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(2), false);
}

TEST_F(ResolverConstantsTest, Vec3_Splat_i32) {
    auto* expr = vec3<i32>(99_i);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::I32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 99);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 99);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 99);
}

TEST_F(ResolverConstantsTest, Vec3_Splat_u32) {
    auto* expr = vec3<u32>(99_u);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::U32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::U32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 99u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 99u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 99u);
}

TEST_F(ResolverConstantsTest, Vec3_Splat_f32) {
    auto* expr = vec3<f32>(9.9_f);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 9.9f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, 9.9f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 9.9f);
}

TEST_F(ResolverConstantsTest, Vec3_Splat_bool) {
    auto* expr = vec3<bool>(true);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::Bool>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::Bool>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(0), true);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(1), true);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(2), true);
}

TEST_F(ResolverConstantsTest, Vec3_FullConstruct_i32) {
    auto* expr = vec3<i32>(1_i, 2_i, 3_i);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::I32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 1);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 2);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 3);
}

TEST_F(ResolverConstantsTest, Vec3_FullConstruct_u32) {
    auto* expr = vec3<u32>(1_u, 2_u, 3_u);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::U32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::U32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 1);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 2);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 3);
}

TEST_F(ResolverConstantsTest, Vec3_FullConstruct_f32) {
    auto* expr = vec3<f32>(1_f, 2_f, 3_f);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 1.f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, 2.f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 3.f);
}

TEST_F(ResolverConstantsTest, Vec3_FullConstruct_bool) {
    auto* expr = vec3<bool>(true, false, true);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::Bool>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::Bool>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(0), true);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(1), false);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(2), true);
}

TEST_F(ResolverConstantsTest, Vec3_MixConstruct_i32) {
    auto* expr = vec3<i32>(1_i, vec2<i32>(2_i, 3_i));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::I32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 1);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 2);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 3);
}

TEST_F(ResolverConstantsTest, Vec3_MixConstruct_u32) {
    auto* expr = vec3<u32>(vec2<u32>(1_u, 2_u), 3_u);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::U32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::U32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 1);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 2);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 3);
}

TEST_F(ResolverConstantsTest, Vec3_MixConstruct_f32) {
    auto* expr = vec3<f32>(1_f, vec2<f32>(2_f, 3_f));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 1.f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, 2.f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 3.f);
}

TEST_F(ResolverConstantsTest, Vec3_MixConstruct_bool) {
    auto* expr = vec3<bool>(vec2<bool>(true, false), true);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::Bool>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::Bool>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(0), true);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(1), false);
    EXPECT_EQ(sem->ConstantValue().Element<bool>(2), true);
}

TEST_F(ResolverConstantsTest, Vec3_Convert_f32_to_i32) {
    auto* expr = vec3<i32>(vec3<f32>(1.1_f, 2.2_f, 3.3_f));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::I32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, 1);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, 2);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, 3);
}

TEST_F(ResolverConstantsTest, Vec3_Convert_u32_to_f32) {
    auto* expr = vec3<f32>(vec3<u32>(10_u, 20_u, 30_u));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 10.f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, 20.f);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 30.f);
}

TEST_F(ResolverConstantsTest, Vec3_Convert_Large_f32_to_i32) {
    auto* expr = vec3<i32>(vec3<f32>(1e10_f, -1e20_f, 1e30_f));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::I32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, i32::kHighest);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, i32::kLowest);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, i32::kHighest);
}

TEST_F(ResolverConstantsTest, Vec3_Convert_Large_f32_to_u32) {
    auto* expr = vec3<u32>(vec3<f32>(1e10_f, -1e20_f, 1e30_f));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::U32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::U32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(0).value, u32::kHighest);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(1).value, u32::kLowest);
    EXPECT_EQ(sem->ConstantValue().Element<AInt>(2).value, u32::kHighest);
}

// TODO(crbug.com/tint/1502): Enable when f16 overloads are implemented
TEST_F(ResolverConstantsTest, DISABLED_Vec3_Convert_Large_f32_to_f16) {
    Enable(ast::Extension::kF16);

    auto* expr = vec3<f16>(vec3<f32>(0.00001_f, -0.00002_f, 0.00003_f));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    constexpr auto kInf = std::numeric_limits<double>::infinity();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F16>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F16>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, kInf);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, -kInf);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, kInf);
}

// TODO(crbug.com/tint/1502): Enable when f16 overloads are implemented
TEST_F(ResolverConstantsTest, DISABLED_Vec3_Convert_Small_f32_to_f16) {
    Enable(ast::Extension::kF16);

    auto* expr = vec3<f16>(vec3<f32>(1e-10_f, -1e20_f, 1e30_f));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F16>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F16>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 0.0);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, -0.0);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 0.0);
}

TEST_F(ResolverConstantsTest, Mat2x3_ZeroInit_f32) {
    auto* expr = mat2x3<f32>();
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* mat = sem->Type()->As<sem::Matrix>();
    ASSERT_NE(mat, nullptr);
    EXPECT_TRUE(mat->type()->Is<sem::F32>());
    EXPECT_EQ(mat->columns(), 2u);
    EXPECT_EQ(mat->rows(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 6u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 0._f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 0._f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 0._f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(3).value, 0._f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(4).value, 0._f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(5).value, 0._f);
}

TEST_F(ResolverConstantsTest, Mat3x2_Construct_Scalars_af) {
    auto* expr = Construct(ty.mat(nullptr, 3, 2), 1.0_a, 2.0_a, 3.0_a, 4.0_a, 5.0_a, 6.0_a);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* mat = sem->Type()->As<sem::Matrix>();
    ASSERT_NE(mat, nullptr);
    EXPECT_TRUE(mat->type()->Is<sem::F32>());
    EXPECT_EQ(mat->columns(), 3u);
    EXPECT_EQ(mat->rows(), 2u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 6u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 1._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, 2._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 3._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(3).value, 4._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(4).value, 5._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(5).value, 6._a);
}

TEST_F(ResolverConstantsTest, Mat3x2_Construct_Columns_af) {
    auto* expr = Construct(ty.mat(nullptr, 3, 2),           //
                           vec(nullptr, 2u, 1.0_a, 2.0_a),  //
                           vec(nullptr, 2u, 3.0_a, 4.0_a),  //
                           vec(nullptr, 2u, 5.0_a, 6.0_a));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* mat = sem->Type()->As<sem::Matrix>();
    ASSERT_NE(mat, nullptr);
    EXPECT_TRUE(mat->type()->Is<sem::F32>());
    EXPECT_EQ(mat->columns(), 3u);
    EXPECT_EQ(mat->rows(), 2u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 6u);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(0).value, 1._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(1).value, 2._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(2).value, 3._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(3).value, 4._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(4).value, 5._a);
    EXPECT_EQ(sem->ConstantValue().Element<AFloat>(5).value, 6._a);
}

TEST_F(ResolverConstantsTest, Array_i32_Zero) {
    auto* expr = Construct(ty.array<i32, 4>());
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* arr = sem->Type()->As<sem::Array>();
    ASSERT_NE(arr, nullptr);
    EXPECT_TRUE(arr->ElemType()->Is<sem::I32>());
    EXPECT_EQ(arr->Count(), 4u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 4u);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(0).value, 0_i);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(1).value, 0_i);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(2).value, 0_i);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(3).value, 0_i);
}

TEST_F(ResolverConstantsTest, Array_f32_Zero) {
    auto* expr = Construct(ty.array<f32, 4>());
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* arr = sem->Type()->As<sem::Array>();
    ASSERT_NE(arr, nullptr);
    EXPECT_TRUE(arr->ElemType()->Is<sem::F32>());
    EXPECT_EQ(arr->Count(), 4u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 4u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(3).value, 0_f);
}

TEST_F(ResolverConstantsTest, Array_vec3_f32_Zero) {
    auto* expr = Construct(ty.array(ty.vec3<f32>(), 2_u));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* arr = sem->Type()->As<sem::Array>();
    ASSERT_NE(arr, nullptr);
    EXPECT_TRUE(arr->ElemType()->Is<sem::Vector>());
    EXPECT_EQ(arr->Count(), 2u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 6u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(3).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(4).value, 0_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(5).value, 0_f);
}

TEST_F(ResolverConstantsTest, Array_i32_Elements) {
    auto* expr = Construct(ty.array<i32, 4>(), 10_i, 20_i, 30_i, 40_i);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* arr = sem->Type()->As<sem::Array>();
    ASSERT_NE(arr, nullptr);
    EXPECT_TRUE(arr->ElemType()->Is<sem::I32>());
    EXPECT_EQ(arr->Count(), 4u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 4u);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(0).value, 10_i);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(1).value, 20_i);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(2).value, 30_i);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(3).value, 40_i);
}

TEST_F(ResolverConstantsTest, Array_f32_Elements) {
    auto* expr = Construct(ty.array<f32, 4>(), 10_f, 20_f, 30_f, 40_f);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* arr = sem->Type()->As<sem::Array>();
    ASSERT_NE(arr, nullptr);
    EXPECT_TRUE(arr->ElemType()->Is<sem::F32>());
    EXPECT_EQ(arr->Count(), 4u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 4u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 10_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 20_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 30_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(3).value, 40_f);
}

TEST_F(ResolverConstantsTest, Array_vec3_f32_Elements) {
    auto* expr = Construct(ty.array(ty.vec3<f32>(), 2_u),  //
                           vec3<f32>(1_f, 2_f, 3_f), vec3<f32>(4_f, 5_f, 6_f));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* arr = sem->Type()->As<sem::Array>();
    ASSERT_NE(arr, nullptr);
    EXPECT_TRUE(arr->ElemType()->Is<sem::Vector>());
    EXPECT_EQ(arr->Count(), 2u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 6u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 1_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 2_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 3_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(3).value, 4_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(4).value, 5_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(5).value, 6_f);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// Indexing
////////////////////////////////////////////////////////////////////////////////////////////////////

TEST_F(ResolverConstantsTest, Vec3_Index) {
    auto* expr = IndexAccessor(vec3<i32>(1_i, 2_i, 3_i), 2_i);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    ASSERT_TRUE(sem->Type()->Is<sem::I32>());
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 1u);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(0).value, 3_i);
}

TEST_F(ResolverConstantsTest, Vec3_Index_OOB_High) {
    auto* expr = IndexAccessor(vec3<i32>(1_i, 2_i, 3_i), Expr(Source{{12, 34}}, 3_i));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();
    EXPECT_EQ(r()->error(), "12:34 warning: index 3 out of bounds [0..2]. Clamping index to 2");

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    ASSERT_TRUE(sem->Type()->Is<sem::I32>());
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 1u);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(0).value, 3_i);
}

TEST_F(ResolverConstantsTest, Vec3_Index_OOB_Low) {
    auto* expr = IndexAccessor(vec3<i32>(1_i, 2_i, 3_i), Expr(Source{{12, 34}}, -3_i));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();
    EXPECT_EQ(r()->error(), "12:34 warning: index -3 out of bounds [0..2]. Clamping index to 0");

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    ASSERT_TRUE(sem->Type()->Is<sem::I32>());
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::I32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 1u);
    EXPECT_EQ(sem->ConstantValue().Element<i32>(0).value, 1_i);
}

TEST_F(ResolverConstantsTest, Mat3x2_Index) {
    auto* expr = IndexAccessor(
        mat3x2<f32>(vec2<f32>(1._a, 2._a), vec2<f32>(3._a, 4._a), vec2<f32>(5._a, 6._a)), 2_i);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_EQ(vec->Width(), 2u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 2u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 5._a);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 6._a);
}

TEST_F(ResolverConstantsTest, Mat3x2_Index_OOB_High) {
    auto* expr = IndexAccessor(
        mat3x2<f32>(vec2<f32>(1._a, 2._a), vec2<f32>(3._a, 4._a), vec2<f32>(5._a, 6._a)),
        Expr(Source{{12, 34}}, 3_i));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();
    EXPECT_EQ(r()->error(), "12:34 warning: index 3 out of bounds [0..2]. Clamping index to 2");

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_EQ(vec->Width(), 2u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 2u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 5._a);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 6._a);
}

TEST_F(ResolverConstantsTest, Mat3x2_Index_OOB_Low) {
    auto* expr = IndexAccessor(
        mat3x2<f32>(vec2<f32>(1._a, 2._a), vec2<f32>(3._a, 4._a), vec2<f32>(5._a, 6._a)),
        Expr(Source{{12, 34}}, -3_i));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();
    EXPECT_EQ(r()->error(), "12:34 warning: index -3 out of bounds [0..2]. Clamping index to 0");

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_EQ(vec->Width(), 2u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 2u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 1._a);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 2._a);
}

TEST_F(ResolverConstantsTest, Array_vec3_f32_Index) {
    auto* expr = IndexAccessor(Construct(ty.array(ty.vec3<f32>(), 2_u),  //
                                         vec3<f32>(1_f, 2_f, 3_f), vec3<f32>(4_f, 5_f, 6_f)),
                               1_i);
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 4_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 5_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 6_f);
}

TEST_F(ResolverConstantsTest, Array_vec3_f32_Index_OOB_High) {
    auto* expr = IndexAccessor(Construct(ty.array(ty.vec3<f32>(), 2_u),  //
                                         vec3<f32>(1_f, 2_f, 3_f), vec3<f32>(4_f, 5_f, 6_f)),
                               Expr(Source{{12, 34}}, 2_i));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();
    EXPECT_EQ(r()->error(), "12:34 warning: index 2 out of bounds [0..1]. Clamping index to 1");

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 4_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 5_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 6_f);
}

TEST_F(ResolverConstantsTest, Array_vec3_f32_Index_OOB_Low) {
    auto* expr = IndexAccessor(Construct(ty.array(ty.vec3<f32>(), 2_u),  //
                                         vec3<f32>(1_f, 2_f, 3_f), vec3<f32>(4_f, 5_f, 6_f)),
                               Expr(Source{{12, 34}}, -2_i));
    WrapInFunction(expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();
    EXPECT_EQ(r()->error(), "12:34 warning: index -2 out of bounds [0..1]. Clamping index to 0");

    auto* sem = Sem().Get(expr);
    ASSERT_NE(sem, nullptr);
    auto* vec = sem->Type()->As<sem::Vector>();
    ASSERT_NE(vec, nullptr);
    EXPECT_TRUE(vec->type()->Is<sem::F32>());
    EXPECT_EQ(vec->Width(), 3u);
    EXPECT_EQ(sem->ConstantValue().Type(), sem->Type());
    EXPECT_TRUE(sem->ConstantValue().ElementType()->Is<sem::F32>());
    ASSERT_EQ(sem->ConstantValue().ElementCount(), 3u);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(0).value, 1_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(1).value, 2_f);
    EXPECT_EQ(sem->ConstantValue().Element<f32>(2).value, 3_f);
}

TEST_F(ResolverConstantsTest, ChainedIndex) {
    auto* arr_expr = Construct(ty.array(ty.mat2x3<f32>(), 2_u),        // array<mat2x3<f32>, 2u>
                               mat2x3<f32>(vec3<f32>(1_f, 2_f, 3_f),   //
                                           vec3<f32>(4_f, 5_f, 6_f)),  //
                               mat2x3<f32>(vec3<f32>(7_f, 8_f, 9_f),   //
                                           vec3<f32>(10_f, 11_f, 12_f)));

    auto* mat_expr = IndexAccessor(arr_expr, 1_i);  // arr[1]
    auto* vec_expr = IndexAccessor(mat_expr, 0_i);  // arr[1][0]
    auto* f32_expr = IndexAccessor(vec_expr, 2_i);  // arr[1][0][2]
    WrapInFunction(f32_expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();

    {
        auto* mat = Sem().Get(mat_expr);
        EXPECT_NE(mat, nullptr);
        auto* ty = mat->Type()->As<sem::Matrix>();
        ASSERT_NE(mat->Type(), nullptr);
        EXPECT_TRUE(ty->ColumnType()->Is<sem::Vector>());
        EXPECT_EQ(ty->columns(), 2u);
        EXPECT_EQ(ty->rows(), 3u);
        EXPECT_EQ(mat->ConstantValue().Type(), mat->Type());
        EXPECT_TRUE(mat->ConstantValue().ElementType()->Is<sem::F32>());
        ASSERT_EQ(mat->ConstantValue().ElementCount(), 6u);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(0).value, 7_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(1).value, 8_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(2).value, 9_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(3).value, 10_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(4).value, 11_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(5).value, 12_f);
    }
    {
        auto* vec = Sem().Get(vec_expr);
        EXPECT_NE(vec, nullptr);
        auto* ty = vec->Type()->As<sem::Vector>();
        ASSERT_NE(vec->Type(), nullptr);
        EXPECT_TRUE(ty->type()->Is<sem::F32>());
        EXPECT_EQ(ty->Width(), 3u);
        EXPECT_EQ(vec->ConstantValue().Type(), vec->Type());
        EXPECT_TRUE(vec->ConstantValue().ElementType()->Is<sem::F32>());
        ASSERT_EQ(vec->ConstantValue().ElementCount(), 3u);
        EXPECT_EQ(vec->ConstantValue().Element<f32>(0).value, 7_f);
        EXPECT_EQ(vec->ConstantValue().Element<f32>(1).value, 8_f);
        EXPECT_EQ(vec->ConstantValue().Element<f32>(2).value, 9_f);
    }
    {
        auto* f = Sem().Get(f32_expr);
        EXPECT_NE(f, nullptr);
        EXPECT_TRUE(f->Type()->Is<sem::F32>());
        EXPECT_EQ(f->ConstantValue().Type(), f->Type());
        EXPECT_TRUE(f->ConstantValue().ElementType()->Is<sem::F32>());
        ASSERT_EQ(f->ConstantValue().ElementCount(), 1u);
        EXPECT_EQ(f->ConstantValue().Element<f32>(0).value, 9_f);
    }
}

TEST_F(ResolverConstantsTest, ChainedIndex_OOB) {
    auto* arr_expr = Construct(ty.array(ty.mat2x3<f32>(), 2_u),        // array<mat2x3<f32>, 2u>
                               mat2x3<f32>(vec3<f32>(1_f, 2_f, 3_f),   //
                                           vec3<f32>(4_f, 5_f, 6_f)),  //
                               mat2x3<f32>(vec3<f32>(7_f, 8_f, 9_f),   //
                                           vec3<f32>(10_f, 11_f, 12_f)));

    auto* mat_expr = IndexAccessor(arr_expr, Expr(Source{{1, 2}}, -3_i));  // arr[3]
    auto* vec_expr = IndexAccessor(mat_expr, Expr(Source{{3, 4}}, -2_i));  // arr[3][-2]
    auto* f32_expr = IndexAccessor(vec_expr, Expr(Source{{5, 6}}, 4_i));   // arr[3][-2][4]
    WrapInFunction(f32_expr);

    EXPECT_TRUE(r()->Resolve()) << r()->error();
    EXPECT_EQ(r()->error(), R"(1:2 warning: index -3 out of bounds [0..1]. Clamping index to 0
3:4 warning: index -2 out of bounds [0..1]. Clamping index to 0
5:6 warning: index 4 out of bounds [0..2]. Clamping index to 2)");

    {
        auto* mat = Sem().Get(mat_expr);
        EXPECT_NE(mat, nullptr);
        auto* ty = mat->Type()->As<sem::Matrix>();
        ASSERT_NE(mat->Type(), nullptr);
        EXPECT_TRUE(ty->ColumnType()->Is<sem::Vector>());
        EXPECT_EQ(ty->columns(), 2u);
        EXPECT_EQ(ty->rows(), 3u);
        EXPECT_EQ(mat->ConstantValue().Type(), mat->Type());
        EXPECT_TRUE(mat->ConstantValue().ElementType()->Is<sem::F32>());
        ASSERT_EQ(mat->ConstantValue().ElementCount(), 6u);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(0).value, 1_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(1).value, 2_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(2).value, 3_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(3).value, 4_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(4).value, 5_f);
        EXPECT_EQ(mat->ConstantValue().Element<f32>(5).value, 6_f);
    }
    {
        auto* vec = Sem().Get(vec_expr);
        EXPECT_NE(vec, nullptr);
        auto* ty = vec->Type()->As<sem::Vector>();
        ASSERT_NE(vec->Type(), nullptr);
        EXPECT_TRUE(ty->type()->Is<sem::F32>());
        EXPECT_EQ(ty->Width(), 3u);
        EXPECT_EQ(vec->ConstantValue().Type(), vec->Type());
        EXPECT_TRUE(vec->ConstantValue().ElementType()->Is<sem::F32>());
        ASSERT_EQ(vec->ConstantValue().ElementCount(), 3u);
        EXPECT_EQ(vec->ConstantValue().Element<f32>(0).value, 1_f);
        EXPECT_EQ(vec->ConstantValue().Element<f32>(1).value, 2_f);
        EXPECT_EQ(vec->ConstantValue().Element<f32>(2).value, 3_f);
    }
    {
        auto* f = Sem().Get(f32_expr);
        EXPECT_NE(f, nullptr);
        EXPECT_TRUE(f->Type()->Is<sem::F32>());
        EXPECT_EQ(f->ConstantValue().Type(), f->Type());
        EXPECT_TRUE(f->ConstantValue().ElementType()->Is<sem::F32>());
        ASSERT_EQ(f->ConstantValue().ElementCount(), 1u);
        EXPECT_EQ(f->ConstantValue().Element<f32>(0).value, 3_f);
    }
}

}  // namespace
}  // namespace tint::resolver
