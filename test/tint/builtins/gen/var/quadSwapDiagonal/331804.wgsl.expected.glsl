SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

fn quadSwapDiagonal_331804() -> vec4<f32> {
  var arg_0 = vec4<f32>(1.0f);
  var res : vec4<f32> = quadSwapDiagonal(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadSwapDiagonal_331804();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadSwapDiagonal_331804();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/quadSwapDiagonal/331804.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

fn quadSwapDiagonal_331804() -> vec4<f32> {
  var arg_0 = vec4<f32>(1.0f);
  var res : vec4<f32> = quadSwapDiagonal(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadSwapDiagonal_331804();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadSwapDiagonal_331804();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/quadSwapDiagonal/331804.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

