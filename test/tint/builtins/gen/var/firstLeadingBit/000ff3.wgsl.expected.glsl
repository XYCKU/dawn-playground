#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer prevent_dce_block_1_ssbo {
  uvec4 inner;
} v;
uvec4 firstLeadingBit_000ff3() {
  uvec4 arg_0 = uvec4(1u);
  uvec4 v_1 = arg_0;
  uvec4 res = mix((mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u))) | (mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u))) | (mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u))) | (mix(uvec4(2u), uvec4(0u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u))) | mix(uvec4(1u), uvec4(0u), equal((((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) >> mix(uvec4(2u), uvec4(0u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u)))) & uvec4(2u)), uvec4(0u))))))), uvec4(4294967295u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) >> mix(uvec4(2u), uvec4(0u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u)))), uvec4(0u)));
  return res;
}
void main() {
  v.inner = firstLeadingBit_000ff3();
}
#version 310 es

layout(binding = 0, std430)
buffer prevent_dce_block_1_ssbo {
  uvec4 inner;
} v;
uvec4 firstLeadingBit_000ff3() {
  uvec4 arg_0 = uvec4(1u);
  uvec4 v_1 = arg_0;
  uvec4 res = mix((mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u))) | (mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u))) | (mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u))) | (mix(uvec4(2u), uvec4(0u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u))) | mix(uvec4(1u), uvec4(0u), equal((((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) >> mix(uvec4(2u), uvec4(0u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u)))) & uvec4(2u)), uvec4(0u))))))), uvec4(4294967295u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) >> mix(uvec4(2u), uvec4(0u), equal(((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v_1 >> mix(uvec4(16u), uvec4(0u), equal((v_1 & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u)))), uvec4(0u)));
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.inner = firstLeadingBit_000ff3();
}
#version 310 es


struct VertexOutput {
  vec4 pos;
  uvec4 prevent_dce;
};

layout(location = 0) flat out uvec4 vertex_main_loc0_Output;
uvec4 firstLeadingBit_000ff3() {
  uvec4 arg_0 = uvec4(1u);
  uvec4 v = arg_0;
  uvec4 res = mix((mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u))) | (mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u))) | (mix(uvec4(4u), uvec4(0u), equal((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u))) | (mix(uvec4(2u), uvec4(0u), equal(((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u))) | mix(uvec4(1u), uvec4(0u), equal((((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) >> mix(uvec4(2u), uvec4(0u), equal(((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u)))) & uvec4(2u)), uvec4(0u))))))), uvec4(4294967295u), equal(((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) >> mix(uvec4(2u), uvec4(0u), equal(((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) >> mix(uvec4(4u), uvec4(0u), equal((((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) >> mix(uvec4(8u), uvec4(0u), equal(((v >> mix(uvec4(16u), uvec4(0u), equal((v & uvec4(4294901760u)), uvec4(0u)))) & uvec4(65280u)), uvec4(0u)))) & uvec4(240u)), uvec4(0u)))) & uvec4(12u)), uvec4(0u)))), uvec4(0u)));
  return res;
}
VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f), uvec4(0u));
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = firstLeadingBit_000ff3();
  return tint_symbol;
}
void main() {
  VertexOutput v_1 = vertex_main_inner();
  gl_Position = v_1.pos;
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  vertex_main_loc0_Output = v_1.prevent_dce;
  gl_PointSize = 1.0f;
}
