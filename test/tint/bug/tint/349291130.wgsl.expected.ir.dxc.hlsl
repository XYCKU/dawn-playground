
Texture2D<float4> tint_symbol : register(t0);
[numthreads(6, 1, 1)]
void e() {
  {
    uint3 v = (0u).xxx;
    tint_symbol.GetDimensions(0u, v.x, v.y, v.z);
    uint level = v.z;
    while(true) {
      if ((level > 0u)) {
      } else {
        break;
      }
      {
      }
      continue;
    }
  }
}

