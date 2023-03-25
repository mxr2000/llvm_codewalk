LLVM_BIN=/usr/local/Cellar/llvm@14/14.0.6/bin
$LLVM_BIN/opt -enable-new-pm=0 -deadargelim  -S ./$1.ll > "$1"2.ll