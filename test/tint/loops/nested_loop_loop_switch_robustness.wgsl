// flags: --transform robustness
@compute @workgroup_size(1)
fn main() {
  for (var i = 0; i < 2; i += 2) {
    for (var j = 0; j < 2; j += 2) {
      switch(i) {
        case 0: {
          continue;
        }
        default: {
        }
      }
    }
  }
}
