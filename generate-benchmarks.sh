#!/bin/sh

set -e

benchmarks="BlackScholes.l0 MatMultFun.l0 BabyBearFun.l0 CalibLexiFi.l0 PricingLexiFi.l0 HiperfitEgCos.l0"
dir=benchmarks

compile(){
    prog=$1
    base=$(echo $prog | sed 's/.l0$//')

    l0c -utenoehnrOehnOeheOehe --inline-map-indexes -hehe $prog > $base-fused.l0 &
    l0c -utenoenrOenOeeOee --inline-map-indexes -ee $prog > $base-optimised.l0 &
    l0c -utee $prog > $base-inlined.l0 &
    l0c -ut $prog > $base-unoptimised.l0 &
    wait
    echo "$prog done."
}

for benchmark in $benchmarks; do
    compile $dir/$benchmark &
done

wait
