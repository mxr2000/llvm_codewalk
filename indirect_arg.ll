source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

define internal i32 @bottom(i32 %c) {  // argument c is dead here
    ret i32 1
}

define internal i32 @top(i32 %a, i32 %b, i32 %c) {
    %1 = add i32 %a, %b
    call i32 @bottom(i32 %c) // the only use of c is being the argument of function bottom
    ret i32 %1
}

define i32 @main() {
    %1 = call i32 @top(i32 1, i32 2, i32 3)
    %2 = add i32 %1, 1
    ret i32 0
}