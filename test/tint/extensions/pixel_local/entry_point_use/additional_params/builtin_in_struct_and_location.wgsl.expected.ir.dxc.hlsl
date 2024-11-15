struct PixelLocal {
  uint a;
  int b;
  float c;
};

struct In {
  float4 pos;
};

struct f_inputs {
  float4 uv : TEXCOORD0;
  float4 In_pos : SV_Position;
};


static PixelLocal P = (PixelLocal)0;
RasterizerOrderedTexture2D<uint4> pixel_local_a : register(u1);
RasterizerOrderedTexture2D<int4> pixel_local_b : register(u6);
RasterizerOrderedTexture2D<float4> pixel_local_c : register(u3);
uint tint_f32_to_u32(float value) {
  return (((value <= 4294967040.0f)) ? ((((value >= 0.0f)) ? (uint(value)) : (0u))) : (4294967295u));
}

void f_inner(In tint_symbol, float4 uv) {
  uint v = tint_f32_to_u32(tint_symbol.pos.x);
  uint v_1 = (v + tint_f32_to_u32(uv.x));
  P.a = (P.a + v_1);
}

void f(f_inputs inputs) {
  uint2 v_2 = uint2(inputs.In_pos.xy);
  P.a = pixel_local_a.Load(v_2).x;
  P.b = pixel_local_b.Load(v_2).x;
  P.c = pixel_local_c.Load(v_2).x;
  In v_3 = {float4(inputs.In_pos.xyz, (1.0f / inputs.In_pos.w))};
  f_inner(v_3, inputs.uv);
  pixel_local_a[v_2] = P.a.xxxx;
  pixel_local_b[v_2] = P.b.xxxx;
  pixel_local_c[v_2] = P.c.xxxx;
}

