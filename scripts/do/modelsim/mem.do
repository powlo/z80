onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/address
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/data
add wave -noupdate -format Logic /z80_tb/inst_z80/m1_n
add wave -noupdate -format Logic /z80_tb/inst_z80/rfsh_n
add wave -noupdate -format Logic /z80_tb/inst_z80/mreq_n
add wave -noupdate -format Logic /z80_tb/inst_z80/ioreq_n
add wave -noupdate -format Logic /z80_tb/inst_z80/rd_n
add wave -noupdate -format Logic /z80_tb/inst_z80/wr_n
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_control/instruction
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_mem_interface/mem_state
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_control/inst_ir_register/clk
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_control/inst_ir_register/datain
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_control/inst_ir_register/load
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_control/inst_ir_register/nextir
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_control/inst_ir_register/read
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_control/inst_ir_register/regvalue
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_control/inst_ir_register/reset_n
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_mem_interface/address
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/busack_n
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/busreq_n
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/clk
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/core_ack
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_mem_interface/core_address
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_mem_interface/core_datain
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_mem_interface/core_dataout
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_mem_interface/core_rd
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_mem_interface/core_type
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_mem_interface/core_wr
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_mem_interface/data
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/ioreq_n
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/m1_n
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/mreq_n
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/rd_n
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_mem_interface/refresh_address
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/reset_n
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/rfsh_n
add wave -noupdate -format Logic /z80_tb/inst_z80/inst_mem_interface/wr_n
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_control/instruction
add wave -noupdate -format Literal /z80_tb/inst_z80/inst_alu/command
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/bc_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/de_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/hl_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/pc_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/sp_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/tt_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/ix_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/iy_reg
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_alu/a_register
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_alu/t_register
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_alu/f_register
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_alu/g_register
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_alu/op1
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_alu/op2
add wave -noupdate -format Literal -radix hexadecimal /z80_tb/inst_z80/inst_alu/result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {320 ns} 0}
configure wave -namecolwidth 273
configure wave -valuecolwidth 58
configure wave -justifyvalue left
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {187 ns} {408 ns}
