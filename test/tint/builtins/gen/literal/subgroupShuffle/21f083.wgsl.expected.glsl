SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn subgroupShuffle_21f083() -> vec2<u32> {
  var res : vec2<u32> = subgroupShuffle(vec2<u32>(1u), 1i);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffle_21f083();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffle_21f083();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffle/21f083.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn subgroupShuffle_21f083() -> vec2<u32> {
  var res : vec2<u32> = subgroupShuffle(vec2<u32>(1u), 1i);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffle_21f083();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffle_21f083();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffle/21f083.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
