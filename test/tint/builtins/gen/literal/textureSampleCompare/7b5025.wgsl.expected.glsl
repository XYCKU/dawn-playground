SKIP: FAILED

#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  float inner;
} prevent_dce;

uniform highp sampler2DArrayShadow arg_0_arg_1;

float textureSampleCompare_7b5025() {
  float res = textureOffset(arg_0_arg_1, vec4(vec3(vec2(1.0f), float(1u)), 1.0f), ivec2(1));
  return res;
}

void fragment_main() {
  prevent_dce.inner = textureSampleCompare_7b5025();
}

void main() {
  fragment_main();
  return;
}
error: Error parsing GLSL shader:
ERROR: 0:12: 'sampler' : TextureOffset does not support sampler2DArrayShadow :  ES Profile
ERROR: 0:12: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.




tint executable returned error: exit status 1
