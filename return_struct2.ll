; ModuleID = './return_struct.ll'
source_filename = "ade.ll"
target triple = "x86_64-apple-darwin21.2.0"

%Foo = type { i32, i32, i32 }

define internal { i32, i32 } @bottom(%Foo* %p) {
  %1 = load %Foo, %Foo* %p, align 4
  %oldret = extractvalue %Foo %1, 0
  %newret = insertvalue { i32, i32 } undef, i32 %oldret, 0
  %oldret1 = extractvalue %Foo %1, 1
  %newret2 = insertvalue { i32, i32 } %newret, i32 %oldret1, 1
  ret { i32, i32 } %newret2
}

define internal i32 @top() {
  %p = alloca %Foo, align 8
  %ret = call { i32, i32 } @bottom(%Foo* %p)
  %newret = extractvalue { i32, i32 } %ret, 0
  %oldret = insertvalue %Foo undef, i32 %newret, 0
  %newret1 = extractvalue { i32, i32 } %ret, 1
  %oldret2 = insertvalue %Foo %oldret, i32 %newret1, 1
  %1 = extractvalue %Foo %oldret2, 0
  %2 = extractvalue %Foo %oldret2, 1
  %3 = add i32 %1, %2
  ret i32 %3
}

define i32 @main() {
  %1 = call i32 @top()
  %2 = add i32 %1, 1
  ret i32 0
}
