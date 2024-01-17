// Copyright 2021 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

////////////////////////////////////////////////////////////////////////////////
// File generated by 'tools/src/cmd/gen' using the template:
//   src/tint/lang/wgsl/extension_test.cc.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#include "src/tint/lang/wgsl/extension.h"

#include <gtest/gtest.h>

#include <string>

#include "src/tint/utils/text/string.h"

namespace tint::wgsl {
namespace {

namespace parse_print_tests {

struct Case {
    const char* string;
    Extension value;
};

inline std::ostream& operator<<(std::ostream& out, Case c) {
    return out << "'" << std::string(c.string) << "'";
}

static constexpr Case kValidCases[] = {
    {"chromium_disable_uniformity_analysis", Extension::kChromiumDisableUniformityAnalysis},
    {"chromium_experimental_framebuffer_fetch", Extension::kChromiumExperimentalFramebufferFetch},
    {"chromium_experimental_pixel_local", Extension::kChromiumExperimentalPixelLocal},
    {"chromium_experimental_push_constant", Extension::kChromiumExperimentalPushConstant},
    {"chromium_experimental_subgroups", Extension::kChromiumExperimentalSubgroups},
    {"chromium_internal_dual_source_blending", Extension::kChromiumInternalDualSourceBlending},
    {"chromium_internal_relaxed_uniform_layout", Extension::kChromiumInternalRelaxedUniformLayout},
    {"f16", Extension::kF16},
};

static constexpr Case kInvalidCases[] = {
    {"chromium_disableuniformiccy_analysis", Extension::kUndefined},
    {"chromil3_disable_unifority_analss", Extension::kUndefined},
    {"chromium_disable_Vniformity_analysis", Extension::kUndefined},
    {"chromium_experimental_framebuf1er_fetch", Extension::kUndefined},
    {"chromium_experiqqntal_framebuffer_fetch", Extension::kUndefined},
    {"chromium_experimental_framebuffll77_fetch", Extension::kUndefined},
    {"chroqqppum_expermental_pixel_HHocal", Extension::kUndefined},
    {"chromium_experimenta_piel_occl", Extension::kUndefined},
    {"chromium_exeGimental_pixel_local", Extension::kUndefined},
    {"chvomium_experimental_push_constiint", Extension::kUndefined},
    {"chromiu8WWexperimental_push_constant", Extension::kUndefined},
    {"chromium_experiMental_push_costanxx", Extension::kUndefined},
    {"chromiuX_experimentl_sugggroups", Extension::kUndefined},
    {"chromiu_exuerimntal_XVbgroups", Extension::kUndefined},
    {"chromium_experimen3al_subgroups", Extension::kUndefined},
    {"chromium_internal_dual_soErce_blending", Extension::kUndefined},
    {"chromiuPP_internal_dual_sourceblenTTing", Extension::kUndefined},
    {"chromim_internadd_dual_sxxurce_blending", Extension::kUndefined},
    {"chromium_interna44_relaxed_uniform_layout", Extension::kUndefined},
    {"chromium_internal_relaxed_uniformSSlayouVV", Extension::kUndefined},
    {"chromiumRnteRnal_re22axed_uniform_layout", Extension::kUndefined},
    {"96", Extension::kUndefined},
    {"f1", Extension::kUndefined},
    {"VOR6", Extension::kUndefined},
};

using ExtensionParseTest = testing::TestWithParam<Case>;

TEST_P(ExtensionParseTest, Parse) {
    const char* string = GetParam().string;
    Extension expect = GetParam().value;
    EXPECT_EQ(expect, ParseExtension(string));
}

INSTANTIATE_TEST_SUITE_P(ValidCases, ExtensionParseTest, testing::ValuesIn(kValidCases));
INSTANTIATE_TEST_SUITE_P(InvalidCases, ExtensionParseTest, testing::ValuesIn(kInvalidCases));

using ExtensionPrintTest = testing::TestWithParam<Case>;

TEST_P(ExtensionPrintTest, Print) {
    Extension value = GetParam().value;
    const char* expect = GetParam().string;
    EXPECT_EQ(expect, ToString(value));
}

INSTANTIATE_TEST_SUITE_P(ValidCases, ExtensionPrintTest, testing::ValuesIn(kValidCases));

}  // namespace parse_print_tests

}  // namespace
}  // namespace tint::wgsl
