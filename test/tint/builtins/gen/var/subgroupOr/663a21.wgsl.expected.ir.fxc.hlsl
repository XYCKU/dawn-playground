SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint3 subgroupOr_663a21() {
  uint3 arg_0 = (1u).xxx;
  uint3 res = WaveActiveBitOr(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, subgroupOr_663a21());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, subgroupOr_663a21());
}

FXC validation failure:
<scrubbed_path>(5,15-36): error X3004: undeclared identifier 'WaveActiveBitOr'

