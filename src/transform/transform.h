// Copyright 2020 The Tint Authors.
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

#ifndef SRC_TRANSFORM_TRANSFORM_H_
#define SRC_TRANSFORM_TRANSFORM_H_

#include <memory>
#include <string>
#include <utility>

#include "src/ast/module.h"
#include "src/diagnostic/diagnostic.h"
#include "src/program.h"

namespace tint {
namespace transform {

/// Interface for ast::Module transforms
class Transform {
 public:
  /// Constructor
  Transform();
  /// Destructor
  virtual ~Transform();

  /// The return type of Run()
  struct Output {
    /// Constructor
    Output();

    /// Constructor
    /// @param module the module to move into this Output
    explicit Output(ast::Module&& module);

    /// Constructor
    /// @param module the module to move into this Output
    /// @param diags the list of diagnostics to move into this Output
    Output(ast::Module&& module, diag::List&& diags);

    /// Move constructor
    /// @param output the output to move into this Output
    Output(Output&& output);

    /// Destructor
    ~Output();

    /// Move assignment operator
    /// @param rhs the Output to move into this Output
    /// @returns this Output
    Output& operator=(Output&& rhs);

    /// The transformed program. May be empty on error.
    Program program;
    /// Diagnostics raised while running the Transform.
    diag::List diagnostics;
    /// The transformed module. May be empty on error.
    ast::Module& module{program.module};
  };

  /// Runs the transform on `module`, returning the transformation result.
  /// @note Users of Tint should register the transform with transform manager
  /// and invoke its Run(), instead of directly calling the transform's Run().
  /// Calling Run() directly does not perform module state cleanup operations.
  /// @param module the source module to transform
  /// @returns the transformation result
  virtual Output Run(ast::Module* module) = 0;

  /// Runs the transform on `program`, returning the transformation result.
  /// @note Users of Tint should register the transform with transform manager
  /// and invoke its Run(), instead of directly calling the transform's Run().
  /// Calling Run() directly does not perform program state cleanup operations.
  /// @param program the source program to transform
  /// @returns the transformation result
  Output Run(Program* program) { return Run(&program->module); }

 protected:
  /// Clones the function `in` adding `statements` to the beginning of the
  /// cloned function body.
  /// @param ctx the clone context
  /// @param in the function to clone
  /// @param statements the statements to prepend to `in`'s body
  /// @return the cloned function
  static ast::Function* CloneWithStatementsAtStart(
      CloneContext* ctx,
      ast::Function* in,
      ast::StatementList statements);
};

}  // namespace transform
}  // namespace tint

#endif  // SRC_TRANSFORM_TRANSFORM_H_
