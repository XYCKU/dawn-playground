
cbuffer cbuffer_a : register(b0) {
  uint4 a[12];
};
RWByteAddressBuffer s : register(u1);
float3x4 v(uint start_byte_offset) {
  return float3x4(asfloat(a[(start_byte_offset / 16u)]), asfloat(a[((16u + start_byte_offset) / 16u)]), asfloat(a[((32u + start_byte_offset) / 16u)]));
}

typedef float3x4 ary_ret[4];
ary_ret v_1(uint start_byte_offset) {
  float3x4 a_1[4] = (float3x4[4])0;
  {
    uint v_2 = 0u;
    v_2 = 0u;
    while(true) {
      uint v_3 = v_2;
      if ((v_3 >= 4u)) {
        break;
      }
      a_1[v_3] = v((start_byte_offset + (v_3 * 48u)));
      {
        v_2 = (v_3 + 1u);
      }
      continue;
    }
  }
  float3x4 v_4[4] = a_1;
  return v_4;
}

[numthreads(1, 1, 1)]
void f() {
  float3x4 l_a[4] = v_1(0u);
  float3x4 l_a_i = v(96u);
  float4 l_a_i_i = asfloat(a[7u]);
  s.Store(0u, asuint((((asfloat(a[7u].x) + l_a[int(0)][int(0)].x) + l_a_i[int(0)].x) + l_a_i_i.x)));
}

