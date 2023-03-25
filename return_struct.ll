source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

%Foo = type {
    i32,
    i32,
    i32
}

define internal %Foo @bottom(%Foo* %p) {  
    %1 = load %Foo, %Foo* %p
    ret %Foo %1
}

define internal i32 @top() {
    %p = alloca %Foo
    %ret = call %Foo @bottom(%Foo* %p)
    %1 = extractvalue %Foo %ret, 0
    %2 = extractvalue %Foo %ret, 1
    %3 = add i32 %1, %2
    ret i32 %3
}

define i32 @main() {
    %1 = call i32 @top()
    %2 = add i32 %1, 1
    ret i32 0
}