#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  uvec2 tint_symbol;
} v;
uvec2 select_1e960b() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 arg_1 = uvec2(1u);
  bvec2 arg_2 = bvec2(true);
  uvec2 v_1 = arg_0;
  uvec2 v_2 = arg_1;
  bvec2 v_3 = arg_2;
  uint v_4 = ((v_3.x) ? (v_2.x) : (v_1.x));
  uvec2 res = uvec2(v_4, ((v_3.y) ? (v_2.y) : (v_1.y)));
  return res;
}
void main() {
  v.tint_symbol = select_1e960b();
}
#version 310 es

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  uvec2 tint_symbol;
} v;
uvec2 select_1e960b() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 arg_1 = uvec2(1u);
  bvec2 arg_2 = bvec2(true);
  uvec2 v_1 = arg_0;
  uvec2 v_2 = arg_1;
  bvec2 v_3 = arg_2;
  uint v_4 = ((v_3.x) ? (v_2.x) : (v_1.x));
  uvec2 res = uvec2(v_4, ((v_3.y) ? (v_2.y) : (v_1.y)));
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol = select_1e960b();
}
#version 310 es


struct VertexOutput {
  vec4 pos;
  uvec2 prevent_dce;
};

layout(location = 0) flat out uvec2 vertex_main_loc0_Output;
uvec2 select_1e960b() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 arg_1 = uvec2(1u);
  bvec2 arg_2 = bvec2(true);
  uvec2 v = arg_0;
  uvec2 v_1 = arg_1;
  bvec2 v_2 = arg_2;
  uint v_3 = ((v_2.x) ? (v_1.x) : (v.x));
  uvec2 res = uvec2(v_3, ((v_2.y) ? (v_1.y) : (v.y)));
  return res;
}
VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f), uvec2(0u));
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = select_1e960b();
  return tint_symbol;
}
void main() {
  VertexOutput v_4 = vertex_main_inner();
  gl_Position = v_4.pos;
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  vertex_main_loc0_Output = v_4.prevent_dce;
  gl_PointSize = 1.0f;
}
