SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn quadSwapDiagonal_348173() -> vec2<u32> {
  var res : vec2<u32> = quadSwapDiagonal(vec2<u32>(1u));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadSwapDiagonal_348173();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadSwapDiagonal_348173();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/quadSwapDiagonal/348173.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn quadSwapDiagonal_348173() -> vec2<u32> {
  var res : vec2<u32> = quadSwapDiagonal(vec2<u32>(1u));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadSwapDiagonal_348173();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadSwapDiagonal_348173();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/quadSwapDiagonal/348173.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
