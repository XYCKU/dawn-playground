SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint2 subgroupExclusiveAdd_48acea() {
  uint2 res = WavePrefixSum((1u).xx);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, subgroupExclusiveAdd_48acea());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, subgroupExclusiveAdd_48acea());
}

FXC validation failure:
<scrubbed_path>(4,15-36): error X3004: undeclared identifier 'WavePrefixSum'

