SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupBroadcast_e275c8() -> vec3<i32> {
  var res : vec3<i32> = subgroupBroadcast(vec3<i32>(1i), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_e275c8();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_e275c8();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/e275c8.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupBroadcast_e275c8() -> vec3<i32> {
  var res : vec3<i32> = subgroupBroadcast(vec3<i32>(1i), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_e275c8();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_e275c8();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/e275c8.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
