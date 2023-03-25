source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

define i32 @foo(i32 %a, i32 %b, i32 %c) {
    %1 = add i32 %a, %b
    ret i32 %1
}

;function signature of a non private function cannot be changed
define i32 @foo2(i32 %a, i32 %b, i32 %c) { 
    %1 = call i32 @foo(i32 %a, i32 %b, i32 %c)
    ret i32 %1
}

; function return value is never used, so change it to return void
define internal i32 @foo3(i32 %a, i32 %b, i32 %c) { 
    %1 = add i32 %a, %b
    ret i32 %1
}

define i32 @main() {
    %1 = call i32 @foo(i32 1, i32 2, i32 3)
    %2 = call i32 @foo2(i32 1, i32 2, i32 3) ;but we can change the argument to a posion value
    %3 = call i32 @foo3(i32 1, i32 2, i32 3) ;discard the return value
    ret i32 0
}