SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint subgroupExclusiveMul_dc51f8() {
  uint res = WavePrefixProduct(1u);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, subgroupExclusiveMul_dc51f8());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, subgroupExclusiveMul_dc51f8());
}

FXC validation failure:
<scrubbed_path>(4,14-34): error X3004: undeclared identifier 'WavePrefixProduct'

