SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint2 subgroupOr_aa74f7() {
  uint2 arg_0 = (1u).xx;
  uint2 res = WaveActiveBitOr(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, subgroupOr_aa74f7());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, subgroupOr_aa74f7());
}

FXC validation failure:
<scrubbed_path>(5,15-36): error X3004: undeclared identifier 'WaveActiveBitOr'

