struct Particle {
  float3 position[8];
  float lifetime;
  float4 color;
  float3 velocity;
};


ByteAddressBuffer particles : register(t3, space1);
cbuffer cbuffer_sim : register(b4, space1) {
  uint4 sim[1];
};
typedef float3 ary_ret[8];
ary_ret v(uint offset) {
  float3 a[8] = (float3[8])0;
  {
    uint v_1 = 0u;
    v_1 = 0u;
    while(true) {
      uint v_2 = v_1;
      if ((v_2 >= 8u)) {
        break;
      }
      a[v_2] = asfloat(particles.Load3((offset + (v_2 * 16u))));
      {
        v_1 = (v_2 + 1u);
      }
      continue;
    }
  }
  float3 v_3[8] = a;
  return v_3;
}

Particle v_4(uint offset) {
  float3 v_5[8] = v((offset + 0u));
  Particle v_6 = {v_5, asfloat(particles.Load((offset + 128u))), asfloat(particles.Load4((offset + 144u))), asfloat(particles.Load3((offset + 160u)))};
  return v_6;
}

[numthreads(1, 1, 1)]
void main() {
  Particle particle = v_4(0u);
  uint v_7 = sim[0u].x;
  uint v_8 = sim[0u].x;
  float3 tint_array_copy[8] = particle.position;
  tint_array_copy[v_7] = particle.position[v_8];
  float3 v_9[8] = tint_array_copy;
  particle.position = v_9;
}

