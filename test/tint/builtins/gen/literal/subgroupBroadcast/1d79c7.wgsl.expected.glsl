SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : i32;

fn subgroupBroadcast_1d79c7() -> i32 {
  var res : i32 = subgroupBroadcast(1i, 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_1d79c7();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_1d79c7();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/1d79c7.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : i32;

fn subgroupBroadcast_1d79c7() -> i32 {
  var res : i32 = subgroupBroadcast(1i, 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_1d79c7();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_1d79c7();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/1d79c7.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

