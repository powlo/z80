quit -sim
do compile.do
vsim z80_tb behavioural
log -r *
do wave.do