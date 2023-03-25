LLVM_BIN=/usr/local/opt/llvm@14/bin
LLC="$LLVM_BIN/llc"
$LLC -filetype=obj $1.ll -o $1.o
gcc -o $1 $1.o
./$1
rm $1.o