SKIP: INVALID

RWByteAddressBuffer prevent_dce : register(u0);

uint3 subgroupShuffle_4cbb69() {
  uint3 arg_0 = (1u).xxx;
  int arg_1 = 1;
  uint3 res = WaveReadLaneAt(arg_0, arg_1);
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffle_4cbb69()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffle_4cbb69()));
  return;
}
FXC validation failure:
<scrubbed_path>(6,15-42): error X3004: undeclared identifier 'WaveReadLaneAt'

