# -- an example to run SPEC 429.mcf on gem5, put it under 429.mcf folder --
export GEM5_DIR=/home/kisung/ArquitecturaComputadoresI/gem5
export BENCHMARK=./src/benchmark
export ARGUMENT=./data/inp.in

# Pueba 1
# Sitema default con memorias cache l1 y l2
# TimingSimpleCPU
# L1I y L1D = 128KB / L2 = 1MB
# Linea de cache = 64 bits
# Default : assocL1 = 2, assocL2 = 8, rp_all = LRU, tag_latencyL1 = 2, tag_latencyL2 = 20, BP = NULL, HWPL1/L2 = NULL
# Esta sera la base para todas las pruebas
time $GEM5_DIR/build/X86/gem5.opt -d ./m5out1 $GEM5_DIR/configs/example/se.py -c $BENCHMARK -o $ARGUMENT -I 100000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=128kB --l1i_size=128kB --l2_size=1MB --cacheline_size=64

# Pueba 2
#time $GEM5_DIR/build/X86/gem5.opt -d ./m5out2 $GEM5_DIR/configs/example/se.py -c $BENCHMARK -o $ARGUMENT -I 100000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=128kB --l1i_size=128kB --l1i-hwp-type=TaggedPrefetcher --l1d-hwp-type=TaggedPrefetcher --l2_size=1MB --l2-hwp-type=TaggedPrefetcher --l1d_assoc=2 --l1i_assoc=2 --l2_assoc=1 --cacheline_size=64

#time $GEM5_DIR/build/X86/gem5.opt -d ./m5out3 $GEM5_DIR/configs/example/se.py -c $BENCHMARK -o $ARGUMENT -I 100000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=128kB --l1i_size=128kB --l1i-hwp-type=TaggedPrefetcher --l1d-hwp-type=TaggedPrefetcher --l2_size=1MB --l2-hwp-type=TaggedPrefetcher --l1d_assoc=2 --l1i_assoc=2 --l2_assoc=1 --cacheline_size=64 --bp-type=TournamentBP -P 'system.cpu[0].branchPred.localPredictorSize=8192'

#time $GEM5_DIR/build/X86/gem5.opt -d ./m5out4 $GEM5_DIR/configs/example/se.py -c $BENCHMARK -o $ARGUMENT -I 100000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=128kB --l1i_size=128kB --l2_size=1MB --l1d_assoc=2 --l1i_assoc=2 --l2_assoc=1 --cacheline_size=64 --bp-type=TournamentBP --indirect-bp-type=SimpleIndirectPredictor

# time $GEM5_DIR/build/X86/gem5.opt -d ./m5out5 $GEM5_DIR/configs/example/se.py -c $BENCHMARK -o $ARGUMENT -I 100000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=128kB --l1i_size=128kB --l2_size=1MB --l1d_assoc=2 --l1i_assoc=2 --l2_assoc=1 --cacheline_size=64 --bp-type=TournamentBP --indirect-bp-type=SimpleIndirectPredictor