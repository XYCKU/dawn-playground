SKIP: INVALID

RWByteAddressBuffer prevent_dce : register(u0);

uint4 subgroupShuffleXor_08f588() {
  uint4 res = WaveReadLaneAt((1u).xxxx, (WaveGetLaneIndex() ^ 1u));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupShuffleXor_08f588()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupShuffleXor_08f588()));
  return;
}
FXC validation failure:
<scrubbed_path>(4,42-59): error X3004: undeclared identifier 'WaveGetLaneIndex'

