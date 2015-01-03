add wave  z80_tb/inst_z80/clk
add wave  z80_tb/INST_Z80/RESET_n 
add wave  -hex z80_tb/INST_Z80/ADDRESS 
add wave  -hex z80_tb/INST_Z80/DATA 
add wave  z80_tb/INST_Z80/M1_n 
add wave  z80_tb/INST_Z80/RFSH_n 
add wave  z80_tb/INST_Z80/MREQ_n 
add wave  z80_tb/INST_Z80/IOREQ_n 
add wave  z80_tb/INST_Z80/RD_n
add wave  z80_tb/INST_Z80/WR_n 
add wave  z80_tb/INST_Z80/HALT_n 
add wave  z80_tb/INST_Z80/WAIT_n 
add wave  z80_tb/INST_Z80/INT_n
add wave  z80_tb/INST_Z80/NMI_n 
add wave  z80_tb/INST_Z80/BUSREQ_n 
add wave  z80_tb/INST_Z80/BUSACK_n

add wave  z80_tb/inst_z80/inst_control/instruction
add wave  z80_tb/INST_Z80/INST_ALU/COMMAND
add wave  -hex z80_tb/INST_Z80/BC_REG 
add wave  -hex z80_tb/INST_Z80/DE_REG 
add wave  -hex z80_tb/INST_Z80/HL_REG 
add wave  -hex z80_tb/INST_Z80/PC_REG 
add wave  -hex z80_tb/INST_Z80/SP_REG 
add wave  -hex z80_tb/INST_Z80/TT_REG
add wave  -hex z80_tb/inst_z80/IX_REG
add wave  -hex z80_tb/inst_z80/IY_REG

add wave  -hex z80_tb/INST_Z80/INST_ALU/A_Register
add wave  -hex z80_tb/INST_Z80/INST_ALU/T_Register
add wave  -hex z80_tb/INST_Z80/INST_ALU/F_Register
add wave  -hex z80_tb/INST_Z80/INST_ALU/G_Register
add wave  -hex z80_tb/INST_Z80/INST_ALU/Op1
add wave  -hex z80_tb/INST_Z80/INST_ALU/Op2
add wave  -hex z80_tb/INST_Z80/INST_ALU/RESULT