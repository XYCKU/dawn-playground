struct VertexOutput {
  float4 pos;
  int3 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation int3 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
int3 extractBits_e04f5d() {
  int3 arg_0 = (int(1)).xxx;
  uint arg_1 = 1u;
  uint arg_2 = 1u;
  int3 v = arg_0;
  uint v_1 = min(arg_1, 32u);
  uint v_2 = (32u - min(32u, (v_1 + arg_2)));
  int3 v_3 = (((v_2 < 32u)) ? ((v << uint3((v_2).xxx))) : ((int(0)).xxx));
  int3 res = ((((v_2 + v_1) < 32u)) ? ((v_3 >> uint3(((v_2 + v_1)).xxx))) : (((v_3 >> (31u).xxx) >> (1u).xxx)));
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(extractBits_e04f5d()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(extractBits_e04f5d()));
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = extractBits_e04f5d();
  VertexOutput v_4 = tint_symbol;
  return v_4;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_5 = vertex_main_inner();
  vertex_main_outputs v_6 = {v_5.prevent_dce, v_5.pos};
  return v_6;
}

