
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2D<float4> arg_0 : register(u0, space1);
uint2 textureDimensions_1e4024() {
  uint2 v = (0u).xx;
  arg_0.GetDimensions(v.x, v.y);
  uint2 res = v;
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, textureDimensions_1e4024());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, textureDimensions_1e4024());
}

