SKIP: INVALID


static float16_t u = float16_t(1.0h);
uint tint_f16_to_u32(float16_t value) {
  return (((value <= float16_t(65504.0h))) ? ((((value >= float16_t(0.0h))) ? (uint(value)) : (0u))) : (4294967295u));
}

void f() {
  uint v = tint_f16_to_u32(u);
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

FXC validation failure:
<scrubbed_path>(2,8-16): error X3000: unrecognized identifier 'float16_t'

