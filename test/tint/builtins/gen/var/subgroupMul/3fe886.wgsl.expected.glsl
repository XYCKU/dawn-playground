SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : i32;

fn subgroupMul_3fe886() -> i32 {
  var arg_0 = 1i;
  var res : i32 = subgroupMul(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupMul_3fe886();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMul_3fe886();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/subgroupMul/3fe886.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : i32;

fn subgroupMul_3fe886() -> i32 {
  var arg_0 = 1i;
  var res : i32 = subgroupMul(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupMul_3fe886();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMul_3fe886();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/subgroupMul/3fe886.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
