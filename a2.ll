; ModuleID = './a.ll'
source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

define i32 @foo(i32 %a, i32 %b, i32 %c) {
  %1 = add i32 %a, %b
  ret i32 %1
}

define i32 @foo2(i32 %a, i32 %b, i32 %c) {
  %1 = call i32 @foo(i32 %a, i32 %b, i32 undef)
  ret i32 %1
}

define internal void @foo3(i32 %a, i32 %b) {
  %1 = add i32 %a, %b
  ret void
}

define i32 @main() {
  %1 = call i32 @foo(i32 1, i32 2, i32 undef)
  %2 = call i32 @foo2(i32 1, i32 2, i32 undef)
  call void @foo3(i32 1, i32 2)
  ret i32 0
}
