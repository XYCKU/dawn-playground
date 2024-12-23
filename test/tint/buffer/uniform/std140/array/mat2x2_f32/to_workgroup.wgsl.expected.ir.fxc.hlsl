struct f_inputs {
  uint tint_local_index : SV_GroupIndex;
};


cbuffer cbuffer_u : register(b0) {
  uint4 u[4];
};
groupshared float2x2 w[4];
float2x2 v(uint start_byte_offset) {
  uint4 v_1 = u[(start_byte_offset / 16u)];
  float2 v_2 = asfloat((((((start_byte_offset % 16u) / 4u) == 2u)) ? (v_1.zw) : (v_1.xy)));
  uint4 v_3 = u[((8u + start_byte_offset) / 16u)];
  return float2x2(v_2, asfloat(((((((8u + start_byte_offset) % 16u) / 4u) == 2u)) ? (v_3.zw) : (v_3.xy))));
}

typedef float2x2 ary_ret[4];
ary_ret v_4(uint start_byte_offset) {
  float2x2 a[4] = (float2x2[4])0;
  {
    uint v_5 = 0u;
    v_5 = 0u;
    while(true) {
      uint v_6 = v_5;
      if ((v_6 >= 4u)) {
        break;
      }
      a[v_6] = v((start_byte_offset + (v_6 * 16u)));
      {
        v_5 = (v_6 + 1u);
      }
      continue;
    }
  }
  float2x2 v_7[4] = a;
  return v_7;
}

void f_inner(uint tint_local_index) {
  {
    uint v_8 = 0u;
    v_8 = tint_local_index;
    while(true) {
      uint v_9 = v_8;
      if ((v_9 >= 4u)) {
        break;
      }
      w[v_9] = float2x2((0.0f).xx, (0.0f).xx);
      {
        v_8 = (v_9 + 1u);
      }
      continue;
    }
  }
  GroupMemoryBarrierWithGroupSync();
  float2x2 v_10[4] = v_4(0u);
  w = v_10;
  w[int(1)] = v(32u);
  w[int(1)][int(0)] = asfloat(u[0u].zw).yx;
  w[int(1)][int(0)].x = asfloat(u[0u].z);
}

[numthreads(1, 1, 1)]
void f(f_inputs inputs) {
  f_inner(inputs.tint_local_index);
}

