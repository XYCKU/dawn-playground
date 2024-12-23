
ByteAddressBuffer tint_symbol : register(t0);
RWByteAddressBuffer tint_symbol_1 : register(u1);
void v(uint offset, matrix<float16_t, 4, 3> obj) {
  tint_symbol_1.Store<vector<float16_t, 3> >((offset + 0u), obj[0u]);
  tint_symbol_1.Store<vector<float16_t, 3> >((offset + 8u), obj[1u]);
  tint_symbol_1.Store<vector<float16_t, 3> >((offset + 16u), obj[2u]);
  tint_symbol_1.Store<vector<float16_t, 3> >((offset + 24u), obj[3u]);
}

matrix<float16_t, 4, 3> v_1(uint offset) {
  return matrix<float16_t, 4, 3>(tint_symbol.Load<vector<float16_t, 3> >((offset + 0u)), tint_symbol.Load<vector<float16_t, 3> >((offset + 8u)), tint_symbol.Load<vector<float16_t, 3> >((offset + 16u)), tint_symbol.Load<vector<float16_t, 3> >((offset + 24u)));
}

[numthreads(1, 1, 1)]
void main() {
  v(0u, v_1(0u));
}

