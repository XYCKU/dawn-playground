@group(0) @binding(0) var<storage, read_write> S : i32;

fn func(pointer : ptr<storage, i32, read_write>) {
  *(pointer) = 42;
}

@compute @workgroup_size(1)
fn main() {
  func(&(S));
}
