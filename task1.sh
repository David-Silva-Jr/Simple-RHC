NAME="Task1Output.csv"
printf "sp x, sp y, p, z, seed, #sol, sol x, sol y, f(sol)\n" > $NAME

g++ "task1.cpp" -o running

# command line argument order: starting x, starting y, p, z, seed
# Initial parameters
P=30
Z=3
SEED=628

./running 404 504 $P $Z $SEED >> $NAME
./running 404 504 $P $Z $((SEED+1)) >> $NAME

./running 0 0.23 $P $Z $SEED >> $NAME
./running 0 0.23 $P $Z $((SEED+1)) >> $NAME

./running -200 300 $P $Z $SEED >> $NAME
./running -200 300 $P $Z $((SEED+1)) >> $NAME

./running 412 -99.9 $P $Z $SEED >> $NAME
./running 412 -99.9 $P $Z $((SEED+1)) >> $NAME

# P=250
P=250
Z=3
SEED=628

./running 404 504 $P $Z $SEED >> $NAME
./running 404 504 $P $Z $((SEED+1)) >> $NAME

./running 0 0.23 $P $Z $SEED >> $NAME
./running 0 0.23 $P $Z $((SEED+1)) >> $NAME

./running -200 300 $P $Z $SEED >> $NAME
./running -200 300 $P $Z $((SEED+1)) >> $NAME

./running 412 -99.9 $P $Z $SEED >> $NAME
./running 412 -99.9 $P $Z $((SEED+1)) >> $NAME

# P=30, Z = 0.5
P=30
Z=0.5
SEED=628

./running 404 504 $P $Z $SEED >> $NAME
./running 404 504 $P $Z $((SEED+1)) >> $NAME

./running 0 0.23 $P $Z $SEED >> $NAME
./running 0 0.23 $P $Z $((SEED+1)) >> $NAME

./running -200 300 $P $Z $SEED >> $NAME
./running -200 300 $P $Z $((SEED+1)) >> $NAME

./running 412 -99.9 $P $Z $SEED >> $NAME
./running 412 -99.9 $P $Z $((SEED+1)) >> $NAME

# P=250, Z = 0.5
P=250
Z=0.5
SEED=628

./running 404 504 $P $Z $SEED >> $NAME
./running 404 504 $P $Z $((SEED+1)) >> $NAME

./running 0 0.23 $P $Z $SEED >> $NAME
./running 0 0.23 $P $Z $((SEED+1)) >> $NAME

./running -200 300 $P $Z $SEED >> $NAME
./running -200 300 $P $Z $((SEED+1)) >> $NAME

./running 412 -99.9 $P $Z $SEED >> $NAME
./running 412 -99.9 $P $Z $((SEED+1)) >> $NAME

# 33rd run
./running 500 400 250 3 $((SEED)) >> $NAME