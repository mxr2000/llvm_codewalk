; ModuleID = './indirect_arg.ll'
source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

define internal void @bottom() {
  ret void
}

define internal i32 @top(i32 %a, i32 %b) {
  %1 = add i32 %a, %b
  call void @bottom()
  ret i32 %1
}

define i32 @main() {
  %1 = call i32 @top(i32 1, i32 2)
  %2 = add i32 %1, 1
  ret i32 0
}
