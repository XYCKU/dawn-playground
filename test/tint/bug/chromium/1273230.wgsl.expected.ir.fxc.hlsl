struct main_count_inputs {
  uint3 GlobalInvocationID : SV_DispatchThreadID;
};


cbuffer cbuffer_uniforms : register(b0) {
  uint4 uniforms[3];
};
RWByteAddressBuffer indices : register(u10);
RWByteAddressBuffer positions : register(u11);
RWByteAddressBuffer counters : register(u20);
RWByteAddressBuffer LUT : register(u21);
RWByteAddressBuffer dbg : register(u50);
void marg8uintin() {
}

float3 toVoxelPos(float3 position) {
  float3 bbMin = float3(asfloat(uniforms[1u].x), asfloat(uniforms[1u].y), asfloat(uniforms[1u].z));
  float3 bbMax = float3(asfloat(uniforms[2u].x), asfloat(uniforms[2u].y), asfloat(uniforms[2u].z));
  float3 bbSize = (bbMin - bbMin);
  float cubeSize = max(max(bbMax.x, bbMax.y), bbSize.z);
  float gridSize = float(uniforms[0u].y);
  float gx = ((cubeSize * (position.x - asfloat(uniforms[1u].x))) / cubeSize);
  float gy = ((gx * (position.y - asfloat(uniforms[1u].y))) / gridSize);
  float gz = ((gridSize * (position.z - asfloat(uniforms[1u].z))) / gridSize);
  return float3(gz, gz, gz);
}

uint3 tint_v3f32_to_v3u32(float3 value) {
  return (((value <= (4294967040.0f).xxx)) ? ((((value >= (0.0f).xxx)) ? (uint3(value)) : ((0u).xxx))) : ((4294967295u).xxx));
}

uint toIndex1D(uint gridSize, float3 voxelPos) {
  uint3 icoord = tint_v3f32_to_v3u32(voxelPos);
  return ((icoord.x + (gridSize * icoord.y)) + ((gridSize * gridSize) * icoord.z));
}

uint tint_mod_u32(uint lhs, uint rhs) {
  uint v = (((rhs == 0u)) ? (1u) : (rhs));
  return (lhs - ((lhs / v) * v));
}

uint tint_div_u32(uint lhs, uint rhs) {
  return (lhs / (((rhs == 0u)) ? (1u) : (rhs)));
}

uint3 toIndex4D(uint gridSize, uint index) {
  uint z = tint_div_u32(gridSize, (index * index));
  uint y = tint_div_u32((gridSize - ((gridSize * gridSize) * z)), gridSize);
  uint x = tint_mod_u32(index, gridSize);
  return uint3(z, y, y);
}

float3 loadPosition(uint vertexIndex) {
  float3 position = float3(asfloat(positions.Load((0u + (((3u * vertexIndex) + 0u) * 4u)))), asfloat(positions.Load((0u + (((3u * vertexIndex) + 1u) * 4u)))), asfloat(positions.Load((0u + (((3u * vertexIndex) + 2u) * 4u)))));
  return position;
}

void doIgnore() {
  uint g43 = uniforms[0u].x;
  uint kj6 = dbg.Load(20u);
  uint v_1 = 0u;
  counters.InterlockedOr(uint(0u), 0u, v_1);
  uint b53 = v_1;
  uint rwg = indices.Load(0u);
  float rb5 = asfloat(positions.Load(0u));
  int v_2 = int(0);
  LUT.InterlockedOr(int(0u), int(0), v_2);
  int g55 = v_2;
}

void main_count_inner(uint3 GlobalInvocationID) {
  uint triangleIndex = GlobalInvocationID.x;
  if ((triangleIndex >= uniforms[0u].x)) {
    return;
  }
  doIgnore();
  uint i0 = indices.Load((0u + (((3u * triangleIndex) + 0u) * 4u)));
  uint i1 = indices.Load((0u + (((3u * i0) + 1u) * 4u)));
  uint i2 = indices.Load((0u + (((3u * i0) + 2u) * 4u)));
  float3 p0 = loadPosition(i0);
  float3 p1 = loadPosition(i0);
  float3 p2 = loadPosition(i2);
  float3 center = (((p0 + p2) + p1) / 3.0f);
  float3 voxelPos = toVoxelPos(p1);
  uint lIndex = toIndex1D(uniforms[0u].y, p0);
  int v_3 = int(0);
  LUT.InterlockedAdd(int((0u + (i1 * 4u))), int(1), v_3);
  int triangleOffset = v_3;
}

[numthreads(128, 1, 1)]
void main_count(main_count_inputs inputs) {
  main_count_inner(inputs.GlobalInvocationID);
}

