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

////////////////////////////////////////////////////////////////////////////////
// File generated by tools/builtin-gen
// using the template:
//   src/tint/sem/builtin_type.h.tmpl
// and the builtin defintion file:
//   src/tint/builtins.def
//
// Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#ifndef SRC_TINT_SEM_BUILTIN_TYPE_H_
#define SRC_TINT_SEM_BUILTIN_TYPE_H_

#include <sstream>
#include <string>

namespace tint {
namespace sem {

/// Enumerator of all builtin functions
enum class BuiltinType {
  kNone = -1,
  kAbs,
  kAcos,
  kAll,
  kAny,
  kArrayLength,
  kAsin,
  kAtan,
  kAtan2,
  kCeil,
  kClamp,
  kCos,
  kCosh,
  kCountLeadingZeros,
  kCountOneBits,
  kCountTrailingZeros,
  kCross,
  kDegrees,
  kDeterminant,
  kDistance,
  kDot,
  kDpdx,
  kDpdxCoarse,
  kDpdxFine,
  kDpdy,
  kDpdyCoarse,
  kDpdyFine,
  kExp,
  kExp2,
  kExtractBits,
  kFaceForward,
  kFirstLeadingBit,
  kFirstTrailingBit,
  kFloor,
  kFma,
  kFract,
  kFrexp,
  kFwidth,
  kFwidthCoarse,
  kFwidthFine,
  kInverseSqrt,
  kIsFinite,
  kIsInf,
  kIsNan,
  kIsNormal,
  kLdexp,
  kLength,
  kLog,
  kLog2,
  kMax,
  kMin,
  kMix,
  kModf,
  kNormalize,
  kPack2x16float,
  kPack2x16snorm,
  kPack2x16unorm,
  kPack4x8snorm,
  kPack4x8unorm,
  kPow,
  kRadians,
  kReflect,
  kRefract,
  kReverseBits,
  kRound,
  kSelect,
  kSign,
  kSin,
  kSinh,
  kSmoothStep,
  kSqrt,
  kStep,
  kStorageBarrier,
  kTan,
  kTanh,
  kTranspose,
  kTrunc,
  kUnpack2x16float,
  kUnpack2x16snorm,
  kUnpack2x16unorm,
  kUnpack4x8snorm,
  kUnpack4x8unorm,
  kWorkgroupBarrier,
  kTextureDimensions,
  kTextureGather,
  kTextureGatherCompare,
  kTextureNumLayers,
  kTextureNumLevels,
  kTextureNumSamples,
  kTextureSample,
  kTextureSampleBias,
  kTextureSampleCompare,
  kTextureSampleCompareLevel,
  kTextureSampleGrad,
  kTextureSampleLevel,
  kTextureStore,
  kTextureLoad,
  kAtomicLoad,
  kAtomicStore,
  kAtomicAdd,
  kAtomicSub,
  kAtomicMax,
  kAtomicMin,
  kAtomicAnd,
  kAtomicOr,
  kAtomicXor,
  kAtomicExchange,
  kAtomicCompareExchangeWeak,
};

/// Matches the BuiltinType by name
/// @param name the builtin name to parse
/// @returns the parsed BuiltinType, or BuiltinType::kNone if `name` did not
/// match any builtin.
BuiltinType ParseBuiltinType(const std::string& name);

/// @returns the name of the builtin function type. The spelling, including
/// case, matches the name in the WGSL spec.
const char* str(BuiltinType i);

/// Emits the name of the builtin function type. The spelling, including case,
/// matches the name in the WGSL spec.
std::ostream& operator<<(std::ostream& out, BuiltinType i);

}  // namespace sem
}  // namespace tint

#endif  // SRC_TINT_SEM_BUILTIN_TYPE_H_
