SKIP: INVALID

[numthreads(1, 1, 1)]
void unused_entry_point() {
  return;
}

static float2x2 u = float2x2(float2(1.0f, 2.0f), float2(3.0f, 4.0f));

void f() {
  matrix<float16_t, 2, 2> v = matrix<float16_t, 2, 2>(u);
}
FXC validation failure:
<scrubbed_path>(9,10-18): error X3000: syntax error: unexpected token 'float16_t'

