#version 310 es


struct S {
  int arr[4];
};

layout(binding = 0, std430)
buffer tint_symbol_2_1_ssbo {
  int tint_symbol_1;
} v;
int foo() {
  int src[4] = int[4](0, 0, 0, 0);
  int dst[4] = int[4](0, 0, 0, 0);
  S dst_struct = S(int[4](0, 0, 0, 0));
  int dst_array[2][4] = int[2][4](int[4](0, 0, 0, 0), int[4](0, 0, 0, 0));
  dst_struct.arr = src;
  dst_array[1] = src;
  dst = src;
  dst_struct.arr = src;
  dst_array[0] = src;
  return ((dst[0] + dst_struct.arr[0]) + dst_array[0][0]);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol_1 = foo();
}
