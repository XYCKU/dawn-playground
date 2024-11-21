#version 310 es

shared int v;
void tint_symbol_inner(uint tint_local_index) {
  if ((tint_local_index < 1u)) {
    v = 0;
  }
  barrier();
  int i = v;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol_inner(gl_LocalInvocationIndex);
}
