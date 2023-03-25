; ModuleID = './discarded_return_indirect.ll'
source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

define internal void @bottom() {
  ret void
}

define internal void @top(i32 %a, i32 %b) {
  %1 = add i32 %a, %b
  ret void
}

define i32 @main() {
  call void @top(i32 1, i32 2)
  call void @bottom()
  ret i32 0
}
