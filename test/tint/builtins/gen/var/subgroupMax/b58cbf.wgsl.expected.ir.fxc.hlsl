SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint subgroupMax_b58cbf() {
  uint arg_0 = 1u;
  uint res = WaveActiveMax(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, subgroupMax_b58cbf());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, subgroupMax_b58cbf());
}

FXC validation failure:
<scrubbed_path>(5,14-33): error X3004: undeclared identifier 'WaveActiveMax'

