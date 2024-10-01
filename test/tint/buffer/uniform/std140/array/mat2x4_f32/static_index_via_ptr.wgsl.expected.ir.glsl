#version 310 es

layout(binding = 0, std140)
uniform tint_symbol_1_1_ubo {
  mat2x4 tint_symbol[4];
} v;
layout(binding = 1, std430)
buffer tint_symbol_3_1_ssbo {
  float tint_symbol_2;
} v_1;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat2x4 l_a[4] = v.tint_symbol;
  mat2x4 l_a_i = v.tint_symbol[2];
  vec4 l_a_i_i = v.tint_symbol[2][1];
  v_1.tint_symbol_2 = (((v.tint_symbol[2][1].x + l_a[0][0][0u]) + l_a_i[0][0u]) + l_a_i_i[0u]);
}
