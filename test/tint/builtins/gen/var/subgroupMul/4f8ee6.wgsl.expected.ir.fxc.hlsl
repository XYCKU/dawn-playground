SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint subgroupMul_4f8ee6() {
  uint arg_0 = 1u;
  uint res = WaveActiveProduct(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, subgroupMul_4f8ee6());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, subgroupMul_4f8ee6());
}

FXC validation failure:
<scrubbed_path>(5,14-37): error X3004: undeclared identifier 'WaveActiveProduct'

