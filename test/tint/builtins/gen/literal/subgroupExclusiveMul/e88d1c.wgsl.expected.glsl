SKIP: INVALID


enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<f16>;

fn subgroupExclusiveMul_e88d1c() -> vec2<f16> {
  var res : vec2<f16> = subgroupExclusiveMul(vec2<f16>(1.0h));
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupExclusiveMul_e88d1c();
}

Failed to generate: error: Unknown builtin method: 0x55b923040230
