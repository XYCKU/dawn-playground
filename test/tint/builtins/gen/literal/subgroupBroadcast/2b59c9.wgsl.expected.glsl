SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupBroadcast_2b59c9() -> vec3<i32> {
  var res : vec3<i32> = subgroupBroadcast(vec3<i32>(1i), 1i);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_2b59c9();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_2b59c9();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/2b59c9.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupBroadcast_2b59c9() -> vec3<i32> {
  var res : vec3<i32> = subgroupBroadcast(vec3<i32>(1i), 1i);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_2b59c9();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_2b59c9();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/2b59c9.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
