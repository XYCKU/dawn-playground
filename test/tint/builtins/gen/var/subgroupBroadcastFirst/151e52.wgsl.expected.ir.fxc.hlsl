SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
float16_t subgroupBroadcastFirst_151e52() {
  float16_t arg_0 = float16_t(1.0h);
  float16_t res = WaveReadLaneFirst(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store<float16_t>(0u, subgroupBroadcastFirst_151e52());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<float16_t>(0u, subgroupBroadcastFirst_151e52());
}

FXC validation failure:
<scrubbed_path>(3,1-9): error X3000: unrecognized identifier 'float16_t'

