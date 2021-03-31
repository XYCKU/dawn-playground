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

#include "src/transform/hlsl.h"

#include <utility>

#include "src/ast/variable_decl_statement.h"
#include "src/program_builder.h"
#include "src/semantic/expression.h"
#include "src/semantic/statement.h"
#include "src/semantic/variable.h"

namespace tint {
namespace transform {

Hlsl::Hlsl() = default;
Hlsl::~Hlsl() = default;

Transform::Output Hlsl::Run(const Program* in, const DataMap&) {
  ProgramBuilder out;
  CloneContext ctx(&out, in);
  PromoteArrayInitializerToConstVar(ctx);
  ctx.Clone();
  return Output{Program(std::move(out))};
}

void Hlsl::PromoteArrayInitializerToConstVar(CloneContext& ctx) const {
  // Scan the AST nodes for array initializers which need to be promoted to
  // their own constant declaration.

  // Note: Correct handling of arrays-of-arrays is guaranteed due to the
  // depth-first traversal of the ast::Node::Clone() methods:
  //
  // The inner-most array initializers are traversed first, and they are hoisted
  // to const variables declared just above the statement of use. The outer
  // array initializer will then be hoisted, inserting themselves between the
  // inner array declaration and the statement of use. This pattern applies
  // correctly to any nested depth.
  //
  // Depth-first traversal of the AST is guaranteed because AST nodes are fully
  // immutable and require their children to be constructed first so their
  // pointer can be passed to the parent's constructor.

  for (auto* src_node : ctx.src->ASTNodes().Objects()) {
    if (auto* src_init = src_node->As<ast::TypeConstructorExpression>()) {
      auto* src_sem_expr = ctx.src->Sem().Get(src_init);
      if (!src_sem_expr) {
        TINT_ICE(ctx.dst->Diagnostics())
            << "ast::TypeConstructorExpression has no semantic expression node";
        continue;
      }
      auto* src_sem_stmt = src_sem_expr->Stmt();
      if (!src_sem_stmt) {
        // Expression is outside of a statement. This usually means the
        // expression is part of a global (module-scope) constant declaration.
        // These must be constexpr, and so cannot contain the type of
        // expressions that must be sanitized.
        continue;
      }
      auto* src_stmt = src_sem_stmt->Declaration();

      if (auto* src_var_decl = src_stmt->As<ast::VariableDeclStatement>()) {
        if (src_var_decl->variable()->constructor() == src_init) {
          // This statement is just a variable declaration with the array
          // initializer as the constructor value. This is what we're
          // attempting to transform to, and so ignore.
          continue;
        }
      }

      if (auto* src_array_ty = src_sem_expr->Type()->As<type::Array>()) {
        // Create a new symbol for the constant
        auto dst_symbol = ctx.dst->Symbols().New();
        // Clone the array type
        auto* dst_array_ty = ctx.Clone(src_array_ty);
        // Clone the array initializer
        auto* dst_init = ctx.Clone(src_init);
        // Construct the constant that holds the array
        auto* dst_var = ctx.dst->Const(dst_symbol, dst_array_ty, dst_init);
        // Construct the variable declaration statement
        auto* dst_var_decl =
            ctx.dst->create<ast::VariableDeclStatement>(dst_var);
        // Construct the identifier for referencing the constant
        auto* dst_ident = ctx.dst->Expr(dst_symbol);

        // Insert the constant before the usage
        ctx.InsertBefore(src_stmt, dst_var_decl);
        // Replace the inlined array with a reference to the constant
        ctx.Replace(src_init, dst_ident);
      }
    }
  }
}

}  // namespace transform
}  // namespace tint
