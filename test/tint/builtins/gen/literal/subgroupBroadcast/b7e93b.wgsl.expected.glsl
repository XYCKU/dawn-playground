SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

fn subgroupBroadcast_b7e93b() -> vec4<f32> {
  var res : vec4<f32> = subgroupBroadcast(vec4<f32>(1.0f), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_b7e93b();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_b7e93b();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/b7e93b.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

fn subgroupBroadcast_b7e93b() -> vec4<f32> {
  var res : vec4<f32> = subgroupBroadcast(vec4<f32>(1.0f), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_b7e93b();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_b7e93b();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupBroadcast/b7e93b.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

