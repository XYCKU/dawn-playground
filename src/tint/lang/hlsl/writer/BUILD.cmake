# Copyright 2023 The Dawn & Tint Authors
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

include(lang/hlsl/writer/ast_printer/BUILD.cmake)
include(lang/hlsl/writer/ast_raise/BUILD.cmake)
include(lang/hlsl/writer/common/BUILD.cmake)
include(lang/hlsl/writer/helpers/BUILD.cmake)
include(lang/hlsl/writer/printer/BUILD.cmake)
include(lang/hlsl/writer/raise/BUILD.cmake)

if(TINT_BUILD_HLSL_WRITER)
################################################################################
# Target:    tint_lang_hlsl_writer
# Kind:      lib
# Condition: TINT_BUILD_HLSL_WRITER
################################################################################
tint_add_target(tint_lang_hlsl_writer lib
  lang/hlsl/writer/output.cc
  lang/hlsl/writer/output.h
  lang/hlsl/writer/writer.cc
  lang/hlsl/writer/writer.h
)

tint_target_add_dependencies(tint_lang_hlsl_writer lib
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_hlsl_writer_common
  tint_lang_hlsl_writer_printer
  tint_lang_hlsl_writer_raise
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_ast_transform
  tint_lang_wgsl_features
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_generator
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

if(TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies(tint_lang_hlsl_writer lib
    tint_lang_hlsl_writer_ast_printer
    tint_lang_hlsl_writer_ast_raise
  )
endif(TINT_BUILD_HLSL_WRITER)

endif(TINT_BUILD_HLSL_WRITER)
if(TINT_BUILD_HLSL_WRITER)
################################################################################
# Target:    tint_lang_hlsl_writer_test
# Kind:      test
# Condition: TINT_BUILD_HLSL_WRITER
################################################################################
tint_add_target(tint_lang_hlsl_writer_test test
  lang/hlsl/writer/access_test.cc
  lang/hlsl/writer/arraylength_test.cc
  lang/hlsl/writer/binary_test.cc
  lang/hlsl/writer/bitcast_test.cc
  lang/hlsl/writer/builtin_test.cc
  lang/hlsl/writer/constant_test.cc
  lang/hlsl/writer/construct_test.cc
  lang/hlsl/writer/convert_test.cc
  lang/hlsl/writer/function_test.cc
  lang/hlsl/writer/helper_test.h
  lang/hlsl/writer/if_test.cc
  lang/hlsl/writer/loop_test.cc
  lang/hlsl/writer/switch_test.cc
  lang/hlsl/writer/unary_test.cc
  lang/hlsl/writer/var_let_test.cc
)

tint_target_add_dependencies(tint_lang_hlsl_writer_test test
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_intrinsic
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_hlsl_writer_common
  tint_lang_wgsl_ast
  tint_utils_command
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_hlsl_writer_test test
  "gtest"
)

if(TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies(tint_lang_hlsl_writer_test test
    tint_lang_hlsl_validate
    tint_lang_hlsl_writer
  )
endif(TINT_BUILD_HLSL_WRITER)

endif(TINT_BUILD_HLSL_WRITER)
if(TINT_BUILD_HLSL_WRITER AND TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
################################################################################
# Target:    tint_lang_hlsl_writer_bench
# Kind:      bench
# Condition: TINT_BUILD_HLSL_WRITER AND TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER
################################################################################
tint_add_target(tint_lang_hlsl_writer_bench bench
  lang/hlsl/writer/writer_bench.cc
)

tint_target_add_dependencies(tint_lang_hlsl_writer_bench bench
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_type
  tint_lang_hlsl_writer_common
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_hlsl_writer_bench bench
  "google-benchmark"
)

if(TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies(tint_lang_hlsl_writer_bench bench
    tint_lang_hlsl_writer
  )
endif(TINT_BUILD_HLSL_WRITER)

if(TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_lang_hlsl_writer_bench bench
    tint_cmd_bench_bench
  )
endif(TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

endif(TINT_BUILD_HLSL_WRITER AND TINT_BUILD_SPV_READER AND TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
if(TINT_BUILD_HLSL_WRITER)
################################################################################
# Target:    tint_lang_hlsl_writer_fuzz
# Kind:      fuzz
# Condition: TINT_BUILD_HLSL_WRITER
################################################################################
tint_add_target(tint_lang_hlsl_writer_fuzz fuzz
)

tint_target_add_dependencies(tint_lang_hlsl_writer_fuzz fuzz
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_type
  tint_lang_hlsl_writer_common
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_ast_transform
  tint_lang_wgsl_features
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_utils_bytes
  tint_utils_command
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

if(TINT_BUILD_HLSL_WRITER)
  tint_target_add_dependencies(tint_lang_hlsl_writer_fuzz fuzz
    tint_lang_hlsl_validate
    tint_lang_hlsl_writer
  )
endif(TINT_BUILD_HLSL_WRITER)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_sources(tint_lang_hlsl_writer_fuzz fuzz
    "lang/hlsl/writer/writer_ast_fuzz.cc"
  )
  tint_target_add_dependencies(tint_lang_hlsl_writer_fuzz fuzz
    tint_cmd_fuzz_wgsl_fuzz
  )
endif(TINT_BUILD_WGSL_READER)

endif(TINT_BUILD_HLSL_WRITER)