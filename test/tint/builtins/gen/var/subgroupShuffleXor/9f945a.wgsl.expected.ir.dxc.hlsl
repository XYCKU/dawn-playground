
RWByteAddressBuffer prevent_dce : register(u0);
uint3 subgroupShuffleXor_9f945a() {
  uint3 arg_0 = (1u).xxx;
  uint arg_1 = 1u;
  uint3 res = WaveReadLaneAt(arg_0, (WaveGetLaneIndex() ^ arg_1));
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, subgroupShuffleXor_9f945a());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, subgroupShuffleXor_9f945a());
}

