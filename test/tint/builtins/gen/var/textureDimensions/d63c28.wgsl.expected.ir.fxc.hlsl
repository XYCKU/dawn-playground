
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<float4> arg_0 : register(u0, space1);
uint2 textureDimensions_d63c28() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint2 res = v.xy;
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, textureDimensions_d63c28());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, textureDimensions_d63c28());
}

