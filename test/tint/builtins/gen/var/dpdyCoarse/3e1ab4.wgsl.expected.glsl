#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer prevent_dce_block_1_ssbo {
  vec2 inner;
} v;
vec2 dpdyCoarse_3e1ab4() {
  vec2 arg_0 = vec2(1.0f);
  vec2 res = dFdy(arg_0);
  return res;
}
void main() {
  v.inner = dpdyCoarse_3e1ab4();
}
