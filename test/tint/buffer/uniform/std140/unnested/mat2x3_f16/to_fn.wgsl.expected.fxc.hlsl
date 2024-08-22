SKIP: INVALID

cbuffer cbuffer_u : register(b0) {
  uint4 u[1];
};

void a(matrix<float16_t, 2, 3> m) {
}

void b(vector<float16_t, 3> v) {
}

void c(float16_t f_1) {
}

matrix<float16_t, 2, 3> u_load(uint offset) {
  const uint scalar_offset = ((offset + 0u)) / 4;
  uint4 ubo_load_1 = u[scalar_offset / 4];
  uint2 ubo_load = ((scalar_offset & 2) ? ubo_load_1.zw : ubo_load_1.xy);
  vector<float16_t, 2> ubo_load_xz = vector<float16_t, 2>(f16tof32(ubo_load & 0xFFFF));
  float16_t ubo_load_y = f16tof32(ubo_load[0] >> 16);
  const uint scalar_offset_1 = ((offset + 8u)) / 4;
  uint4 ubo_load_3 = u[scalar_offset_1 / 4];
  uint2 ubo_load_2 = ((scalar_offset_1 & 2) ? ubo_load_3.zw : ubo_load_3.xy);
  vector<float16_t, 2> ubo_load_2_xz = vector<float16_t, 2>(f16tof32(ubo_load_2 & 0xFFFF));
  float16_t ubo_load_2_y = f16tof32(ubo_load_2[0] >> 16);
  return matrix<float16_t, 2, 3>(vector<float16_t, 3>(ubo_load_xz[0], ubo_load_y, ubo_load_xz[1]), vector<float16_t, 3>(ubo_load_2_xz[0], ubo_load_2_y, ubo_load_2_xz[1]));
}

[numthreads(1, 1, 1)]
void f() {
  a(u_load(0u));
  uint2 ubo_load_4 = u[0].zw;
  vector<float16_t, 2> ubo_load_4_xz = vector<float16_t, 2>(f16tof32(ubo_load_4 & 0xFFFF));
  float16_t ubo_load_4_y = f16tof32(ubo_load_4[0] >> 16);
  b(vector<float16_t, 3>(ubo_load_4_xz[0], ubo_load_4_y, ubo_load_4_xz[1]));
  uint2 ubo_load_5 = u[0].zw;
  vector<float16_t, 2> ubo_load_5_xz = vector<float16_t, 2>(f16tof32(ubo_load_5 & 0xFFFF));
  float16_t ubo_load_5_y = f16tof32(ubo_load_5[0] >> 16);
  b(vector<float16_t, 3>(ubo_load_5_xz[0], ubo_load_5_y, ubo_load_5_xz[1]).zxy);
  c(float16_t(f16tof32(((u[0].z) & 0xFFFF))));
  uint2 ubo_load_6 = u[0].zw;
  vector<float16_t, 2> ubo_load_6_xz = vector<float16_t, 2>(f16tof32(ubo_load_6 & 0xFFFF));
  float16_t ubo_load_6_y = f16tof32(ubo_load_6[0] >> 16);
  c(vector<float16_t, 3>(ubo_load_6_xz[0], ubo_load_6_y, ubo_load_6_xz[1]).zxy.x);
  return;
}
FXC validation failure:
<scrubbed_path>(5,15-23): error X3000: syntax error: unexpected token 'float16_t'
<scrubbed_path>(8,15-23): error X3000: syntax error: unexpected token 'float16_t'
<scrubbed_path>(11,8-16): error X3000: unrecognized identifier 'float16_t'

