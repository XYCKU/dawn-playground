
ByteAddressBuffer tint_symbol : register(t0);
RWByteAddressBuffer tint_symbol_1 : register(u1);
void v(uint offset, float3x2 obj) {
  tint_symbol_1.Store2((offset + 0u), asuint(obj[0u]));
  tint_symbol_1.Store2((offset + 8u), asuint(obj[1u]));
  tint_symbol_1.Store2((offset + 16u), asuint(obj[2u]));
}

float3x2 v_1(uint offset) {
  return float3x2(asfloat(tint_symbol.Load2((offset + 0u))), asfloat(tint_symbol.Load2((offset + 8u))), asfloat(tint_symbol.Load2((offset + 16u))));
}

[numthreads(1, 1, 1)]
void main() {
  v(0u, v_1(0u));
}

