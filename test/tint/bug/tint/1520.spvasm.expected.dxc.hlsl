int4 tint_div(int4 lhs, int4 rhs) {
  return (lhs / (((rhs == (0).xxxx) | ((lhs == (-2147483648).xxxx) & (rhs == (-1).xxxx))) ? (1).xxxx : rhs));
}

cbuffer cbuffer_x_4 : register(b0, space0) {
  uint4 x_4[7];
};
static float4 sk_FragColor = float4(0.0f, 0.0f, 0.0f, 0.0f);
static bool sk_Clockwise = false;
static float4 vcolor_S0 = float4(0.0f, 0.0f, 0.0f, 0.0f);

bool test_int_S1_c0_b() {
  int unknown = 0;
  bool ok = false;
  int4 val = int4(0, 0, 0, 0);
  bool x_40 = false;
  bool x_41 = false;
  bool x_54 = false;
  bool x_55 = false;
  bool x_65 = false;
  bool x_66 = false;
  const float x_26 = asfloat(x_4[1].x);
  const int x_27 = int(x_26);
  unknown = x_27;
  ok = true;
  x_41 = false;
  if (true) {
    const int4 tint_symbol_3 = tint_div((0).xxxx, int4(x_27, x_27, x_27, x_27));
    x_40 = all((tint_symbol_3 == (0).xxxx));
    x_41 = x_40;
  }
  ok = x_41;
  const int4 x_44 = int4(x_27, x_27, x_27, x_27);
  val = x_44;
  const int4 x_47 = (x_44 + (1).xxxx);
  val = x_47;
  const int4 x_48 = (x_47 - (1).xxxx);
  val = x_48;
  const int4 x_49 = (x_48 + (1).xxxx);
  val = x_49;
  const int4 x_50 = (x_49 - (1).xxxx);
  val = x_50;
  x_55 = false;
  if (x_41) {
    x_54 = all((x_50 == x_44));
    x_55 = x_54;
  }
  ok = x_55;
  const int4 x_58 = (x_50 * (2).xxxx);
  val = x_58;
  const int4 x_59 = tint_div(x_58, (2).xxxx);
  val = x_59;
  const int4 x_60 = (x_59 * (2).xxxx);
  val = x_60;
  const int4 x_61 = tint_div(x_60, (2).xxxx);
  val = x_61;
  x_66 = false;
  if (x_55) {
    x_65 = all((x_61 == x_44));
    x_66 = x_65;
  }
  ok = x_66;
  return x_66;
}

void main_1() {
  float4 outputColor_S0 = float4(0.0f, 0.0f, 0.0f, 0.0f);
  float4 output_S1 = float4(0.0f, 0.0f, 0.0f, 0.0f);
  float x_8_unknown = 0.0f;
  bool x_9_ok = false;
  float4 x_10_val = float4(0.0f, 0.0f, 0.0f, 0.0f);
  float4 x_116 = float4(0.0f, 0.0f, 0.0f, 0.0f);
  bool x_86 = false;
  bool x_87 = false;
  bool x_99 = false;
  bool x_100 = false;
  bool x_110 = false;
  bool x_111 = false;
  bool x_114 = false;
  bool x_115 = false;
  const float4 x_72 = vcolor_S0;
  outputColor_S0 = x_72;
  const float x_77 = asfloat(x_4[1].x);
  x_8_unknown = x_77;
  x_9_ok = true;
  x_87 = false;
  if (true) {
    x_86 = all((((0.0f).xxxx / float4(x_77, x_77, x_77, x_77)) == (0.0f).xxxx));
    x_87 = x_86;
  }
  x_9_ok = x_87;
  const float4 x_89 = float4(x_77, x_77, x_77, x_77);
  x_10_val = x_89;
  const float4 x_92 = (x_89 + (1.0f).xxxx);
  x_10_val = x_92;
  const float4 x_93 = (x_92 - (1.0f).xxxx);
  x_10_val = x_93;
  const float4 x_94 = (x_93 + (1.0f).xxxx);
  x_10_val = x_94;
  const float4 x_95 = (x_94 - (1.0f).xxxx);
  x_10_val = x_95;
  x_100 = false;
  if (x_87) {
    x_99 = all((x_95 == x_89));
    x_100 = x_99;
  }
  x_9_ok = x_100;
  const float4 x_103 = (x_95 * (2.0f).xxxx);
  x_10_val = x_103;
  const float4 x_104 = (x_103 / (2.0f).xxxx);
  x_10_val = x_104;
  const float4 x_105 = (x_104 * (2.0f).xxxx);
  x_10_val = x_105;
  const float4 x_106 = (x_105 / (2.0f).xxxx);
  x_10_val = x_106;
  x_111 = false;
  if (x_100) {
    x_110 = all((x_106 == x_89));
    x_111 = x_110;
  }
  x_9_ok = x_111;
  x_115 = false;
  if (x_111) {
    x_114 = test_int_S1_c0_b();
    x_115 = x_114;
  }
  if (x_115) {
    const float4 x_122 = asfloat(x_4[3]);
    x_116 = x_122;
  } else {
    const float4 x_124 = asfloat(x_4[2]);
    x_116 = x_124;
  }
  const float4 x_125 = x_116;
  output_S1 = x_125;
  sk_FragColor = x_125;
  return;
}

struct main_out {
  float4 sk_FragColor_1;
};
struct tint_symbol_1 {
  float4 vcolor_S0_param : TEXCOORD0;
  bool sk_Clockwise_param : SV_IsFrontFace;
};
struct tint_symbol_2 {
  float4 sk_FragColor_1 : SV_Target0;
};

main_out main_inner(bool sk_Clockwise_param, float4 vcolor_S0_param) {
  sk_Clockwise = sk_Clockwise_param;
  vcolor_S0 = vcolor_S0_param;
  main_1();
  const main_out tint_symbol_6 = {sk_FragColor};
  return tint_symbol_6;
}

tint_symbol_2 main(tint_symbol_1 tint_symbol) {
  const main_out inner_result = main_inner(tint_symbol.sk_Clockwise_param, tint_symbol.vcolor_S0_param);
  tint_symbol_2 wrapper_result = (tint_symbol_2)0;
  wrapper_result.sk_FragColor_1 = inner_result.sk_FragColor_1;
  return wrapper_result;
}
