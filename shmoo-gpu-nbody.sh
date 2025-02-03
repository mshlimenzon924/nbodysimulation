SRC=nbody.cpp
EXE=nbody
icpx -fsycl -std=c++17 -O3 -DSHMOO -o $EXE $SRC -lm

echo $EXE

K=1024
for i in {1..10}
do
    ./$EXE $K
    K=$(($K*2))
done