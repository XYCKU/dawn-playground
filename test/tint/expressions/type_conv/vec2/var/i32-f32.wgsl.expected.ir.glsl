#version 310 es

ivec2 u = ivec2(1);
void f() {
  vec2 v = vec2(u);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
