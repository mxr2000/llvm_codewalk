source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

define i32 @foo(i32 %a, i32 %b, i32 %c) {
    %1 = add i32 %a, %b
    ret i32 %1
}

define i32 @foo2(i32 %a, i32 %b, i32 %c) {
    %1 = call i32 @foo(i32 %a, i32 %b, i32 %c)
    ret i32 %1
}

define internal i32 @foo3(i32 %a, i32 %b, i32 %c) {
    %1 = add i32 %a, %b
    ret i32 %1
}

define i32 @main() {
    %1 = call i32 @foo(i32 1, i32 2, i32 3)
    %2 = call i32 @foo2(i32 1, i32 2, i32 3)
    %3 = call i32 @foo3(i32 1, i32 2, i32 3)
    ret i32 0
}