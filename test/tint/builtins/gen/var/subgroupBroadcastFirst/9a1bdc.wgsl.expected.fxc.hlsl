SKIP: INVALID

RWByteAddressBuffer prevent_dce : register(u0);

int subgroupBroadcastFirst_9a1bdc() {
  int arg_0 = 1;
  int res = WaveReadLaneFirst(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(subgroupBroadcastFirst_9a1bdc()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(subgroupBroadcastFirst_9a1bdc()));
  return;
}
FXC validation failure:
<scrubbed_path>(5,13-36): error X3004: undeclared identifier 'WaveReadLaneFirst'

