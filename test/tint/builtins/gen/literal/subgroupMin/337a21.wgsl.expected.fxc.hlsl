SKIP: INVALID

RWByteAddressBuffer prevent_dce : register(u0);

uint3 subgroupMin_337a21() {
  uint3 res = WaveActiveMin((1u).xxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(subgroupMin_337a21()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(subgroupMin_337a21()));
  return;
}
FXC validation failure:
<scrubbed_path>(4,15-37): error X3004: undeclared identifier 'WaveActiveMin'

