SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint subgroupMax_b58cbf() {
  uint res = WaveActiveMax(1u);
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
<scrubbed_path>(4,14-30): error X3004: undeclared identifier 'WaveActiveMax'

