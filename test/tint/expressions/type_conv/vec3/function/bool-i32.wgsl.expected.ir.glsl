#version 310 es

bool t = false;
bvec3 m() {
  t = true;
  return bvec3(t);
}
void f() {
  ivec3 v = ivec3(m());
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
