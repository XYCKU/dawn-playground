SKIP: INVALID

RWByteAddressBuffer prevent_dce : register(u0);

int3 subgroupShuffle_824702() {
  int3 res = WaveReadLaneAt((1).xxx, 1);
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffle_824702()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffle_824702()));
  return;
}
FXC validation failure:
<scrubbed_path>(4,14-39): error X3004: undeclared identifier 'WaveReadLaneAt'

