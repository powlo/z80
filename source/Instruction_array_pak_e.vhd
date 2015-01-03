--File Instruction Array package for the Z80
--Date: 8 Mar 2006
--Copyright P. Backhouse 2006

--This package details what operations are performed during
--the clock cycle for that instruction
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;
use work.Instruction_list_pak.ALL;

   package Instruction_array_pak is
       
--Registers are accessed according to the following sequence.
--X = EXternal Bus
--I = Instruction
--T = Temp Register
--IXABCDEHLT

--the array has to be indexed by an abstract type because the compiler (Xilinx ISE)
--does not seem to like slv (ie the instruction itself, colN 2) as index.
constant K_Instruction_Array : T_Instruction_Array := (
--        IR (Bytecode),    Next IR,      Read/Dest   Write/Src   ALU Inst      Name

--*********************************--
--                                 --
--        8 BIT LOAD GROUP         --
--                                 --
--*********************************--
--IR (Bytecode),    Next IR,   Read/Dest   Write/Src   ALU Inst      Exch   AddrSrc   Mem Acc Type   Name
LD_A_A => ( FETCH,   FETCH, A,       A,       NULLL, NONE, X"00", PC, FETCH, "LD A, A       "),
LD_A_B => ( FETCH,   FETCH, A,       B,       NULLL, NONE, X"00", PC, FETCH, "LD A, B       "),
LD_A_C => ( FETCH,   FETCH, A,       C,       NULLL, NONE, X"00", PC, FETCH, "LD A, C       "),
LD_A_D => ( FETCH,   FETCH, A,       D,       NULLL, NONE, X"00", PC, FETCH, "LD A, D       "),
LD_A_E => ( FETCH,   FETCH, A,       E,       NULLL, NONE, X"00", PC, FETCH, "LD A, E       "),
LD_A_H => ( FETCH,   FETCH, A,       H,       NULLL, NONE, X"00", PC, FETCH, "LD A, H       "),
LD_A_L => ( FETCH,   FETCH, A,       L,       NULLL, NONE, X"00", PC, FETCH, "LD A, L       "),

LD_B_A => ( FETCH,   FETCH,   B,       A,       NULLL, NONE, X"00", PC, FETCH, "LD B, A       "),
LD_B_B => ( FETCH,   FETCH,   B,       B,       NULLL, NONE, X"00", PC, FETCH, "LD B, B       "),
LD_B_C => ( FETCH,   FETCH,   B,       C,       NULLL, NONE, X"00", PC, FETCH, "LD B, C       "),
LD_B_D => ( FETCH,   FETCH,   B,       D,       NULLL, NONE, X"00", PC, FETCH, "LD B, D       "),
LD_B_E => ( FETCH,   FETCH,   B,       E,       NULLL, NONE, X"00", PC, FETCH, "LD B, E       "),
LD_B_H => ( FETCH,   FETCH,   B,       H,       NULLL, NONE, X"00", PC, FETCH, "LD B, H       "),
LD_B_L => ( FETCH,   FETCH,   B,       L,       NULLL, NONE, X"00", PC, FETCH, "LD B, L       "),

LD_C_A => ( FETCH,   FETCH,   C,       A,       NULLL, NONE, X"00", PC, FETCH, "LD C, A       "),
LD_C_B => ( FETCH,   FETCH,   C,       B,       NULLL, NONE, X"00", PC, FETCH, "LD C, B       "),
LD_C_C => ( FETCH,   FETCH,   C,       C,       NULLL, NONE, X"00", PC, FETCH, "LD C, C       "),
LD_C_D => ( FETCH,   FETCH,   C,       D,       NULLL, NONE, X"00", PC, FETCH, "LD C, D       "),
LD_C_E => ( FETCH,   FETCH,   C,       E,       NULLL, NONE, X"00", PC, FETCH, "LD C, E       "),
LD_C_H => ( FETCH,   FETCH,   C,       H,       NULLL, NONE, X"00", PC, FETCH, "LD C, H       "),
LD_C_L => ( FETCH,   FETCH,   C,       L,       NULLL, NONE, X"00", PC, FETCH, "LD C, L       "),

LD_D_A => ( FETCH,   FETCH,   D, A, NULLL, NONE, X"00", PC, FETCH, "LD D, A       "),
LD_D_B => ( FETCH,   FETCH,   D, B, NULLL, NONE, X"00", PC, FETCH, "LD D, B       "),
LD_D_C => ( FETCH,   FETCH,   D, C, NULLL, NONE, X"00", PC, FETCH, "LD D, C       "),
LD_D_D => ( FETCH,   FETCH,   D, D, NULLL, NONE, X"00", PC, FETCH, "LD D, D       "),
LD_D_E => ( FETCH,   FETCH,   D, E, NULLL, NONE, X"00", PC, FETCH, "LD D, E       "),
LD_D_H => ( FETCH,   FETCH,   D, H, NULLL, NONE, X"00", PC, FETCH, "LD D, H       "),
LD_D_L => ( FETCH,   FETCH,   D, L, NULLL, NONE, X"00", PC, FETCH, "LD D, L       "),

LD_E_A => ( FETCH,   FETCH,   E, A, NULLL, NONE, X"00", PC, FETCH, "LD E, A       "),
LD_E_B => ( FETCH,   FETCH,   E, B, NULLL, NONE, X"00", PC, FETCH, "LD E, B       "),
LD_E_C => ( FETCH,   FETCH,   E, C, NULLL, NONE, X"00", PC, FETCH, "LD E, C       "),
LD_E_D => ( FETCH,   FETCH,   E, D, NULLL, NONE, X"00", PC, FETCH, "LD E, D       "),
LD_E_E => ( FETCH,   FETCH,   E, E, NULLL, NONE, X"00", PC, FETCH, "LD E, E       "),
LD_E_H => ( FETCH,   FETCH,   E, H, NULLL, NONE, X"00", PC, FETCH, "LD E, H       "),
LD_E_L => ( FETCH,   FETCH,   E, L, NULLL, NONE, X"00", PC, FETCH, "LD E, L       "),

LD_H_A => ( FETCH,   FETCH,   H, A, NULLL, NONE, X"00", PC, FETCH, "LD H, A       "),
LD_H_B => ( FETCH,   FETCH,   H, B, NULLL, NONE, X"00", PC, FETCH, "LD H, B       "),
LD_H_C => ( FETCH,   FETCH,   H, C, NULLL, NONE, X"00", PC, FETCH, "LD H, C       "),
LD_H_D => ( FETCH,   FETCH,   H, D, NULLL, NONE, X"00", PC, FETCH, "LD H, D       "),
LD_H_E => ( FETCH,   FETCH,   H, E, NULLL, NONE, X"00", PC, FETCH, "LD H, E       "),
LD_H_H => ( FETCH,   FETCH,   H, H, NULLL, NONE, X"00", PC, FETCH, "LD H, H       "),
LD_H_L => ( FETCH,   FETCH,   H, L, NULLL, NONE, X"00", PC, FETCH, "LD H, L       "),

LD_L_A => ( FETCH,   FETCH,   L, A, NULLL, NONE, X"00", PC, FETCH, "LD L, A       "),
LD_L_B => ( FETCH,   FETCH,   L, B, NULLL, NONE, X"00", PC, FETCH, "LD L, B       "),
LD_L_C => ( FETCH,   FETCH,   L, C, NULLL, NONE, X"00", PC, FETCH, "LD L, C       "),
LD_L_D => ( FETCH,   FETCH,   L, D, NULLL, NONE, X"00", PC, FETCH, "LD L, D       "),
LD_L_E => ( FETCH,   FETCH,   L, E, NULLL, NONE, X"00", PC, FETCH, "LD L, E       "),
LD_L_H => ( FETCH,   FETCH,   L, H, NULLL, NONE, X"00", PC, FETCH, "LD L, H       "),
LD_L_L => ( FETCH,   FETCH,   L, L, NULLL, NONE, X"00", PC, FETCH, "LD L, L       "),

LD_A_n => ( FETCH,   FETCH,   A, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD A, n       "),
LD_B_n => ( FETCH,   FETCH,   B, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD B, n       "),
LD_C_n => ( FETCH,   FETCH,   C, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD C, n       "),
LD_D_n => ( FETCH,   FETCH,   D, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD D, n       "),
LD_E_n => ( FETCH,   FETCH,   E, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD E, n       "),
LD_H_n => ( FETCH,   FETCH,   H, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD H, n       "),
LD_L_n => ( FETCH,   FETCH,   L, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD L, n       "),
 
LD_A_bHLb  => ( LD_A_bHLb2, LD_A_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "LD A, (HL)    "),
LD_A_bHLb2 => ( FETCH,      FETCH,      A,    EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LD A, (HL)(int"),

LD_A_bIXdb  => ( LD_A_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD A, (IX+d)  "),
LD_A_bIXdb2 => ( LD_A_bIXdb3, FETCH, T,    L,      ADD,   G,    X"01", PC, NONE,   "LD A, (IX+d)(i"),
LD_A_bIXdb3 => ( LD_A_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC, NONE,   "LD A, (IX+d)(i"),
LD_A_bIXdb4 => ( LD_A_bIXdb5, FETCH, T,    H,      NULLL, NONE, X"00", PC, NONE,   "LD A, (IX+d)(i"),
LD_A_bIXdb5 => ( LD_A_bIXdb6, FETCH, T,    K_H00,  ADDC,  NONE, X"00", PC, NONE,   "LD A, (IX+d)(i"),
LD_A_bIXdb6 => ( LD_A_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC, NONE,   "LD A, (IX+d)(i"),
LD_A_bIXdb7 => ( FETCH,       FETCH, A,    EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, (IX+d)(i"),

LD_B_bHLb  => ( LD_B_bHLb2, LD_B_bIXdb,   NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "LD B, (HL)    "),
LD_B_bHLb2 => ( FETCH,      FETCH,        B,    EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LD B, (HL)    "),

LD_B_bIXdb  => ( LD_B_bIXdb2, FETCH,   T,    EXTERN,  INCPC, NONE, X"00", PC, MEM_RD, "LD B, (IX+d)  "),
LD_B_bIXdb2 => ( LD_B_bIXdb3, FETCH,   T,    L,       ADD,   G,    X"01", PC, NONE,   "LD B, (IX+d)(i"),
LD_B_bIXdb3 => ( LD_B_bIXdb4, FETCH,   TT_L, T,       NULLL, NONE, X"00", PC, NONE,   "LD B, (IX+d)(i"),
LD_B_bIXdb4 => ( LD_B_bIXdb5, FETCH,   T,    H,       NULLL, NONE, X"00", PC, NONE,   "LD B, (IX+d)(i"),
LD_B_bIXdb5 => ( LD_B_bIXdb6, FETCH,   T,    K_H00,    ADDC,  NONE, X"00", PC, NONE,   "LD B, (IX+d)(i"),
LD_B_bIXdb6 => ( LD_B_bIXdb7, FETCH,   TT_H, T,       NULLL, NONE, X"00", PC, NONE,   "LD B, (IX+d)(i"),
LD_B_bIXdb7 => ( FETCH,       FETCH,   B,    EXTERN,  NULLL, NONE, X"00", TT, MEM_RD, "LD B, (IX+d)(i"),

LD_C_bHLb  => ( LD_C_bHLb2, LD_C_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "LD C, (HL)    "),
LD_C_bHLb2 => ( FETCH,      FETCH,      C,    EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LD C, (HL)(int"),

LD_C_bIXdb  => ( LD_C_bIXdb2, FETCH,   T,    EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD C, (IX+d)  "),
LD_C_bIXdb2 => ( LD_C_bIXdb3, FETCH,   T,    L,        ADD,   G,    X"01", PC, NONE,   "LD C, (IX+d)(i"),
LD_C_bIXdb3 => ( LD_C_bIXdb4, FETCH,   TT_L, T,        NULLL, NONE, X"00", PC, NONE,   "LD C, (IX+d)(i"),
LD_C_bIXdb4 => ( LD_C_bIXdb5, FETCH,   T,    H,        NULLL, NONE, X"00", PC, NONE,   "LD C, (IX+d)(i"),
LD_C_bIXdb5 => ( LD_C_bIXdb6, FETCH,   T,    K_H00,     ADDC, NONE, X"00", PC, NONE,   "LD C, (IX+d)(i"),
LD_C_bIXdb6 => ( LD_C_bIXdb7, FETCH,   TT_H, T,        NULLL, NONE, X"00", PC, NONE,   "LD C, (IX+d)(i"),
LD_C_bIXdb7 => ( FETCH,       FETCH,   C,    EXTERN,   NULLL, NONE, X"00", TT, MEM_RD, "LD C, (IX+d)(i"),

LD_D_bHLb  => ( LD_D_bHLb2, LD_D_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "LD D, (HL)    "),
LD_D_bHLb2 => ( FETCH,      FETCH,      D,    EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LD D, (HL)(int"),

LD_D_bIXdb  => ( LD_D_bIXdb2, FETCH,   T,    EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD D, (IX+d)  "),
LD_D_bIXdb2 => ( LD_D_bIXdb3, FETCH,   T,    L,        ADD,   G,    X"01", PC, NONE,   "LD D, (IX+d)(i"),
LD_D_bIXdb3 => ( LD_D_bIXdb4, FETCH,   TT_L, T,        NULLL, NONE, X"00", PC, NONE,   "LD D, (IX+d)(i"),
LD_D_bIXdb4 => ( LD_D_bIXdb5, FETCH,   T,    H,        NULLL, NONE, X"00", PC, NONE,   "LD D, (IX+d)(i"),
LD_D_bIXdb5 => ( LD_D_bIXdb6, FETCH,   T,    K_H00,    ADDC, NONE, X"00", PC, NONE,   "LD D, (IX+d)(i"),
LD_D_bIXdb6 => ( LD_D_bIXdb7, FETCH,   TT_H, T,        NULLL, NONE, X"00", PC, NONE,   "LD D, (IX+d)(i"),
LD_D_bIXdb7 => ( FETCH,       FETCH,   D,    EXTERN,   NULLL, NONE, X"00", TT, MEM_RD, "LD D, (IX+d)(i"),

LD_E_bHLb  => ( LD_E_bHLb2, LD_E_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "LD E, (HL)    "),
LD_E_bHLb2 => ( FETCH,      FETCH,      E,    EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LD E, (HL)(int"),

LD_E_bIXdb  => ( LD_E_bIXdb2, FETCH,   T,    EXTERN,  INCPC,   NONE, X"00", PC, MEM_RD, "LD E, (IX+d)  "),
LD_E_bIXdb2 => ( LD_E_bIXdb3, FETCH,   T,    L,       ADD,     G,    X"01", PC, NONE,   "LD E, (IX+d)(i"),
LD_E_bIXdb3 => ( LD_E_bIXdb4, FETCH,   TT_L, T,       NULLL,   NONE, X"00", PC, NONE,   "LD E, (IX+d)(i"),
LD_E_bIXdb4 => ( LD_E_bIXdb5, FETCH,   T,    H,       NULLL,   NONE, X"00", PC, NONE,   "LD E, (IX+d)(i"),
LD_E_bIXdb5 => ( LD_E_bIXdb6, FETCH,   T,    K_H00,   ADDC,    NONE, X"00", PC, NONE,   "LD E, (IX+d)(i"),
LD_E_bIXdb6 => ( LD_E_bIXdb7, FETCH,   TT_H, T,       NULLL,   NONE, X"00", PC, NONE,   "LD E, (IX+d)(i"),
LD_E_bIXdb7 => ( FETCH,       FETCH,   E,    EXTERN,  NULLL,   NONE, X"00", TT, MEM_RD, "LD E, (IX+d)(i"),

LD_H_bHLb  => ( LD_H_bHLb2, LD_H_bIXdb,   NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "LD H, (HL)    "),
LD_H_bHLb2 => ( FETCH,      FETCH,        H,    EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LD H, (HL)(int"),

LD_H_bIXdb  => ( LD_H_bIXdb2,   FETCH,   T,     EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "LD H, (IX+d)  "),
LD_H_bIXdb2 => ( LD_H_bIXdb3,   FETCH,   T,     L,      ADD,   G,    X"01", PC, NONE,   "LD H, (IX+d)(i"),
LD_H_bIXdb3 => ( LD_H_bIXdb4,   FETCH,   TT_L,  T,      NULLL, NONE, X"00", PC, NONE,   "LD H, (IX+d)(i"),
LD_H_bIXdb4 => ( LD_H_bIXdb5,   FETCH,   T,     H,      NULLL, NONE, X"00", PC, NONE,   "LD H, (IX+d)(i"),
LD_H_bIXdb5 => ( LD_H_bIXdb6,   FETCH,   T,    K_H00,   ADDC,  NONE, X"00", PC, NONE,   "LD H, (IX+d)(i"),
LD_H_bIXdb6 => ( LD_H_bIXdb7,   FETCH,   TT_H,  T,      NULLL, NONE, X"00", PC, NONE,   "LD H, (IX+d)(i"),
LD_H_bIXdb7 => ( FETCH,         FETCH,   H,     EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, (IX+d)(i"),

LD_L_bHLb  => ( LD_L_bHLb2, LD_L_bIXdb,   NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "LD L, (HL)    "),
LD_L_bHLb2 => ( FETCH,      FETCH,        L,    EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LD L, (HL)(int"),

LD_L_bIXdb  => ( LD_L_bIXdb2, FETCH,   T,    EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD L, (IX+d)  "),
LD_L_bIXdb2 => ( LD_L_bIXdb3, FETCH,   T,    L,        ADD,   G,    X"01", PC, NONE,   "LD L, (IX+d)(i"),
LD_L_bIXdb3 => ( LD_L_bIXdb4, FETCH,   TT_L, T,        NULLL, NONE, X"00", PC, NONE,   "LD L, (IX+d)(i"),
LD_L_bIXdb4 => ( LD_L_bIXdb5, FETCH,   T,    H,        NULLL, NONE, X"00", PC, NONE,   "LD L, (IX+d)(i"),
LD_L_bIXdb5 => ( LD_L_bIXdb6, FETCH,   T,    K_H00,    ADDC,  NONE, X"00", PC, NONE,   "LD L, (IX+d)(i"),
LD_L_bIXdb6 => ( LD_L_bIXdb7, FETCH,   TT_H, T,        NULLL, NONE, X"00", PC, NONE,   "LD L, (IX+d)(i"),
LD_L_bIXdb7 => ( FETCH,       FETCH,   L,    EXTERN,   NULLL, NONE, X"00", TT, MEM_RD, "LD L, (IX+d)(i"),

LD_bHLb_A  => ( LD_bHLb_A2, LD_bIXdb_A,   NONE,   NONE, TST_EC, NONE, X"00", PC, NONE,   "LD (HL), A    "),
LD_bHLb_A2 => ( FETCH,      FETCH,        EXTERN, A,    NULLL, NONE, X"00", HL, MEM_WR, "LD (HL), A(int"),

LD_bIXdb_A  => ( LD_bIXdb_A2, FETCH,   T,       EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD (IX+d)  A  "),
LD_bIXdb_A2 => ( LD_bIXdb_A3, FETCH,   T,       L,        ADD,   G,    X"01", PC, NONE,   "LD (IX+d)  A(i"),
LD_bIXdb_A3 => ( LD_bIXdb_A4, FETCH,   TT_L,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  A(i"),
LD_bIXdb_A4 => ( LD_bIXdb_A5, FETCH,   T,       H,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  A(i"),
LD_bIXdb_A5 => ( LD_bIXdb_A6, FETCH,   T,       K_H00,    ADDC,  F,    X"00", PC, NONE,   "LD (IX+d)  A(i"),
LD_bIXdb_A6 => ( LD_bIXdb_A7, FETCH,   TT_H,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  A(i"),
LD_bIXdb_A7 => ( FETCH,       FETCH,   EXTERN,  A,        NULLL, NONE, X"00", TT, MEM_WR, "LD (IX+d)  A(i"),

LD_bHLb_B  => ( LD_bHLb_B2, LD_bIXdb_B,   NONE,   NONE, TST_EC, NONE, X"00", PC, NONE,   "LD (HL), B    "),
LD_bHLb_B2 => ( FETCH,      FETCH,        EXTERN, B,    NULLL, NONE, X"00", HL, MEM_WR, "LD (HL), B(int"),

LD_bIXdb_B  => ( LD_bIXdb_B2, FETCH,   T,       EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD (IX+d)  B  "),
LD_bIXdb_B2 => ( LD_bIXdb_B3, FETCH,   T,       L,        ADD,   G,    X"01", PC, NONE,   "LD (IX+d)  B(i"),
LD_bIXdb_B3 => ( LD_bIXdb_B4, FETCH,   TT_L,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  B(i"),
LD_bIXdb_B4 => ( LD_bIXdb_B5, FETCH,   T,       H,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  B(i"),
LD_bIXdb_B5 => ( LD_bIXdb_B6, FETCH,   T,       K_H00,    ADDC,  F,    X"00", PC, NONE,   "LD (IX+d)  B(i"),
LD_bIXdb_B6 => ( LD_bIXdb_B7, FETCH,   TT_H,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  B(i"),
LD_bIXdb_B7 => ( FETCH,       FETCH,   EXTERN,  B,        NULLL, NONE, X"00", TT, MEM_WR, "LD (IX+d)  B(i"),
 
LD_bHLb_C  => ( LD_bHLb_C2, LD_bIXdb_C,   NONE,   NONE, TST_EC, NONE, X"00", PC, NONE,   "LD (HL), C    "),
LD_bHLb_C2 => ( FETCH,      FETCH,        EXTERN, C,    NULLL, NONE, X"00", HL, MEM_WR, "LD (HL), C(int"),

LD_bIXdb_C  => ( LD_bIXdb_C2, FETCH,   T,       EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD (IX+d)  C  "),
LD_bIXdb_C2 => ( LD_bIXdb_C3, FETCH,   T,       L,        ADD,   G,    X"01", PC, NONE,   "LD (IX+d)  C(i"),
LD_bIXdb_C3 => ( LD_bIXdb_C4, FETCH,   TT_L,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  C(i"),
LD_bIXdb_C4 => ( LD_bIXdb_C5, FETCH,   T,       H,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  C(i"),
LD_bIXdb_C5 => ( LD_bIXdb_C6, FETCH,   T,       K_H00,    ADDC,  F,    X"00", PC, NONE,   "LD (IX+d)  C(i"),
LD_bIXdb_C6 => ( LD_bIXdb_C7, FETCH,   TT_H,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  C(i"),
LD_bIXdb_C7 => ( FETCH,       FETCH,   EXTERN,  C,        NULLL, NONE, X"00", TT, MEM_WR, "LD (IX+d)  C(i"),

LD_bHLb_D  => ( LD_bHLb_D2, LD_bIXdb_D,   NONE,   NONE, TST_EC, NONE, X"00", PC, NONE,   "LD (HL), D    "),
LD_bHLb_D2 => ( FETCH,      FETCH,        EXTERN, D,    NULLL, NONE, X"00", HL, MEM_WR, "LD (HL), D(int"),

LD_bIXdb_D  => ( LD_bIXdb_D2, FETCH,   T,       EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD (IX+d)  D  "),
LD_bIXdb_D2 => ( LD_bIXdb_D3, FETCH,   T,       L,        ADD,   G,    X"01", PC, NONE,   "LD (IX+d)  D(i"),
LD_bIXdb_D3 => ( LD_bIXdb_D4, FETCH,   TT_L,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  D(i"),
LD_bIXdb_D4 => ( LD_bIXdb_D5, FETCH,   T,       H,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  D(i"),
LD_bIXdb_D5 => ( LD_bIXdb_D6, FETCH,   T,       K_H00,    ADDC,  F,    X"00", PC, NONE,   "LD (IX+d)  D(i"),
LD_bIXdb_D6 => ( LD_bIXdb_D7, FETCH,   TT_H,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  D(i"),
LD_bIXdb_D7 => ( FETCH,       FETCH,   EXTERN,  D,        NULLL,     NONE, X"00", TT, MEM_WR, "LD (IX+d)  D(i"),

LD_bHLb_E  => ( LD_bHLb_E2, LD_bIXdb_E,   NONE,   NONE, TST_EC, NONE, X"00", PC, NONE,   "LD (HL), E    "),
LD_bHLb_E2 => ( FETCH,      FETCH,        EXTERN, E,    NULLL, NONE, X"00", HL, MEM_WR, "LD (HL), E(int"),

LD_bIXdb_E  => ( LD_bIXdb_E2, FETCH,   T,       EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD (IX+d)  E  "),
LD_bIXdb_E2 => ( LD_bIXdb_E3, FETCH,   T,       L,        ADD,   G,    X"01", PC, NONE,   "LD (IX+d)  E(i"),
LD_bIXdb_E3 => ( LD_bIXdb_E4, FETCH,   TT_L,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  E(i"),
LD_bIXdb_E4 => ( LD_bIXdb_E5, FETCH,   T,       H,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  E(i"),
LD_bIXdb_E5 => ( LD_bIXdb_E6, FETCH,   T,       K_H00,    ADDC,  F,    X"00", PC, NONE,   "LD (IX+d)  E(i"),
LD_bIXdb_E6 => ( LD_bIXdb_E7, FETCH,   TT_H,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  E(i"),
LD_bIXdb_E7 => ( FETCH,       FETCH,   EXTERN,  E,        NULLL, NONE, X"00", TT, MEM_WR, "LD (IX+d)  E(i"),

LD_bHLb_H  => ( LD_bHLb_H2, LD_bIXdb_H, NONE,   NONE, TST_EC, NONE, X"00", PC, NONE,   "LD (HL), H    "),
LD_bHLb_H2 => ( FETCH,      FETCH,      EXTERN, H,    NULLL, NONE, X"00", HL, MEM_WR, "LD (HL), H(int"),

LD_bIXdb_H  => ( LD_bIXdb_H2, FETCH,   T,       EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD (IX+d)  H  "),
LD_bIXdb_H2 => ( LD_bIXdb_H3, FETCH,   T,       L,        ADD,   G,    X"01", PC, NONE,   "LD (IX+d)  H(i"),
LD_bIXdb_H3 => ( LD_bIXdb_H4, FETCH,   TT_L,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  H(i"),
LD_bIXdb_H4 => ( LD_bIXdb_H5, FETCH,   T,       H,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  H(i"),
LD_bIXdb_H5 => ( LD_bIXdb_H6, FETCH,   T,       K_H00,    ADDC,  F,    X"00", PC, NONE,   "LD (IX+d)  H(i"),
LD_bIXdb_H6 => ( LD_bIXdb_H7, FETCH,   TT_H,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  H(i"),
LD_bIXdb_H7 => ( FETCH,       FETCH,   EXTERN,  H,        NULLL, NONE, X"00", TT, MEM_WR, "LD (IX+d)  H(i"),

LD_bHLb_L  => ( LD_bHLb_L2, LD_bIXdb_L,   NONE,   NONE, TST_EC, NONE, X"00", PC, NONE,   "LD (HL), L    "),
LD_bHLb_L2 => ( FETCH,        FETCH,           EXTERN, L,    NULLL, NONE, X"00", HL, MEM_WR, "LD (HL), L(int"),

LD_bIXdb_L  => ( LD_bIXdb_L2, FETCH,   T,       EXTERN,   INCPC, NONE, X"00", PC, MEM_RD, "LD (IX+d)  L  "),
LD_bIXdb_L2 => ( LD_bIXdb_L3, FETCH,   T,       L,        ADD,   G,    X"01", PC, NONE,   "LD (IX+d)  L(i"),
LD_bIXdb_L3 => ( LD_bIXdb_L4, FETCH,   TT_L,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  L(i"),
LD_bIXdb_L4 => ( LD_bIXdb_L5, FETCH,   T,       H,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  L(i"),
LD_bIXdb_L5 => ( LD_bIXdb_L6, FETCH,   T,       K_H00,    ADDC,  F,    X"00", PC, NONE,   "LD (IX+d)  L(i"),
LD_bIXdb_L6 => ( LD_bIXdb_L7, FETCH,   TT_H,    T,        NULLL, NONE, X"00", PC, NONE,   "LD (IX+d)  L(i"),
LD_bIXdb_L7 => ( FETCH,       FETCH,   EXTERN,  L,        NULLL, NONE, X"00", TT, MEM_WR, "LD (IX+d)  L(i"),

LD_bHLb_n  => ( LD_bHLb_n2, LD_bIXdb_n, T,      EXTERN, TST_EC, NONE, X"00", PC, MEM_RD, "LD (HL),n(int)"),
LD_bHLb_n2 => ( FETCH,      FETCH,      EXTERN, T,      INCPC,  NONE, X"00", HL, MEM_WR, "LD (HL),n(int)"),

LD_bIXdb_n  => ( LD_bIXdb_n2, FETCH,   T,      L,        ADD,     G,    X"01", PC, NONE,   "LD (IX+d),n(In"),
LD_bIXdb_n2 => ( LD_bIXdb_n3, FETCH,   TT_L,   T,        INCPC,   NONE, X"00", PC, NONE,   "LD (IX+d),n(In"),
LD_bIXdb_n3 => ( LD_bIXdb_n4, FETCH,   T,      H,        NULLL,   NONE, X"00", PC, NONE,   "LD (IX+d),n(In"),
LD_bIXdb_n4 => ( LD_bIXdb_n5, FETCH,   T,      K_H00,    ADDC,    NONE, X"00", PC, NONE,   "LD (IX+d),n(In"),
LD_bIXdb_n5 => ( LD_bIXdb_n6, FETCH,   TT_H,   T,        NULLL,   NONE, X"00", PC, NONE,   "LD (IX+d),n(In"),
LD_bIXdb_n6 => ( LD_bIXdb_n7, FETCH,   T,      EXTERN,   INCPC,   NONE, X"00", PC, MEM_RD, "LD (IX+d),n(In"),
LD_bIXdb_n7 => ( FETCH,       FETCH,   EXTERN, T,        NULLL,   NONE, X"00", TT, MEM_WR, "LD (IX+d),n(In"),

LD_A_bBCb => ( FETCH,   FETCH,   A, EXTERN, NULLL, NONE, X"00", BC, MEM_RD, "LD A, (BC)    "),

LD_A_bDEb => ( FETCH,   FETCH,   A, EXTERN, NULLL, NONE, X"00", DE, MEM_RD, "LD A, (DE)    "),

LD_A_bnnb  => ( LD_A_bnnb2,   FETCH,   TT_L, EXTERN,  INCPC,   NONE, X"00", PC, MEM_RD, "LD A, (nn)    "),
LD_A_bnnb2 => ( LD_A_bnnb3,   FETCH,   TT_H, EXTERN,  INCPC,   NONE, X"00", PC, MEM_RD, "LD A,(nn)(int)"),
LD_A_bnnb3 => ( FETCH,        FETCH,   A,    EXTERN,  NULLL,   NONE, X"00", TT, MEM_RD, "LD A,(nn)(int)"),

LD_bBCb_A => ( FETCH, FETCH, EXTERN, A, NULLL, NONE, X"00", BC, MEM_WR, "LD (BC), A    "),

LD_bDEb_A => ( FETCH, FETCH, EXTERN, A, NULLL, NONE, X"00", DE, MEM_WR, "LD (DE), A    "),

LD_bnnb_A  => ( LD_bnnb_A2,   FETCH,   TT_L,      EXTERN,   INCPC, NONE, X"00", PC, MEM_RD,   "LD (nn), A    "),
LD_bnnb_A2 => ( LD_bnnb_A3,   FETCH,   TT_H,      EXTERN,   INCPC, NONE, X"00", PC, MEM_RD,   "LD (nn),A(int)"),
LD_bnnb_A3 => ( FETCH,        FETCH,   EXTERN,    A,        NULLL, NONE, X"00", TT,  MEM_WR,   "LD (nn),A(int)"),

LD_R_A    => ( FETCH,    FETCH, REFRESH, A,       NULLL, NONE, X"00", PC,  FETCH, "LD R, A       "),
LD_A_R    => ( LD_A_I2,  FETCH, A,       REFRESH, IFF,   F,    X"04", PC,  FETCH, "LD A, R       "),
LD_I_A    => ( FETCH,    FETCH, IPAGE,   A,       NULLL, NONE, X"00", PC,  FETCH, "LD I, A       "),
LD_A_I    => ( LD_A_I2,  FETCH, A,       IPAGE,   IFF,   F,    X"04", PC,  FETCH, "LD A, I       "),
LD_A_I2   => ( FETCH,    FETCH, A,       K_H00,   ORR,   F,    X"FA", PC,  FETCH, "LD A, I(int)  "),

--*********************************--
--                                 --
--   16 BIT LOAD GROUP             --
--                                 --
--*********************************--

--        IR (Bytecode),    Next IR,         Read/Dest   Write/Src   ALU Inst      Exch      AddrSrc   Mem Acc Type   Name
LD_BC_nn  => ( LD_BC_nn2,  FETCH,   C,    EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD, "LD BC, nn     "),
LD_BC_nn2 => ( FETCH,      FETCH,   B,    EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD,   "LD BC,nn (int)"),
LD_DE_nn  => ( LD_DE_nn2,  FETCH,   E,    EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD, "LD DE, nn     "),
LD_DE_nn2 => ( FETCH,      FETCH,   D,    EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD,   "LD DE,nn (int)"),
LD_HL_nn  => ( LD_HL_nn2,  FETCH,   L,    EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD, "LD HL, nn     "),
LD_HL_nn2 => ( FETCH,      FETCH,   H,    EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD,   "LD HL,nn (int)"),
LD_SP_nn  => ( LD_SP_nn2,  FETCH,   SP_L, EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD, "LD SP, nn     "),
LD_SP_nn2 => ( FETCH,      FETCH,   SP_H, EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD,   "LD SP,nn (int)"),

LD_HL_bnnb  => ( LD_HL_bnnb2, FETCH, TT_L, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "LD HL,(nn)    "),
LD_HL_bnnb2 => ( LD_HL_bnnb3, FETCH, TT_H, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD,   "LD HL,(nn)(in1"),
LD_HL_bnnb3 => ( LD_HL_bnnb4, FETCH, L,    EXTERN, INCTT, NONE, X"00", TT, MEM_RD,   "LD HL,(nn)(in2"),
LD_HL_bnnb4 => ( FETCH,       FETCH, H,    EXTERN, NULLL, NONE, X"00", TT, MEM_RD,   "LD HL,(nn)(in7"),

LD_HL2_bnnb => ( LD_HL_bnnb2, FETCH, TT_L, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "LD HL,(nn)    "),

LD_BC_bnnb  => ( LD_BC_bnnb2, FETCH,   TT_L, EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD BC,(nn)    "),
LD_BC_bnnb2 => ( LD_BC_bnnb3, FETCH,   TT_H, EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD,   "LD BC,(nn)(in1"),
LD_BC_bnnb3 => ( LD_BC_bnnb4, FETCH,   C,    EXTERN,  INCTT,   NONE, X"00", TT,  MEM_RD,   "LD BC,(nn)(in2"),
LD_BC_bnnb4 => ( FETCH,       FETCH,   B,    EXTERN,  NULLL,   NONE, X"00", TT,  MEM_RD,   "LD BC,(nn)(in7"),

LD_DE_bnnb  => ( LD_DE_bnnb2, FETCH,   TT_L, EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD DE,(nn)    "),
LD_DE_bnnb2 => ( LD_DE_bnnb3, FETCH,   TT_H, EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD DE,(nn)(in1"),
LD_DE_bnnb3 => ( LD_DE_bnnb4, FETCH,   E,    EXTERN,  INCTT,   NONE, X"00", TT,  MEM_RD, "LD DE,(nn)(in2"),
LD_DE_bnnb4 => ( FETCH,       FETCH,   D,    EXTERN,  NULLL,   NONE, X"00", TT,  MEM_RD, "LD DE,(nn)(in7"),

LD_SP_bnnb  => ( LD_SP_bnnb2, FETCH,   TT_L, EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD SP,(nn)    "),
LD_SP_bnnb2 => ( LD_SP_bnnb3, FETCH,   TT_H, EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD SP,(nn)(in1"),
LD_SP_bnnb3 => ( LD_SP_bnnb4, FETCH,   SP_L, EXTERN,  INCTT,   NONE, X"00", TT,  MEM_RD, "LD SP,(nn)(in2"),
LD_SP_bnnb4 => ( FETCH,       FETCH,   SP_H, EXTERN,  NULLL,   NONE, X"00", TT,  MEM_RD, "LD SP,(nn)(in7"),

LD_bnnb_HL  => ( LD_bnnb_HL2, FETCH,   TT_L,    EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD (nn),HL    "),
LD_bnnb_HL2 => ( LD_bnnb_HL3, FETCH,   TT_H,    EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD,   "LD (nn),HL(in1"),
LD_bnnb_HL3 => ( LD_bnnb_HL4, FETCH,   EXTERN,  L,       INCTT,   NONE, X"00", TT,  MEM_WR,   "LD (nn),HL(in2"),
LD_bnnb_HL4 => ( FETCH,       FETCH,   EXTERN,  H,       NULLL,   NONE, X"00", TT,  MEM_WR,   "LD (nn),HL(in6"),

LD_bnnb_HL_2 => ( LD_bnnb_HL2,   FETCH,   TT_L,     EXTERN,   INCPC, NONE, X"00", PC,  MEM_RD, "LD (nn),HL    "),

LD_bnnb_BC  => ( LD_bnnb_BC2, FETCH,   TT_L,    EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD (nn),BC    "),
LD_bnnb_BC2 => ( LD_bnnb_BC3, FETCH,   TT_H,    EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD,   "LD (nn),BC(in1"),
LD_bnnb_BC3 => ( LD_bnnb_BC4, FETCH,   EXTERN,  C,       INCTT,   NONE, X"00", TT,  MEM_WR,   "LD (nn),BC(in2"),
LD_bnnb_BC4 => ( FETCH,       FETCH,   EXTERN,  B,       NULLL,   NONE, X"00", TT,  MEM_WR,   "LD (nn),BC(in6"),

LD_bnnb_DE  => ( LD_bnnb_DE2, FETCH,   TT_L,    EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD, "LD (nn),DE    "),
LD_bnnb_DE2 => ( LD_bnnb_DE3, FETCH,   TT_H,    EXTERN,  INCPC,   NONE, X"00", PC,  MEM_RD,   "LD (nn),DE(in1"),
LD_bnnb_DE3 => ( LD_bnnb_DE4, FETCH,   EXTERN,  E,       INCTT,   NONE, X"00", TT,  MEM_WR,   "LD (nn),DE(in2"),
LD_bnnb_DE4 => ( FETCH,       FETCH,   EXTERN,  D,       NULLL,   NONE, X"00", TT,  MEM_WR,   "LD (nn),DE(in6"),

LD_bnnb_SP  => ( LD_bnnb_SP2, FETCH,   TT_L,   EXTERN,   INCPC,   NONE, X"00", PC,  MEM_RD, "LD (nn),SP    "),
LD_bnnb_SP2 => ( LD_bnnb_SP3, FETCH,   TT_H,   EXTERN,   INCPC,   NONE, X"00", PC,  MEM_RD,   "LD (nn),SP(in1"),
LD_bnnb_SP3 => ( LD_bnnb_SP4, FETCH,   EXTERN, SP_L,     INCTT,   NONE, X"00", TT,  MEM_WR,   "LD (nn),SP(in2"),
LD_bnnb_SP4 => ( FETCH,       FETCH,   EXTERN, SP_H,     NULLL,   NONE, X"00", TT,  MEM_WR,   "LD (nn),SP(in6"),

LD_SP_HL  => ( LD_SP_HL2,  FETCH, SP_L, L,   NULLL, NONE, X"00", PC,  FETCH, "LD SP,HL      "),
LD_SP_HL2 => ( FETCH,      FETCH, SP_H, H,   NULLL, NONE, X"00", PC,  FETCH, "LD SP,HL(int) "),

PUSH_BC  => ( PUSH_BC2, FETCH,   NONE,    NONE, DECSP,    NONE, X"00", SP,  NONE,     "PUSH BC       "),
PUSH_BC2 => ( PUSH_BC3, FETCH,   EXTERN,  B,    DECSP,    NONE, X"00", SP,  MEM_WR, "PUSH BC(int)  "),
PUSH_BC3 => ( FETCH,    FETCH,   EXTERN,  C,    NULLL,    NONE, X"00", SP,  MEM_WR, "PUSH BC(int)  "),
PUSH_DE  => ( PUSH_DE2, FETCH,   NONE,    NONE, DECSP,    NONE, X"00", SP,  NONE,     "PUSH DE       "),
PUSH_DE2 => ( PUSH_DE3, FETCH,   EXTERN,  D,    DECSP,    NONE, X"00", SP,  MEM_WR, "PUSH DE(int)  "),
PUSH_DE3 => ( FETCH,    FETCH,   EXTERN,  E,    NULLL,    NONE, X"00", SP,  MEM_WR, "PUSH DE(int)  "),
PUSH_HL  => ( PUSH_HL2, FETCH,   NONE,    NONE, DECSP,    NONE, X"00", SP,  NONE,     "PUSH HL       "),
PUSH_HL2 => ( PUSH_HL3, FETCH,   EXTERN,  H,    DECSP,    NONE, X"00", SP,  MEM_WR, "PUSH HL(int)  "),
PUSH_HL3 => ( FETCH,    FETCH,   EXTERN,  L,    NULLL,    NONE, X"00", SP,  MEM_WR, "PUSH HL(int)  "),
PUSH_AF  => ( PUSH_AF2, FETCH,   NONE,    NONE, DECSP,    NONE, X"00", SP,  NONE,     "PUSH AF       "),
PUSH_AF2 => ( PUSH_AF3, FETCH,   EXTERN,  A,    DECSP,    NONE, X"00", SP,  MEM_WR, "PUSH AF(int)  "),
PUSH_AF3 => ( FETCH,    FETCH,   EXTERN,  F,    NULLL,    NONE, X"00", SP,  MEM_WR, "PUSH AF(int)  "),

POP_BC  => ( POP_BC2,   FETCH,   C,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP BC        "),
POP_BC2 => ( FETCH,     FETCH,   B,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP BC(int)   "),
POP_DE  => ( POP_DE2,   FETCH,   E,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP DE        "),
POP_DE2 => ( FETCH,     FETCH,   D,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP DE(int)   "),
POP_HL  => ( POP_HL2,   FETCH,   L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP HL        "),
POP_HL2 => ( FETCH,     FETCH,   H,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP HL(int)   "),
POP_AF  => ( POP_AF2,   FETCH,   F,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP AF        "),
POP_AF2 => ( FETCH,     FETCH,   A,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD, "POP AF(int)   "),

--*********************************--
--  EXCHANGE, BLOCK TRANSFER AND   --
--     SEARCH INSTRUCTIONS         --
--                                 --
--*********************************--
--        IR (Bytecode),    Next IR,         Read/Dest   Write/Src   ALU Inst      Exch      AddrSrc   Mem Acc Type   Name
EX_DE_HL => ( FETCH, FETCH, NONE, NONE, X_DE_HL, NONE, X"00", PC, FETCH,  "EX DE HL      "),
EX_AF_AF => ( FETCH, FETCH, NONE, NONE, X_AF,    NONE, X"00", PC, FETCH,  "EX AF AF'     "),
EX_X     => ( FETCH, FETCH, NONE, NONE, X_ALL,   NONE, X"00", PC, FETCH,  "EXX           "),

--UR HERE! Need INCTT command to get around the fact that we do notwant
--to inc the SP directly, just use its inc value.
EX_bSPb_HL  =>  ( EX_bSPb_HL2,  FETCH, T,      EXTERN, NULLL, NONE, X"00", SP,  MEM_RD, "EX (SP) HL    "),
EX_bSPb_HL2 =>  ( EX_bSPb_HL3,  FETCH, EXTERN, L,      NULLL, NONE, X"00", SP,  MEM_WR, "EX (SP)HL(int)"),
EX_bSPb_HL3 =>  ( EX_bSPb_HL4,  FETCH, L,      T,      NULLL, NONE, X"00", SP,  NONE,   "EX (SP)HL(int)"),
EX_bSPb_HL4 =>  ( EX_bSPb_HL5,  FETCH, T,      SP_L,   NULLL, NONE, X"00", PC,  NONE,   "EX (SP)HL(int)"),
EX_bSPb_HL5 =>  ( EX_bSPb_HL6,  FETCH, T,      K_H01,  ADD,   NONE, X"00", PC,  NONE,   "EX (SP)HL(int)"),
EX_bSPb_HL6 =>  ( EX_bSPb_HL7,  FETCH, TT_L,   T,      NULLL, NONE, X"00", PC,  NONE,   "EX (SP)HL(int)"),
EX_bSPb_HL7 =>  ( EX_bSPb_HL8,  FETCH, T,      SP_H,   NULLL, NONE, X"00", PC,  NONE,   "EX (SP)HL(int)"),
EX_bSPb_HL8 =>  ( EX_bSPb_HL9,  FETCH, T,      K_H00,  ADDC,  NONE, X"00", PC,  NONE,   "EX (SP)HL(int)"),
EX_bSPb_HL9 =>  ( EX_bSPb_HL10, FETCH, TT_H,   T,      NULLL, NONE, X"00", PC,  NONE,   "EX (SP)HL(int)"),
EX_bSPb_HL10 => ( EX_bSPb_HL11, FETCH, T,      EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "EX (SP)HL(int)"),
EX_bSPb_HL11 => ( EX_bSPb_HL12, FETCH, EXTERN, H,      NULLL, NONE, X"00", TT,  MEM_WR, "EX (SP)HL(int)"),
EX_bSPb_HL12 => ( FETCH,        FETCH, H,      T,      NULLL, NONE, X"00", TT,  FETCH,  "EX (SP)HL(int)"),

LDI  => ( LDI2,   FETCH, T,      EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LDI           "),
LDI2 => ( LDI3,   FETCH, EXTERN, T,      NULLL, NONE, X"00", DE, MEM_WR, "LDI (int)     "),
LDI3 => ( LDRCHK, FETCH, NONE,   NONE,   IID,   NONE, X"00", PC, NONE,   "LDI (int)     "),

LDIR   => ( LDIR2,   FETCH, T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "LDIR          "),
LDIR2  => ( LDIR3,   FETCH, EXTERN, T,      NULLL,  NONE, X"00", DE, MEM_WR, "LDIR (int)    "),
LDIR3  => ( LDRCHKR, FETCH, NONE,   NONE,   IID,    NONE, X"00", PC, NONE,   "LDIR (int)    "),

LDD  => ( LDD2,   FETCH, T,      EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LDD           "),
LDD2 => ( LDD3,   FETCH, EXTERN, T,      NULLL, NONE, X"00", DE, MEM_WR, "LDD (int)     "),
LDD3 => ( LDRCHK, FETCH, NONE,   NONE,   DDD,   NONE, X"00", PC, NONE,   "LDD (int)     "),

LDDR   => ( LDDR2,   FETCH, T,      EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "LDDR          "),
LDDR2  => ( LDDR3,   FETCH, EXTERN, T,      NULLL, NONE, X"00", DE, MEM_WR, "LDDR (int)    "),
LDDR3  => ( LDRCHKR, FETCH, NONE,   NONE,   DDD,   NONE, X"00", PC, NONE,   "LDDR (int)    "),

CPI  => ( CPI2,   FETCH, T,    A,      NULLL, NONE, X"00", PC, NONE,   "CPI           "),
CPI2 => ( CPI3,   FETCH, T,    EXTERN, SUB,   F,    X"FE", HL, MEM_RD, "CPI (int)     "),
CPI3 => ( CPRCHK, FETCH, NONE, NONE,   ID,    NONE, X"00", PC, NONE,   "CPI (int)     "),

CPIR  => ( CPIR2,   FETCH, T,    A,      NULLL, NONE, X"00", PC, NONE,   "CPIR          "),
CPIR2 => ( CPIR3,   FETCH, T,    EXTERN, SUB,   F,    X"FE", HL, MEM_RD, "CPIR (int)    "),
CPIR3 => ( CPRCHKR, FETCH, NONE, NONE,   ID,    NONE, X"00", PC, NONE,   "CPIR (int)    "),

CPD  => ( CPD2,   FETCH, T,    A,      NULLL, NONE, X"00", PC, NONE,   "CPD           "),
CPD2 => ( CPD3,   FETCH, T,    EXTERN, SUB,   F,    X"FE", HL, MEM_RD, "CPD (int)     "),
CPD3 => ( CPRCHK, FETCH, NONE, NONE,   DD,    NONE, X"00", PC, NONE,   "CPD (int)     "),

CPDR  => ( CPDR2,   FETCH, T,    A,      NULLL, NONE, X"00", PC, NONE,   "CPDR          "),
CPDR2 => ( CPDR3,   FETCH, T,    EXTERN, SUB,   F,    X"FE", HL, MEM_RD, "CPDR (int)    "),
CPDR3 => ( CPRCHKR, FETCH, NONE, NONE,   DD,    F,    X"00", PC, NONE,   "CPDR (int)    "),

LDRCHK => ( FETCH, FETCH, A, A, PV_BC, F, X"3E", PC, NONE, "LDD (int)     "),
CPRCHK => ( FETCH, FETCH, A, A, PV_BC, F, X"3C", PC, FETCH, "LDD (int)     "),

LDRCHKR => ( CHKBC2, FETCH, A, A, PV_BC, F, X"3E", PC, NONE, "LDIR (int)    "),
CPRCHKR => ( CHKBC,  FETCH, A, A, PV_BC, F, X"3C", PC, NONE, "LDIR (int)    "),

CHKBC  => ( CHKBC2, FETCH, NONE, NONE, TST_NZ, F, X"00", PC, NONE, "LDIR (int)    "),
CHKBC2 => ( CHKBC3, FETCH, NONE, NONE, TST_PE, F, X"00", PC, NONE, "LDIR (int)    "),
CHKBC3 => ( CHKBC4, FETCH, NONE, NONE, DECPC,  NONE, X"00", PC, NONE, "LDIR (int)    "),
CHKBC4 => ( FETCH,  FETCH, NONE, NONE, DECPC,  NONE, X"00", PC, NONE, "LDIR (int)    "),

--*********************************--
--                                 --
--   ARITHMETIC INSTRUCTIONS       --
--                                 --
--*********************************--

ADD_A => ( FETCH,   FETCH,   A, A, ADD, F, X"FF", PC,  FETCH,   "ADD A, A      "),
ADD_B => ( FETCH,   FETCH,   A, B, ADD, F, X"FF", PC,  FETCH,    "ADD A, B      "),
ADD_C => ( FETCH,   FETCH,   A, C, ADD, F, X"FF", PC,  FETCH,    "ADD A, C      "),
ADD_D => ( FETCH,   FETCH,   A, D, ADD, F, X"FF", PC,  FETCH,    "ADD A, D      "),
ADD_E => ( FETCH,   FETCH,   A, E, ADD, F, X"FF", PC,  FETCH,    "ADD A, E      "),
ADD_H => ( FETCH,   FETCH,   A, H, ADD, F, X"FF", PC,  FETCH,    "ADD A, H      "),
ADD_L => ( FETCH,   FETCH,   A, L, ADD, F, X"FF", PC,  FETCH,    "ADD A, L      "),

ADD_n  => ( ADD_n2, FETCH, T, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "ADD A, n      "),
ADD_n2 => ( FETCH,     FETCH, A, T,      ADD, F, X"FF", PC,  FETCH,  "ADD A, n(int) "),

ADD_bHLb  => ( ADD_bHLb2, ADD_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC,  NONE,   "ADD A,(HL)    "),
ADD_bHLb2 => ( FETCH,     FETCH,     A,    EXTERN, ADD, F, X"FF", HL,  MEM_RD, "ADD A,(HL)(int"),

ADD_bIXdb  => ( ADD_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "ADD A,(IX+d)  "),
ADD_bIXdb2 => ( ADD_bIXdb3, FETCH, T,    L,      ADD,   NONE, X"00", PC,  NONE,   "ADD A,(IX+d)(I"),
ADD_bIXdb3 => ( ADD_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "ADD A,(IX+d)(I"),
ADD_bIXdb4 => ( ADD_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "ADD A,(IX+d)(I"),
ADD_bIXdb5 => ( ADD_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "ADD A,(IX+d)(I"),
ADD_bIXdb6 => ( ADD_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "ADD A,(IX+d)(I"),
ADD_bIXdb7 => ( ADD_bIXdb8, FETCH, T,    EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "ADD A,(IX+d)(I"),
ADD_bIXdb8 => ( FETCH,      FETCH, A,    T,      ADD, F, X"FF", PC,  FETCH,  "ADD A,(IX+d)(I"),

ADDC_A => ( FETCH,   FETCH,   A, A, ADDC,   F, X"FF", PC,  FETCH,   "ADDC A, A     "),
ADDC_B => ( FETCH,   FETCH,   A, B, ADDC,   F, X"FF", PC,  FETCH,    "ADDC A, B     "),
ADDC_C => ( FETCH,   FETCH,   A, C, ADDC,   F, X"FF", PC,  FETCH,    "ADDC A, C     "),
ADDC_D => ( FETCH,   FETCH,   A, D, ADDC,   F, X"FF", PC,  FETCH,    "ADDC A, D     "),
ADDC_E => ( FETCH,   FETCH,   A, E, ADDC,   F, X"FF", PC,  FETCH,    "ADDC A, E     "),
ADDC_H => ( FETCH,   FETCH,   A, H, ADDC,   F, X"FF", PC,  FETCH,    "ADDC A, H     "),
ADDC_L => ( FETCH,   FETCH,   A, L, ADDC,   F, X"FF", PC,  FETCH,    "ADDC A, L     "),

ADDC_n  => ( ADDC_n2, FETCH, T, EXTERN, INCPC,  NONE, X"00", PC,  MEM_RD, "ADDC A, n     "),
ADDC_n2 => ( FETCH,       FETCH, A, T,      ADDC,   F, X"FF", PC,  FETCH,    "ADDC A, n(int)"),

ADDC_bHLb  => ( ADDC_bHLb2, ADDC_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC,  NONE,   "ADDC A,(HL)   "),
ADDC_bHLb2 => ( FETCH,      FETCH,      A,    EXTERN, ADDC,   F, X"FF", HL,  MEM_RD, "ADDC A,(HL)(in"),

ADDC_bIXdb  => ( ADDC_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "ADDC A,(IX+d) "),
ADDC_bIXdb2 => ( ADDC_bIXdb3, FETCH, T,    L,      ADD,   G,    X"01", PC,  NONE,   "ADDC A,(IX+d)("),
ADDC_bIXdb3 => ( ADDC_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "ADDC A,(IX+d)("),
ADDC_bIXdb4 => ( ADDC_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "ADDC A,(IX+d)("),
ADDC_bIXdb5 => ( ADDC_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "ADDC A,(IX+d)("),
ADDC_bIXdb6 => ( ADDC_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "ADDC A,(IX+d)("),
ADDC_bIXdb7 => ( ADDC_bIXdb8, FETCH, T,    EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "ADDC A,(IX+d)("),
ADDC_bIXdb8 => ( FETCH,       FETCH, A,    T,      ADDC,   F, X"FF", PC,  FETCH,  "ADDC A,(IX+d)("),

SUB_A => ( FETCH,   FETCH,   A, A, SUB,   F, X"FF", PC,  FETCH,   "SUB A, A      "),
SUB_B => ( FETCH,   FETCH,   A, B, SUB,   F, X"FF", PC,  FETCH,    "SUB A, B      "),
SUB_C => ( FETCH,   FETCH,   A, C, SUB,   F, X"FF", PC,  FETCH,    "SUB A, C      "),
SUB_D => ( FETCH,   FETCH,   A, D, SUB,   F, X"FF", PC,  FETCH,    "SUB A, D      "),
SUB_E => ( FETCH,   FETCH,   A, E, SUB,   F, X"FF", PC,  FETCH,    "SUB A, E      "),
SUB_H => ( FETCH,   FETCH,   A, H, SUB,   F, X"FF", PC,  FETCH,    "SUB A, H      "),
SUB_L => ( FETCH,   FETCH,   A, L, SUB,   F, X"FF", PC,  FETCH,    "SUB A, L      "),

SUB_n  => ( SUB_n2, FETCH, T, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "SUB A, n      "),
SUB_n2 => ( FETCH,     FETCH, A, T,      SUB,   F, X"FF", PC,  FETCH,    "SUB A, n(int) "),

SUB_bHLb  => ( SUB_bHLb2, SUB_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC,  NONE,   "SUB A,(HL)    "),
SUB_bHLb2 => ( FETCH,     FETCH,     A,    EXTERN, SUB,   F, X"FF", HL,  MEM_RD, "SUB A,(HL)(int"),

SUB_bIXdb  => ( SUB_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "SUB A,(IX+d)  "),
SUB_bIXdb2 => ( SUB_bIXdb3, FETCH, T,    L,      ADD,   NONE, X"00", PC,  NONE,   "SUB A,(IX+d)(I"),
SUB_bIXdb3 => ( SUB_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "SUB A,(IX+d)(I"),
SUB_bIXdb4 => ( SUB_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "SUB A,(IX+d)(I"),
SUB_bIXdb5 => ( SUB_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "SUB A,(IX+d)(I"),
SUB_bIXdb6 => ( SUB_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "SUB A,(IX+d)(I"),
SUB_bIXdb7 => ( SUB_bIXdb8, FETCH, T,    EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "SUB A,(IX+d)(I"),
SUB_bIXdb8 => ( FETCH,      FETCH, A,    T,      SUB,   F, X"FF", PC,  FETCH,  "SUB A,(IX+d)(I"),

SUBC_A => ( FETCH,   FETCH,   A, A, SUBC,   F, X"FF", PC,  FETCH,   "SUBC A, A     "),
SUBC_B => ( FETCH,   FETCH,   A, B, SUBC,   F, X"FF", PC,  FETCH,    "SUBC A, B     "),
SUBC_C => ( FETCH,   FETCH,   A, C, SUBC,   F, X"FF", PC,  FETCH,    "SUBC A, C     "),
SUBC_D => ( FETCH,   FETCH,   A, D, SUBC,   F, X"FF", PC,  FETCH,    "SUBC A, D     "),
SUBC_E => ( FETCH,   FETCH,   A, E, SUBC,   F, X"FF", PC,  FETCH,    "SUBC A, E     "),
SUBC_H => ( FETCH,   FETCH,   A, H, SUBC,   F, X"FF", PC,  FETCH,    "SUBC A, H     "),
SUBC_L => ( FETCH,   FETCH,   A, L, SUBC,   F, X"FF", PC,  FETCH,    "SUBC A, L     "),

SUBC_n  => ( SUBC_n2, FETCH,   T, EXTERN,  INCPC, NONE, X"00", PC,  MEM_RD, "SUBC A, n     "),
SUBC_n2 => ( FETCH,        FETCH,   A, T,       SUBC,   F, X"FF", PC,  FETCH,  "SUBC A, n(int)"),

SUBC_bHLb  => ( SUBC_bHLb2, SUBC_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC,  NONE,   "SUBC A,(HL)   "),
SUBC_bHLb2 => ( FETCH,      FETCH,      A,    EXTERN, SUBC,   F, X"FF", HL,  MEM_RD, "SUBC A,(HL)(in"),

SUBC_bIXdb  => ( SUBC_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "SUBC A,(IX+d) "),
SUBC_bIXdb2 => ( SUBC_bIXdb3, FETCH, T,    L,      ADD,   NONE, X"00", PC,  NONE,   "SUBC A,(IX+d)("),
SUBC_bIXdb3 => ( SUBC_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "SUBC A,(IX+d)("),
SUBC_bIXdb4 => ( SUBC_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "SUBC A,(IX+d)("),
SUBC_bIXdb5 => ( SUBC_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "SUBC A,(IX+d)("),
SUBC_bIXdb6 => ( SUBC_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "SUBC A,(IX+d)("),
SUBC_bIXdb7 => ( SUBC_bIXdb8, FETCH, T,    EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "SUBC A,(IX+d)("),
SUBC_bIXdb8 => ( FETCH,       FETCH, A,    T,      SUBC,   F, X"FF", PC,  FETCH,  "SUBC A,(IX+d)("),

AND_A => ( FETCH,   FETCH,   A, A, ANDD,   F, X"FF", PC,  FETCH,   "AND A, A      "),
AND_B => ( FETCH,   FETCH,   A, B, ANDD,   F, X"FF", PC,  FETCH,    "AND A, B      "),
AND_C => ( FETCH,   FETCH,   A, C, ANDD,   F, X"FF", PC,  FETCH,    "AND A, C      "),
AND_D => ( FETCH,   FETCH,   A, D, ANDD,   F, X"FF", PC,  FETCH,    "AND A, D      "),
AND_E => ( FETCH,   FETCH,   A, E, ANDD,   F, X"FF", PC,  FETCH,    "AND A, E      "),
AND_H => ( FETCH,   FETCH,   A, H, ANDD,   F, X"FF", PC,  FETCH,    "AND A, H      "),
AND_L => ( FETCH,   FETCH,   A, L, ANDD,   F, X"FF", PC,  FETCH,    "AND A, L      "),

AND_n  => ( AND_n2, FETCH, T, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "AND A, n      "),
AND_n2 => ( FETCH,     FETCH, A, T,      ANDD,   F, X"FF", PC,  FETCH,    "AND A, n(int) "),

AND_bHLb  => ( AND_bHLb2, AND_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "AND A,(HL)    "),
AND_bHLb2 => ( FETCH,     FETCH,     A,    EXTERN, ANDD,   F,    X"FF", HL, MEM_RD, "AND A,(HL)(int"),

AND_bIXdb  => ( AND_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "AND A,(IX+d)  "),
AND_bIXdb2 => ( AND_bIXdb3, FETCH, T,    L,      ADD,   NONE, X"00", PC,  NONE,   "AND A,(IX+d)(i"),
AND_bIXdb3 => ( AND_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "AND A,(IX+d)(i"),
AND_bIXdb4 => ( AND_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "AND A,(IX+d)(i"),
AND_bIXdb5 => ( AND_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "AND A,(IX+d)(i"),
AND_bIXdb6 => ( AND_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "AND A,(IX+d)(i"),
AND_bIXdb7 => ( AND_bIXdb8, FETCH, T,    EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "AND A,(IX+d)(i"),
AND_bIXdb8 => ( FETCH,      FETCH, A,    T,      ANDD,  F,    X"FF", PC,  NONE,   "AND A,(IX+d)(i"),

OR_A => ( FETCH,   FETCH, A, A, ORR,  F, X"FF", PC, FETCH, "OR A, A       "),
OR_B => ( FETCH,   FETCH, A, B, ORR,  F, X"FF", PC, FETCH, "OR A, B       "),
OR_C => ( FETCH,   FETCH, A, C, ORR,  F, X"FF", PC, FETCH, "OR A, C       "),
OR_D => ( FETCH,   FETCH, A, D, ORR,  F, X"FF", PC, FETCH, "OR A, D       "),
OR_E => ( FETCH,   FETCH, A, E, ORR,  F, X"FF", PC, FETCH, "OR A, E       "),
OR_H => ( FETCH,   FETCH, A, H, ORR,  F, X"FF", PC, FETCH, "OR A, H       "),
OR_L => ( FETCH,   FETCH, A, L, ORR,  F, X"FF", PC, FETCH, "OR A, L       "),

OR_n  => ( OR_n2, FETCH, T, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "OR A, n       "),
OR_n2 => ( FETCH,    FETCH, A, T,      ORR,   F, X"FF", PC,  FETCH,  "OR A, n(int)  "),

OR_bHLb  => ( OR_bHLb2, OR_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "OR A,(HL)     "),
OR_bHLb2 => ( FETCH,    FETCH,    A,    EXTERN, ORR,    F,    X"FF", HL, MEM_RD, "OR A,(HL)(int)"),

OR_bIXdb  => ( OR_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "OR A,(IX+d)   "),
OR_bIXdb2 => ( OR_bIXdb3, FETCH, T,    L,      ADD,   NONE, X"00", PC,  NONE,   "OR A,(IX+d)(in"),
OR_bIXdb3 => ( OR_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "OR A,(IX+d)(in"),
OR_bIXdb4 => ( OR_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "OR A,(IX+d)(in"),
OR_bIXdb5 => ( OR_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "OR A,(IX+d)(in"),
OR_bIXdb6 => ( OR_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "OR A,(IX+d)(in"),
OR_bIXdb7 => ( OR_bIXdb8, FETCH, T,    EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "OR A,(IX+d)(in"),
OR_bIXdb8 => ( FETCH,     FETCH, A,    T,      ORR,   F,    X"FF", PC,  NONE,   "OR A,(IX+d)(in"),

XOR_A => ( FETCH,   FETCH,   A, A, XORR,  F, X"FF", PC,  FETCH,   "XOR A, A      "),
XOR_B => ( FETCH,   FETCH,   A, B, XORR,  F, X"FF", PC,  FETCH,    "XOR A, B      "),
XOR_C => ( FETCH,   FETCH,   A, C, XORR,  F, X"FF", PC,  FETCH,    "XOR A, C      "),
XOR_D => ( FETCH,   FETCH,   A, D, XORR,  F, X"FF", PC,  FETCH,    "XOR A, D      "),
XOR_E => ( FETCH,   FETCH,   A, E, XORR,  F, X"FF", PC,  FETCH,    "XOR A, E      "),
XOR_H => ( FETCH,   FETCH,   A, H, XORR,  F, X"FF", PC,  FETCH,    "XOR A, H      "),
XOR_L => ( FETCH,   FETCH,   A, L, XORR,  F, X"FF", PC,  FETCH,    "XOR A, L      "),

XOR_n  => ( XOR_n2, FETCH, T, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "XOR A, n      "),
XOR_n2 => ( FETCH,     FETCH, A, T,      XORR,  F, X"FF", PC,  FETCH,    "XOR A, n(int) "),

XOR_bHLb  => ( XOR_bHLb2,   XOR_bIXdb,   NONE,   NONE,   TST_EC, NONE, X"00", PC,  NONE,   "XOR A,(HL)    "),
XOR_bHLb2 => ( FETCH,          FETCH,       A,      EXTERN, XORR,   F,    X"FF", HL,  MEM_RD, "XOR A,(HL)(int"),

XOR_bIXdb  => ( XOR_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "XOR A,(IX+d)  "),
XOR_bIXdb2 => ( XOR_bIXdb3, FETCH, T,    L,      ADD,   NONE, X"00", PC,  NONE,   "XOR A,(IX+d)(i"),
XOR_bIXdb3 => ( XOR_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "XOR A,(IX+d)(i"),
XOR_bIXdb4 => ( XOR_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "XOR A,(IX+d)(i"),
XOR_bIXdb5 => ( XOR_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "XOR A,(IX+d)(i"),
XOR_bIXdb6 => ( XOR_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "XOR A,(IX+d)(i"),
XOR_bIXdb7 => ( XOR_bIXdb8, FETCH, T,    EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "XOR A,(IX+d)(i"),
XOR_bIXdb8 => ( FETCH,      FETCH, A,    T,      XORR,  F, X"FF", PC,  NONE,   "XOR A,(IX+d)(i"),

COMP_A  => ( COMP_A2, FETCH, T, A, NULLL, NONE, X"00", PC, FETCH, "COMP A, A     "),
COMP_A2 => ( FETCH,   FETCH, T, A, SUB,   F,    X"FF", PC, FETCH, "COMP A, A(int)"),

COMP_B  => ( COMP_B2, FETCH, T, A, NULLL, NONE, X"00", PC, FETCH, "COMP A, B     "),
COMP_B2 => ( FETCH,   FETCH, T, B, SUB,   F,    X"FF", PC, FETCH, "COMP A, B(int)"),

COMP_C  => ( COMP_C2, FETCH, T, A, NULLL, NONE, X"00", PC, FETCH, "COMP A, C     "),
COMP_C2 => ( FETCH,   FETCH, T, C, SUB,   F,    X"FF", PC, FETCH, "COMP A, C(int)"),

COMP_D  => ( COMP_D2, FETCH, T, A, NULLL, NONE, X"00", PC, FETCH, "COMP A, D     "),
COMP_D2 => ( FETCH,   FETCH, T, D, SUB,   F,    X"FF", PC, FETCH, "COMP A, D(int)"),

COMP_E  => ( COMP_E2, FETCH, T, A, NULLL, NONE, X"00", PC, FETCH, "COMP A, E     "),
COMP_E2 => ( FETCH,   FETCH, T, E, SUB,   F,    X"FF", PC, FETCH, "COMP A, E(int)"),

COMP_H  => ( COMP_H2, FETCH, T, A, NULLL, NONE, X"00", PC, FETCH, "COMP A, H     "),
COMP_H2 => ( FETCH,   FETCH, T, H, SUB,   F,    X"FF", PC, FETCH, "COMP A, H(int)"),

COMP_L  => ( COMP_L2, FETCH, T, A, NULLL, NONE, X"00", PC, FETCH, "COMP A, L     "),
COMP_L2 => ( FETCH,   FETCH, T, L, SUB,   F,    X"FF", PC, FETCH, "COMP A, L(int)"),

COMP_n  => ( COMP_n2, FETCH, TT_L, EXTERN, NULLL, NONE, X"00", PC, MEM_RD, "COMP A, n     "),
COMP_n2 => ( COMP_n3, FETCH, T,    A,      INCPC, NONE, X"00", PC, NONE,   "COMP A, n(int)"),
COMP_n3 => ( FETCH,   FETCH, T,    TT_L,   SUB,   F,    X"FF", PC, FETCH,  "COMP A, n(int)"),

COMP_bHLb  => ( COMP_bHLb2, COMP_bIXdb, T, A,      TST_EC, NONE, X"00", PC, NONE,   "COMP A,(HL)   "),
COMP_bHLb2 => ( FETCH,      FETCH,      T, EXTERN, SUB,    F,    X"FF", HL, MEM_RD, "COMP A,(HL)int"),

COMP_bIXdb  => ( COMP_bIXdb2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "COMP A,(IX+d) "),
COMP_bIXdb2 => ( COMP_bIXdb3, FETCH, T,    L,      ADD,   NONE, X"00", PC,  NONE,   "COMP A,(IX+d)("),
COMP_bIXdb3 => ( COMP_bIXdb4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC,  NONE,   "COMP A,(IX+d)("),
COMP_bIXdb4 => ( COMP_bIXdb5, FETCH, T,    K_H00,  NULLL, NONE, X"00", PC,  NONE,   "COMP A,(IX+d)("),
COMP_bIXdb5 => ( COMP_bIXdb6, FETCH, T,    H,      ADDC,  NONE, X"00", PC,  NONE,   "COMP A,(IX+d)("),
COMP_bIXdb6 => ( COMP_bIXdb7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC,  NONE,   "COMP A,(IX+d)("),
COMP_bIXdb7 => ( COMP_bIXdb8, FETCH, T,    A,      NULLL, NONE, X"00", PC,  NONE,   "COMP A,(IX+d)("),
COMP_bIXdb8 => ( FETCH,       FETCH, T,    EXTERN, SUB,   F,    X"FF", TT,  MEM_RD, "COMP A,(IX+d)("),

INC_A  => ( INC_A2, FETCH, T, K_H01, NULLL, NONE, X"00", PC,  NONE,  "INC A         "),
INC_A2 => ( FETCH,  FETCH, A, T,     ADD,   F,    X"FE", PC,  FETCH, "INC A(int)    "),

INC_B  => ( INC_B2, FETCH, T, K_H01, NULLL, NONE, X"00", PC,  NONE, "INC B         "),
INC_B2 => ( INC_B3,  FETCH, T, B,     ADD,   F,    X"FE", PC,  NONE,  "INC B(int)    "),
INC_B3 => ( FETCH,  FETCH, B, T,     NULLL, NONE, X"00", PC,  FETCH, "INC B(int)    "),

INC_C  => ( INC_C2, FETCH, T, K_H01, NULLL, NONE, X"00", PC,  NONE, "INC C         "),
INC_C2 => ( INC_C3, FETCH, T, C,     ADD,   F,    X"FE", PC,  NONE,  "INC C(int)    "),
INC_C3 => ( FETCH,  FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "INC C(int)    "),

INC_D  => ( INC_D2, FETCH, T, K_H01, NULLL, NONE, X"00", PC,  NONE, "INC D         "),
INC_D2 => ( INC_D3, FETCH, T, D,     ADD,   F,    X"FE", PC,  NONE,  "INC D(int)    "),
INC_D3 => ( FETCH,  FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "INC D(int)    "),

INC_E  => ( INC_E2, FETCH, T, K_H01, NULLL, NONE, X"00", PC,  NONE, "INC E         "),
INC_E2 => ( INC_E3, FETCH, T, E,     ADD,   F,    X"FE", PC,  NONE,  "INC E(int)    "),
INC_E3 => ( FETCH,  FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "INC E(int)    "),

INC_H  => ( INC_H2, FETCH, T, K_H01, NULLL, NONE, X"00", PC,  NONE, "INC H         "),
INC_H2 => ( INC_H3, FETCH, T, H,     ADD,   F,    X"FE", PC,  NONE,  "INC H(int)    "),
INC_H3 => ( FETCH,  FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "INC H(int)    "),

INC_L  => ( INC_L2, FETCH, T, K_H01, NULLL, NONE, X"00", PC,  NONE, "INC L         "),
INC_L2 => ( INC_L3, FETCH, T, L,     ADD,   F,    X"FE", PC,  NONE,  "INC L(int)    "),
INC_L3 => ( FETCH,  FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "INC L(int)    "),

INC_bHLb  => ( INC_bHLb2, INC_bIXdb, T,      K_H01,  TST_EC, NONE, X"00", PC,  NONE,   "INC (HL)      "),
INC_bHLb2 => ( INC_bHLb3, FETCH,     T,      EXTERN, ADD,    F,    X"FE", HL,  MEM_RD, "INC (HL)(int) "),
INC_bHLb3 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL,  MEM_WR, "INC (HL)(int) "),

INC_bIXdb  => ( INC_bIXdb2, FETCH, T,      EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "INC (IX+d)    "),
INC_bIXdb2 => ( INC_bIXdb3, FETCH, T,      L,      ADD,   NONE, X"00", PC,  NONE,   "INC (IX+d)(INT"),
INC_bIXdb3 => ( INC_bIXdb4, FETCH, TT_L,   T,      NULLL, NONE, X"00", PC,  NONE,   "INC (IX+d)(INT"),
INC_bIXdb4 => ( INC_bIXdb5, FETCH, T,      K_H00,  NULLL, NONE, X"00", PC,  NONE,   "INC (IX+d)(INT"),
INC_bIXdb5 => ( INC_bIXdb6, FETCH, T,      H,      ADDC,  NONE, X"00", PC,  NONE,   "INC (IX+d)(INT"),
INC_bIXdb6 => ( INC_bIXdb7, FETCH, TT_H,   T,      NULLL, NONE, X"00", PC,  NONE,   "INC (IX+d)(INT"),
INC_bIXdb7 => ( INC_bIXdb8, FETCH, T,      EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "INC (IX+d)(INT"),
INC_bIXdb8 => ( INC_bIXdb9, FETCH, T,      K_H01,  ADD,   F,    X"FE", PC,  NONE,   "INC (IX+d)(INT"),
INC_bIXdb9 => ( FETCH,      FETCH, EXTERN, T,      NULLL, NONE, X"00", TT,  MEM_WR, "INC (IX+d)(INT"),

DEC_A  => ( DEC_A2, FETCH, T, K_H01, NULLL, NONE, X"00", PC, NONE,  "DEC A         "),
DEC_A2 => ( FETCH,  FETCH, A, T,     SUB,   F,    X"FE", PC, FETCH, "DEC A(int)    "),

DEC_B  => ( DEC_B2, FETCH, T, B,     NULLL, NONE, X"00", PC, NONE,  "DEC B         "),
DEC_B2 => ( DEC_B3, FETCH, T, K_H01, SUB,   F,    X"FE", PC, FETCH, "DEC B(int)    "),
DEC_B3 => ( FETCH,  FETCH, B, T,     NULLL, NONE, X"00", PC, FETCH, "DEC B(int)    "),

DEC_C  => ( DEC_C2, FETCH, T, C,     NULLL, NONE, X"00", PC, NONE,  "DEC C         "),
DEC_C2 => ( DEC_C3, FETCH, T, K_H01, SUB,   F,    X"FE", PC, FETCH, "DEC C(int)    "),
DEC_C3 => ( FETCH,  FETCH, C, T,     NULLL, NONE, X"00", PC, FETCH, "DEC C(int)    "),

DEC_D  => ( DEC_D2, FETCH, T, D,     NULLL, NONE, X"00", PC, NONE,  "DEC D         "),
DEC_D2 => ( DEC_D3, FETCH, T, K_H01, SUB,   F,    X"FE", PC, FETCH, "DEC D(int)    "),
DEC_D3 => ( FETCH,  FETCH, D, T,     NULLL, NONE, X"00", PC, FETCH, "DEC D(int)    "),

DEC_E  => ( DEC_E2, FETCH, T, E,     NULLL, NONE, X"00", PC, NONE,  "DEC E         "),
DEC_E2 => ( DEC_E3, FETCH, T, K_H01, SUB,   F,    X"FE", PC, FETCH, "DEC E(int)    "),
DEC_E3 => ( FETCH,  FETCH, E, T,     NULLL, NONE, X"00", PC, FETCH, "DEC E(int)    "),

DEC_H  => ( DEC_H2, FETCH, T, H,     NULLL, NONE, X"00", PC, NONE,  "DEC H         "),
DEC_H2 => ( DEC_H3, FETCH, T, K_H01, SUB,   F,    X"FE", PC, FETCH, "DEC H(int)    "),
DEC_H3 => ( FETCH,  FETCH, H, T,     NULLL, NONE, X"00", PC, FETCH, "DEC H(int)    "),

DEC_L  => ( DEC_L2, FETCH, T, L,     NULLL, NONE, X"00", PC, NONE,  "DEC L         "),
DEC_L2 => ( DEC_L3, FETCH, T, K_H01, SUB,   F,    X"FE", PC, FETCH, "DEC L(int)    "),
DEC_L3 => ( FETCH,  FETCH, L, T,     NULLL, NONE, X"00", PC, FETCH, "DEC L(int)    "),

DEC_bHLb  => ( DEC_bHLb2, DEC_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", PC, NONE,   "DEC (HL)      "),
DEC_bHLb2 => ( DEC_bHLb3, FETCH,     T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "DEC (HL)(int) "),
DEC_bHLb3 => ( DEC_bHLb4, FETCH,     T,      K_H01,  SUB,    F,    X"FE", HL, NONE,   "DEC (HL)(int) "),
DEC_bHLb4 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "DEC (HL)(int) "),

DEC_bIXdb  => ( DEC_bIXdb2, FETCH, T,      EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "DEC (IX+d)    "),
DEC_bIXdb2 => ( DEC_bIXdb3, FETCH, T,      L,      ADD,   NONE, X"00", PC,  NONE,   "DEC (IX+d)(INT"),
DEC_bIXdb3 => ( DEC_bIXdb4, FETCH, TT_L,   T,      NULLL, NONE, X"00", PC,  NONE,   "DEC (IX+d)(INT"),
DEC_bIXdb4 => ( DEC_bIXdb5, FETCH, T,      K_H00,  NULLL, NONE, X"00", PC,  NONE,   "DEC (IX+d)(INT"),
DEC_bIXdb5 => ( DEC_bIXdb6, FETCH, T,      H,      ADDC,  NONE, X"00", PC,  NONE,   "DEC (IX+d)(INT"),
DEC_bIXdb6 => ( DEC_bIXdb7, FETCH, TT_H,   T,      NULLL, NONE, X"00", PC,  NONE,   "DEC (IX+d)(INT"),
DEC_bIXdb7 => ( DEC_bIXdb8, FETCH, T,      EXTERN, NULLL, NONE, X"00", TT,  MEM_RD, "DEC (IX+d)(INT"),
DEC_bIXdb8 => ( DEC_bIXdb9, FETCH, T,      K_H01,  SUB,   F,    X"FE", PC,  NONE,   "DEC (IX+d)(INT"),
DEC_bIXdb9 => ( FETCH,      FETCH, EXTERN, T,      NULLL, NONE, X"00", TT,  MEM_WR, "DEC (IX+d)(INT"),

--*********************************--
--    GENERAL PURPOSE ARITHMETIC     --
--   AND CPU CONTROL INSTRUCTIONS  --
--                                 --
--*********************************--
FETCH => ( FETCH, FETCH, INST, EXTERN, INCPC, NONE, X"00", PC, FETCH, "FETCH         "),

DAA   => ( DAA2,  DAA3,  NONE, NONE,   TST_N, NONE, X"00", PC, FETCH, "DAA           "),
DAA2  => ( DAA4,  FETCH, A,    K_DAA,  SUB,   F,    X"FD", PC, FETCH, "DAA(int)      "),
DAA3  => ( DAA4,  FETCH, A,    K_DAA,  ADD,   F,    X"F9", PC, FETCH, "DAA(int)      "),
DAA4  => ( FETCH, FETCH, A,    K_H00,  ORR,   F,    X"04", PC, FETCH, "DAA(int)      "),

CPL   => ( CPL2,  FETCH, A,    K_HFF,  XORR,  NONE, X"00", PC, FETCH, "CPL           "),
CPL2  => ( CPL3,  FETCH, T,    K_H10,  NULLL, NONE, X"00", PC, FETCH, "CPL           "),
CPL3  => ( FETCH, FETCH, T,    K_H04,  SUB,   F,    X"12", PC, FETCH, "CPL           "),

NEG  => ( NEG2,  FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),
NEG2 => ( FETCH, FETCH, A, K_HFF, SUB,  F,    X"FF", PC, FETCH, "NEG           "),

NEG_2  => ( NEG2, FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),
NEG_3  => ( NEG2, FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),
NEG_4  => ( NEG2, FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),
NEG_5  => ( NEG2, FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),
NEG_6  => ( NEG2, FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),
NEG_7  => ( NEG2, FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),
NEG_8  => ( NEG2, FETCH, A, K_HFF, XORR, NONE, X"00", PC, FETCH, "NEG           "),

CCF  => ( CCF2,  CCF3,  T, K_HBF, TST_C, F, X"00", PC, FETCH, "CCF           "),
CCF2 => ( FETCH, FETCH, T, K_H00, ADDC,  F, X"2B", PC, FETCH, "CCF(int)      "),
CCF3 => ( FETCH, FETCH, T, K_H80, ADDC,  F, X"2B", PC, FETCH, "CCF(int)      "),

SCF  => ( SCF2,  FETCH, T, K_H80, NULLL, NONE, X"00", PC, FETCH, "SCF           "),
SCF2 => ( FETCH, FETCH, T, K_H80, ADD,   F,    X"3B", PC, FETCH, "SCF(int)      "),

NOP  => ( FETCH, FETCH, NONE, NONE, NULLL, NONE, X"00", PC, FETCH, "NOP           "),
EI   => ( FETCH, FETCH, NONE, NONE, EI,    NONE, X"00", PC, FETCH, "EI            "),
DI   => ( FETCH, FETCH, NONE, NONE, DI,    NONE, X"00", PC, FETCH, "DI            "),

HALT => ( HALT, FETCH, NONE, EXTERN, NULLL, NONE, X"00", PC, FETCH, "HALT          "),

IM0 => ( FETCH,   FETCH,   NONE, NONE,    IM0,   NONE, X"00", PC,  FETCH, "IM 0          "),
IM1 => ( FETCH,   FETCH,   NONE, NONE,    IM1,   NONE, X"00", PC,  FETCH, "IM 1          "),
IM2 => ( FETCH,   FETCH,   NONE, NONE,    IM2,   NONE, X"00", PC,  FETCH, "IM 2          "),

IM0_2 => ( FETCH,   FETCH,   NONE, NONE,    IM0,   NONE, X"00", PC,  FETCH, "IM 0          "),
IM0_3 => ( FETCH,   FETCH,   NONE, NONE,    IM0,   NONE, X"00", PC,  FETCH, "IM 0          "),
IM0_4 => ( FETCH,   FETCH,   NONE, NONE,    IM0,   NONE, X"00", PC,  FETCH, "IM 0          "),
IM1_2 => ( FETCH,   FETCH,   NONE, NONE,    IM1,   NONE, X"00", PC,  FETCH, "IM 1          "),
IM2_2 => ( FETCH,   FETCH,   NONE, NONE,    IM2,   NONE, X"00", PC,  FETCH, "IM 2          "),

--*********************************--
--    16-bit ARITHMENTIC GROUP     --
--                                 --
--                                 --
--*********************************--
ADD_HL_BC  => (ADD_HL_BC2, FETCH,      T, C, NULLL, NONE, X"00", PC, NONE,  "ADD HL BC     "),
ADD_HL_BC2 => (ADD_HL_BC3, FETCH,      T, L, ADD,   F,    X"41", PC, NONE,  "ADD HL BC(INT)"),
ADD_HL_BC3 => (ADD_HL_BC4, FETCH,      L, T, NULLL, NONE, X"00", PC, NONE,  "ADD HL BC(INT)"),
ADD_HL_BC4 => (ADD_HL_BC5, ADD_HL_BC6, T, B, TST_Z, F,    X"00", PC, NONE,  "ADD HL BC(INT)"),
ADD_HL_BC5 => (ADD_HL_BC7, FETCH,      T, H, ADDC,  F,    X"FF", PC, NONE,  "ADD HL BC(INT)"),
ADD_HL_BC6 => (ADD_HL_BC7, FETCH,      T, H, ADDC,  F,    X"BF", PC, NONE,  "ADD HL BC(INT)"),
ADD_HL_BC7 => (FETCH,       FETCH,     H, T, NULLL, NONE, X"00", PC, FETCH, "ADD HL BC(INT)"),

ADD_HL_DE  => (ADD_HL_DE2, FETCH,      T, E, NULLL, NONE, X"00", PC, NONE,  "ADD HL DE     "),
ADD_HL_DE2 => (ADD_HL_DE3, FETCH,      T, L, ADD,   F,    X"41", PC, NONE,  "ADD HL DE(INT)"),
ADD_HL_DE3 => (ADD_HL_DE4, FETCH,      L, T, NULLL, NONE, X"00", PC, NONE,  "ADD HL DE(INT)"),
ADD_HL_DE4 => (ADD_HL_DE5, ADD_HL_DE6, T, D, TST_Z, F,    X"00", PC, NONE,  "ADD HL DE(INT)"),
ADD_HL_DE5 => (ADD_HL_DE7, FETCH,      T, H, ADDC,  F,    X"FF", PC, NONE,  "ADD HL DE(INT)"),
ADD_HL_DE6 => (ADD_HL_DE7, FETCH,      T, H, ADDC,  F,    X"BF", PC, NONE,  "ADD HL DE(INT)"),
ADD_HL_DE7 => (FETCH,       FETCH,     H, T, NULLL, NONE, X"00", PC, FETCH, "ADD HL DE(INT)"),

ADD_HL_HL  => (ADD_HL_HL2, FETCH,      T, L, NULLL, NONE, X"00", PC, NONE,  "ADD HL HL     "),
ADD_HL_HL2 => (ADD_HL_HL3, FETCH,      T, L, ADD,   F,    X"41", PC, NONE,  "ADD HL HL(INT)"),
ADD_HL_HL3 => (ADD_HL_HL4, FETCH,      L, T, NULLL, NONE, X"00", PC, NONE,  "ADD HL HL(INT)"),
ADD_HL_HL4 => (ADD_HL_HL5, ADD_HL_HL6, T, H, TST_Z, F,    X"00", PC, NONE,  "ADD HL HL(INT)"),
ADD_HL_HL5 => (ADD_HL_HL7, FETCH,      T, H, ADDC,  F,    X"FF", PC, NONE,  "ADD HL HL(INT)"),
ADD_HL_HL6 => (ADD_HL_HL7, FETCH,      T, H, ADDC,  F,    X"BF", PC, NONE,  "ADD HL HL(INT)"),
ADD_HL_HL7 => (FETCH,      FETCH,      H, T, NULLL, NONE, X"00", PC, FETCH, "ADD HL HL(INT)"),

ADD_HL_SP  => (ADD_HL_SP2, FETCH,      T, SP_L, NULLL, NONE, X"00", PC, NONE,  "ADD HL SP     "),
ADD_HL_SP2 => (ADD_HL_SP3, FETCH,      T, L,    ADD,   F,    X"41", PC, NONE,  "ADD HL SP(INT)"),
ADD_HL_SP3 => (ADD_HL_SP4, FETCH,      L, T,    NULLL, NONE, X"00", PC, NONE,  "ADD HL SP(INT)"),
ADD_HL_SP4 => (ADD_HL_SP5, ADD_HL_SP6, T, SP_H, TST_Z, F,    X"00", PC, NONE,  "ADD HL SP(INT)"),
ADD_HL_SP5 => (ADD_HL_SP7, FETCH,      T, H,    ADDC,  F,    X"FF", PC, NONE,  "ADD HL SP(INT)"),
ADD_HL_SP6 => (ADD_HL_SP7, FETCH,      T, H,    ADDC,  F,    X"BF", PC, NONE,  "ADD HL SP(INT)"),
ADD_HL_SP7 => (FETCH,       FETCH,     H, T,    NULLL, NONE, X"00", PC, FETCH, "ADD HL SP(INT)"),

ADDC_HL_BC  => (ADDC_HL_BC2, FETCH,       T, C, NULLL, NONE, X"00", PC, NONE,  "ADDC HL BC    "),
ADDC_HL_BC2 => (ADDC_HL_BC3, FETCH,       T, L, ADDC,  F,    X"41", PC, NONE,  "ADDC HL BC(INT"),
ADDC_HL_BC3 => (ADDC_HL_BC4, FETCH,       L, T, NULLL, NONE, X"00", PC, NONE,  "ADDC HL BC(INT"),
ADDC_HL_BC4 => (ADDC_HL_BC5, ADDC_HL_BC6, T, B, TST_Z, F,    X"00", PC, NONE,  "ADDC HL BC(INT"),
ADDC_HL_BC5 => (ADDC_HL_BC7, FETCH,       T, H, ADDC,  F,    X"FF", PC, NONE,  "ADDC HL BC(INT"),
ADDC_HL_BC6 => (ADDC_HL_BC7, FETCH,       T, H, ADDC,  F,    X"BF", PC, NONE,  "ADDC HL BC(INT"),
ADDC_HL_BC7 => (FETCH,       FETCH,       H, T, NULLL, NONE, X"00", PC, FETCH, "ADDC HL BC(INT"),

ADDC_HL_DE  => (ADDC_HL_DE2, FETCH,       T, E, NULLL, NONE, X"00", PC, NONE,  "ADDC HL DE    "),
ADDC_HL_DE2 => (ADDC_HL_DE3, FETCH,       T, L, ADDC,  F,    X"41", PC, NONE,  "ADDC HL DE(INT"),
ADDC_HL_DE3 => (ADDC_HL_DE4, FETCH,       L, T, NULLL, NONE, X"00", PC, NONE,  "ADDC HL DE(INT"),
ADDC_HL_DE4 => (ADDC_HL_DE5, ADDC_HL_DE6, T, D, TST_Z, F,    X"00", PC, NONE,  "ADDC HL DE(INT"),
ADDC_HL_DE5 => (ADDC_HL_DE7, FETCH,       T, H, ADDC,  F,    X"FF", PC, NONE,  "ADDC HL DE(INT"),
ADDC_HL_DE6 => (ADDC_HL_DE7, FETCH,       T, H, ADDC,  F,    X"BF", PC, NONE,  "ADDC HL DE(INT"),
ADDC_HL_DE7 => (FETCH,       FETCH,       H, T, NULLL, NONE, X"00", PC, FETCH, "ADDC HL DE(INT"),

ADDC_HL_HL  => (ADDC_HL_HL2, FETCH,       T, L, NULLL, NONE, X"00", PC, NONE,  "ADDC HL HL    "),
ADDC_HL_HL2 => (ADDC_HL_HL3, FETCH,       T, L, ADDC,  F,    X"41", PC, NONE,  "ADDC HL HL(INT"),
ADDC_HL_HL3 => (ADDC_HL_HL4, FETCH,       L, T, NULLL, NONE, X"00", PC, NONE,  "ADDC HL HL(INT"),
ADDC_HL_HL4 => (ADDC_HL_HL5, ADDC_HL_HL6, T, H, TST_Z, F,    X"00", PC, NONE,  "ADDC HL HL(INT"),
ADDC_HL_HL5 => (ADDC_HL_HL7, FETCH,       T, H, ADDC,  F,    X"FF", PC, NONE,  "ADDC HL HL(INT"),
ADDC_HL_HL6 => (ADDC_HL_HL7, FETCH,       T, H, ADDC,  F,    X"BF", PC, NONE,  "ADDC HL HL(INT"),
ADDC_HL_HL7 => (FETCH,       FETCH,       H, T, NULLL, NONE, X"00", PC, FETCH, "ADDC HL HL(INT"),

ADDC_HL_SP  => (ADDC_HL_SP2, FETCH,       T, SP_L, NULLL,  NONE, X"00", PC, NONE,  "ADDC HL SP    "),
ADDC_HL_SP2 => (ADDC_HL_SP3, FETCH,       T, L,    ADDC,   F,    X"41", PC, NONE,  "ADDC HL SP(INT"),
ADDC_HL_SP3 => (ADDC_HL_SP4, FETCH,       L, T,    NULLL,  NONE, X"00", PC, NONE,  "ADDC HL SP(INT"),
ADDC_HL_SP4 => (ADDC_HL_SP5, ADDC_HL_SP6, T, SP_H, TST_Z,  F,    X"00", PC, NONE,  "ADDC HL SP(INT"),
ADDC_HL_SP5 => (ADDC_HL_SP7, FETCH,       T, H,    ADDC,   F,    X"FF", PC, NONE,  "ADDC HL SP(INT"),
ADDC_HL_SP6 => (ADDC_HL_SP7, FETCH,       T, H,    ADDC,   F,    X"BF", PC, NONE,  "ADDC HL SP(INT"),
ADDC_HL_SP7 => (FETCH,       FETCH,       H, T,    NULLL,  NONE, X"00", PC, FETCH, "ADDC HL SP(INT"),

SUBC_HL_BC  => (SUBC_HL_BC2, FETCH,       T, L, NULLL, NONE, X"00", PC, NONE,  "SUBC HL BC    "),
SUBC_HL_BC2 => (SUBC_HL_BC3, FETCH,       T, C, SUBC,  F,    X"41", PC, NONE,  "SUBC HL BC(INT"),
SUBC_HL_BC3 => (SUBC_HL_BC4, FETCH,       L, T, NULLL, NONE, X"00", PC, NONE,  "SUBC HL BC(INT"),
SUBC_HL_BC4 => (SUBC_HL_BC5, SUBC_HL_BC6, T, H, TST_Z, F,    X"00", PC, NONE,  "SUBC HL BC(INT"),
SUBC_HL_BC5 => (SUBC_HL_BC7, FETCH,       T, B, SUBC,  F,    X"FF", PC, NONE,  "SUBC HL BC(INT"),
SUBC_HL_BC6 => (SUBC_HL_BC7, FETCH,       T, H, SUBC,  F,    X"BF", PC, NONE,  "SUBC HL BC(INT"),
SUBC_HL_BC7 => (FETCH,       FETCH,       H, T, NULLL, NONE, X"00", PC, FETCH, "SUBC HL BC(INT"),

SUBC_HL_DE  => (SUBC_HL_DE2, FETCH,       T, L, NULLL, NONE, X"00", PC, NONE,  "SUBC HL DE    "),
SUBC_HL_DE2 => (SUBC_HL_DE3, FETCH,       T, E, SUBC,  F,    X"41", PC, NONE,  "SUBC HL DE(INT"),
SUBC_HL_DE3 => (SUBC_HL_DE4, FETCH,       L, T, NULLL, NONE, X"00", PC, NONE,  "SUBC HL DE(INT"),
SUBC_HL_DE4 => (SUBC_HL_DE5, SUBC_HL_DE6, T, H, TST_Z, F,    X"00", PC, NONE,  "SUBC HL DE(INT"),
SUBC_HL_DE5 => (SUBC_HL_DE7, FETCH,       T, D, SUBC,  F,    X"FF", PC, NONE,  "SUBC HL DE(INT"),
SUBC_HL_DE6 => (SUBC_HL_DE7, FETCH,       T, H, SUBC,  F,    X"BF", PC, NONE,  "SUBC HL DE(INT"),
SUBC_HL_DE7 => (FETCH,       FETCH,       H, T, NULLL, NONE, X"00", PC, FETCH, "SUBC HL DE(INT"),

SUBC_HL_HL  => (SUBC_HL_HL2, FETCH,       T, L, NULLL, NONE, X"00", PC, NONE,  "SUBC HL HL    "),
SUBC_HL_HL2 => (SUBC_HL_HL3, FETCH,       T, L, SUBC,  F,    X"41", PC, NONE,  "SUBC HL HL(INT"),
SUBC_HL_HL3 => (SUBC_HL_HL4, FETCH,       L, T, NULLL, NONE, X"00", PC, NONE,  "SUBC HL HL(INT"),
SUBC_HL_HL4 => (SUBC_HL_HL5, SUBC_HL_HL6, T, H, TST_Z, F,    X"00", PC, NONE,  "SUBC HL HL(INT"),
SUBC_HL_HL5 => (SUBC_HL_HL7, FETCH,       T, H, SUBC,  F,    X"FF", PC, NONE,  "SUBC HL HL(INT"),
SUBC_HL_HL6 => (SUBC_HL_HL7, FETCH,       T, H, SUBC,  F,    X"BF", PC, NONE,  "SUBC HL HL(INT"),
SUBC_HL_HL7 => (FETCH,       FETCH,       H, T, NULLL, NONE, X"00", PC, FETCH, "SUBC HL HL(INT"),

SUBC_HL_SP  => (SUBC_HL_SP2, FETCH,       T, L,    NULLL,  NONE, X"00", PC, NONE,  "SUBC HL SP    "),
SUBC_HL_SP2 => (SUBC_HL_SP3, FETCH,       T, SP_L, SUBC,   F,    X"41", PC, NONE,  "SUBC HL SP(INT"),
SUBC_HL_SP3 => (SUBC_HL_SP4, FETCH,       L, T,    NULLL,  NONE, X"00", PC, NONE,  "SUBC HL SP(INT"),
SUBC_HL_SP4 => (SUBC_HL_SP5, SUBC_HL_SP6, T, H,    TST_Z,  F,    X"00", PC, NONE,  "SUBC HL SP(INT"),
SUBC_HL_SP5 => (SUBC_HL_SP7, FETCH,       T, SP_H, SUBC,   F,    X"FF", PC, NONE,  "SUBC HL SP(INT"),
SUBC_HL_SP6 => (SUBC_HL_SP7, FETCH,       T, H,    SUBC,   F,    X"BF", PC, NONE,  "SUBC HL SP(INT"),
SUBC_HL_SP7 => (FETCH,       FETCH,       H, T,    NULLL,  NONE, X"00", PC, FETCH, "SUBC HL SP(INT"),

INC_BC => (FETCH,   FETCH,   NONE, NONE, INCBC, NONE, X"00", PC,  FETCH, "INC BC        "),
INC_DE => (FETCH,   FETCH,   NONE, NONE, INCDE, NONE, X"00", PC,  FETCH, "INC DE        "),
INC_HL => (FETCH,   FETCH,   NONE, NONE, INCHL, NONE, X"00", PC,  FETCH, "INC HL        "),
INC_SP => (FETCH,   FETCH,   NONE, NONE, INCSP, NONE, X"00", PC,  FETCH, "INC SP        "),

DEC_BC => (FETCH,   FETCH,   NONE, NONE, DECBC, NONE, X"00", PC,  FETCH, "DEC BC        "),
DEC_DE => (FETCH,   FETCH,   NONE, NONE, DECDE, NONE, X"00", PC,  FETCH, "DEC DE        "),
DEC_HL => (FETCH,   FETCH,   NONE, NONE, DECHL, NONE, X"00", PC,  FETCH, "DEC HL        "),
DEC_SP => (FETCH,   FETCH,   NONE, NONE, DECSP, NONE, X"00", PC,  FETCH, "DEC SP        "),

--*********************************--
--                                 --
--   ROTATE AND SHIFT GROUP        --
--                                 --
--*********************************--

RLCA => ( FETCH, FETCH, A, A, RLC, F, X"3B", PC, FETCH, "RLCA          "),
RLA  => ( FETCH, FETCH, A, A, RL,  F, X"3B", PC, FETCH, "RLA           "),
RRCA => ( FETCH, FETCH, A, A, RRC, F, X"3B", PC, FETCH, "RRCA          "),
RRA  => ( FETCH, FETCH, A, A, RR,  F, X"3B", PC, FETCH, "RRA           "),

RLC_A  => ( RLC_A2, LD_A_RLC_bIXdb, T, A,  TST_EC, NONE, X"00", PC, NONE,  "RLC A         "),
RLC_A2 => ( RLC_A3, FETCH,          T, T,  RLC,    F,    X"FF", PC, NONE,  "RLC A (int)   "),
RLC_A3 => ( FETCH,  FETCH,          A, T,  NULLL,  NONE, X"00", PC, FETCH, "RLC A (int)   "),

LD_A_RLC_bIXdb => ( RLC_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, RLC(IX+d"),

RLC_B  => ( RLC_B2, LD_B_RLC_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "RLC B         "),
RLC_B2 => ( RLC_B3, FETCH,          T, T,  RLC,    F,    X"FF", PC, NONE,  "RLC B (int)   "),
RLC_B3 => ( FETCH,  FETCH,          B, T,  NULLL,  NONE, X"00", PC, FETCH, "RLC B (int)   "),

LD_B_RLC_bIXdb => ( RLC_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, RLC(IX+d"),

RLC_C  => ( RLC_C2, LD_C_RLC_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "RLC C         "),
RLC_C2 => ( RLC_C3, FETCH,          T, T,  RLC,    F,    X"FF", PC, NONE,  "RLC C (int)   "),
RLC_C3 => ( FETCH,  FETCH,          C, T,  NULLL,  NONE, X"00", PC, FETCH, "RLC C (int)   "),

LD_C_RLC_bIXdb => ( RLC_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, RLC(IX+d"),

RLC_D  => ( RLC_D2, LD_D_RLC_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "RLC D         "),
RLC_D2 => ( RLC_D3, FETCH,          T, T,  RLC,    F,    X"FF", PC, NONE,  "RLC D (int)   "),
RLC_D3 => ( FETCH,  FETCH,          D, T,  NULLL,  NONE, X"00", PC, FETCH, "RLC D (int)   "),

LD_D_RLC_bIXdb => ( RLC_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, RLC(IX+d"),

RLC_E  => ( RLC_E2, LD_E_RLC_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "RLC E         "),
RLC_E2 => ( RLC_E3, FETCH,          T, T,  RLC,    F,    X"FF", PC, NONE,  "RLC E (int)   "),
RLC_E3 => ( FETCH,  FETCH,          E, T,  NULLL,  NONE, X"00", PC, FETCH, "RLC E (int)   "),

LD_E_RLC_bIXdb => ( RLC_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, RLC(IX+d"),

RLC_H  => ( RLC_H2, LD_H_RLC_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "RLC H         "),
RLC_H2 => ( RLC_H3, FETCH,          T, T,  RLC,    F,    X"FF", PC, NONE,  "RLC H (int)   "),
RLC_H3 => ( FETCH,  FETCH,          H, T,  NULLL,  NONE, X"00", PC, FETCH, "RLC H (int)   "),

LD_H_RLC_bIXdb => ( RLC_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, RLC(IX+d"),

RLC_L  => ( RLC_L2, LD_L_RLC_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "RLC L         "),
RLC_L2 => ( RLC_L3, FETCH,          T, T,  RLC,    F,    X"FF", PC, NONE,  "RLC L (int)   "),
RLC_L3 => ( FETCH,  FETCH,          L, T,  NULLL,  NONE, X"00", PC, FETCH, "RLC L (int)   "),

LD_L_RLC_bIXdb => ( RLC_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, RLC(IX+d"),

RLC_bHLb  => ( RLC_bHLb2, RLC_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", PC, NONE,   "RLC (HL)      "),
RLC_bHLb2 => ( RLC_bHLb3, FETCH,     T,      EXTERN, RLC,    F,    X"FF", HL, MEM_RD, "RLC (HL)(int) "),
RLC_bHLb3 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RLC (HL)(int) "),

RLC_bIXdb  => ( RLC_bIXdb2, FETCH, T,      EXTERN, RLC,   F,    X"FF", TT, MEM_RD, "RLC (IX+d)(int"),
RLC_bIXdb2 => ( FETCH,      FETCH, EXTERN, T,      NULLL, NONE, X"00", TT, MEM_WR, "RLC (IX+d)(int"),

RL_A  => ( RL_A2, LD_A_RL_bIXdb, T, A, TST_EC, NONE, X"00", PC, NONE,  "RL  A         "),
RL_A2 => ( RL_A3, FETCH,         T, T, RL,     F,    X"FF", PC, NONE,  "RL  A (int)   "),
RL_A3 => ( FETCH, FETCH,         A, T, NULLL,  NONE, X"00", PC, FETCH, "RL  A (int)   "),

LD_A_RL_bIXdb => ( RL_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, RLC(IX+d"),

RL_B  => ( RL_B2, LD_B_RL_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "RL  B         "),
RL_B2 => ( RL_B3, FETCH,         T, T,  RL,     F,    X"FF", PC, NONE,  "RL  B (int)   "),
RL_B3 => ( FETCH, FETCH,         B, T,  NULLL,  NONE, X"00", PC, FETCH, "RL  B (int)   "),

LD_B_RL_bIXdb => ( RL_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, RLC(IX+d"),

RL_C  => ( RL_C2, LD_C_RL_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "RL  C         "),
RL_C2 => ( RL_C3, FETCH,         T, T,  RL,     F,    X"FF", PC, NONE,  "RL  C (int)   "),
RL_C3 => ( FETCH, FETCH,         C, T,  NULLL,  NONE, X"00", PC, FETCH, "RL  C (int)   "),

LD_C_RL_bIXdb => ( RL_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, RLC(IX+d"),

RL_D  => ( RL_D2, LD_D_RL_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "RL  D         "),
RL_D2 => ( RL_D3, FETCH,         T, T,  RL,     F,    X"FF", PC, NONE,  "RL  D (int)   "),
RL_D3 => ( FETCH, FETCH,         D, T,  NULLL,  NONE, X"00", PC, FETCH, "RL  D (int)   "),

LD_D_RL_bIXdb => ( RL_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, RLC(IX+d"),

RL_E  => ( RL_E2, LD_E_RL_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "RL  E         "),
RL_E2 => ( RL_E3, FETCH,         T, T,  RL,     F,    X"FF", PC, NONE,  "RL  E (int)   "),
RL_E3 => ( FETCH, FETCH,         E, T,  NULLL,  NONE, X"00", PC, FETCH, "RL  E (int)   "),

LD_E_RL_bIXdb => ( RL_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, RLC(IX+d"),

RL_H  => ( RL_H2, LD_H_RL_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "RL  H         "),
RL_H2 => ( RL_H3, FETCH,         T, T,  RL,     F,    X"FF", PC, NONE,  "RL  H (int)   "),
RL_H3 => ( FETCH, FETCH,         H, T,  NULLL,  NONE, X"00", PC, FETCH, "RL  H (int)   "),

LD_H_RL_bIXdb => ( RL_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, RLC(IX+d"),

RL_L  => ( RL_L2, LD_L_RL_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "RL  L         "),
RL_L2 => ( RL_L3, FETCH,         T, T,  RL,     F,    X"FF", PC, NONE,  "RL  L (int)   "),
RL_L3 => ( FETCH, FETCH,         L, T,  NULLL,  NONE, X"00", PC, FETCH, "RL  L (int)   "),

LD_L_RL_bIXdb => ( RL_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, RLC(IX+d"),

RL_bHLb  => ( RL_bHLb2, RL_bIXdb, NONE,  NONE,   TST_EC, NONE, X"00", PC, NONE,    "RL  (HL)      "),
RL_bHLb2 => ( RL_bHLb3, FETCH,   T,      EXTERN, RL,     F,    X"FF", HL, MEM_RD, "RL  (HL)      "),
RL_bHLb3 => ( FETCH,    FETCH,   EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RL  (HL)(int) "),

RL_bIXdb  => ( RL_bIXdb2, FETCH, T,      EXTERN, RL,    F,    X"FF", TT, MEM_RD, "RL  (IX+d)(int"),
RL_bIXdb2 => ( FETCH,     FETCH, EXTERN, T,      NULLL, NONE, X"00", TT, MEM_WR, "RL  (IX+d)(int"),

RRC_A  => ( RRC_A2, LD_A_RRC_bIXdb, T, A,  TST_EC, NONE, X"00", PC, NONE,  "RRC A         "),
RRC_A2 => ( RRC_A3, FETCH,          T, T,  RRC,    F,    X"FF", PC, NONE,  "RRC A (int)   "),
RRC_A3 => ( FETCH,  FETCH,          A, T,  NULLL,  NONE, X"00", PC, FETCH, "RRC A (int)   "),

LD_A_RRC_bIXdb => ( RRC_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, RRC(IX+d"),

RRC_B  => ( RRC_B2, LD_B_RRC_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "RRC B         "),
RRC_B2 => ( RRC_B3, FETCH,          T, T,  RRC,    F,    X"FF", PC, NONE,  "RRC B (int)   "),
RRC_B3 => ( FETCH,  FETCH,          B, T,  NULLL,  NONE, X"00", PC, FETCH, "RRC B (int)   "),

LD_B_RRC_bIXdb => ( RRC_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, RRC(IX+d"),

RRC_C  => ( RRC_C2, LD_C_RRC_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "RRC C         "),
RRC_C2 => ( RRC_C3, FETCH,          T, T,  RRC,    F,    X"FF", PC, NONE,  "RRC C (int)   "),
RRC_C3 => ( FETCH,  FETCH,          C, T,  NULLL,  NONE, X"00", PC, FETCH, "RRC C (int)   "),

LD_C_RRC_bIXdb => ( RRC_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, RRC(IX+d"),

RRC_D  => ( RRC_D2, LD_D_RRC_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "RRC D         "),
RRC_D2 => ( RRC_D3, FETCH,          T, T,  RRC,    F,    X"FF", PC, NONE,  "RRC D (int)   "),
RRC_D3 => ( FETCH,  FETCH,          D, T,  NULLL,  NONE, X"00", PC, FETCH, "RRC D (int)   "),

LD_D_RRC_bIXdb => ( RRC_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, RRC(IX+d"),

RRC_E  => ( RRC_E2, LD_E_RRC_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "RRC E         "),
RRC_E2 => ( RRC_E3, FETCH,          T, T,  RRC,    F,    X"FF", PC, NONE,  "RRC E (int)   "),
RRC_E3 => ( FETCH,  FETCH,          E, T,  NULLL,  NONE, X"00", PC, FETCH, "RRC E (int)   "),

LD_E_RRC_bIXdb => ( RRC_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, RRC(IX+d"),

RRC_H  => ( RRC_H2, LD_H_RRC_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "RRC H         "),
RRC_H2 => ( RRC_H3, FETCH,          T, T,  RRC,    F,    X"FF", PC, NONE,  "RRC H (int)   "),
RRC_H3 => ( FETCH,  FETCH,          H, T,  NULLL,  NONE, X"00", PC, FETCH, "RRC H (int)   "),

LD_H_RRC_bIXdb => ( RRC_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, RRC(IX+d"),

RRC_L  => ( RRC_L2, LD_L_RRC_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "RRC L         "),
RRC_L2 => ( RRC_L3, FETCH,          T, T,  RRC,    F,    X"FF", PC, NONE,  "RRC L (int)   "),
RRC_L3 => ( FETCH,  FETCH,          L, T,  NULLL,  NONE, X"00", PC, FETCH, "RRC L (int)   "),

LD_L_RRC_bIXdb => ( RRC_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, RRC(IX+d"),

RRC_bHLb  => ( RRC_bHLb2, RRC_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", PC, NONE,   "ADD A,(HL)    "),
RRC_bHLb2 => ( RRC_bHLb3, FETCH,     T,      EXTERN, RRC,    F,    X"FF", HL, MEM_RD, "RRC (HL)      "),
RRC_bHLb3 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RRC (HL)(int) "),

RRC_bIXdb  => ( RRC_bIXdb2, FETCH, T,      EXTERN, RRC,   F,    X"FF", TT, MEM_RD, "RRC (IX+d)(int"),
RRC_bIXdb2 => ( FETCH,      FETCH, EXTERN, T,      NULLL, NONE, X"00", TT, MEM_WR, "RRC (IX+d)(int"),

RR_A  => ( RR_A2, LD_A_RR_bIXdb, T, A, TST_EC, NONE, X"00", PC, NONE,  "RR  A         "),
RR_A2 => ( RR_A3, FETCH,         T, T, RR,     F,    X"FF", PC, NONE,  "RR  A (int)   "),
RR_A3 => ( FETCH, FETCH,         A, T, NULLL,  NONE, X"00", PC, FETCH, "RR  A (int)   "),

LD_A_RR_bIXdb => ( RR_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, RRC(IX+d"),

RR_B  => ( RR_B2, LD_B_RR_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "RR  B         "),
RR_B2 => ( RR_B3, FETCH,         T, T,  RR,     F,    X"FF", PC, NONE,  "RR  B (int)   "),
RR_B3 => ( FETCH, FETCH,         B, T,  NULLL,  NONE, X"00", PC, FETCH, "RR  B (int)   "),

LD_B_RR_bIXdb => ( RR_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, RRC(IX+d"),

RR_C  => ( RR_C2, LD_C_RR_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "RR  C         "),
RR_C2 => ( RR_C3, FETCH,         T, T,  RR,     F,    X"FF", PC, NONE,  "RR  C (int)   "),
RR_C3 => ( FETCH, FETCH,         C, T,  NULLL,  NONE, X"00", PC, FETCH, "RR  C (int)   "),

LD_C_RR_bIXdb => ( RR_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, RRC(IX+d"),

RR_D  => ( RR_D2, LD_D_RR_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "RR  D         "),
RR_D2 => ( RR_D3, FETCH,         T, T,  RR,     F,    X"FF", PC, NONE,  "RR  D (int)   "),
RR_D3 => ( FETCH, FETCH,         D, T,  NULLL,  NONE, X"00", PC, FETCH, "RR  D (int)   "),

LD_D_RR_bIXdb => ( RR_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, RRC(IX+d"),

RR_E  => ( RR_E2, LD_E_RR_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "RR  E         "),
RR_E2 => ( RR_E3, FETCH,         T, T,  RR,     F,    X"FF", PC, NONE,  "RR  E (int)   "),
RR_E3 => ( FETCH, FETCH,         E, T,  NULLL,  NONE, X"00", PC, FETCH, "RR  E (int)   "),

LD_E_RR_bIXdb => ( RR_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, RRC(IX+d"),

RR_H  => ( RR_H2, LD_H_RR_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "RR  H         "),
RR_H2 => ( RR_H3, FETCH,         T, T,  RR,     F,    X"FF", PC, NONE,  "RR  H (int)   "),
RR_H3 => ( FETCH, FETCH,         H, T,  NULLL,  NONE, X"00", PC, FETCH, "RR  H (int)   "),

LD_H_RR_bIXdb => ( RR_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, RRC(IX+d"),

RR_L  => ( RR_L2, LD_L_RR_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "RR  L         "),
RR_L2 => ( RR_L3, FETCH,         T, T,  RR,     F,    X"FF", PC, NONE,  "RR  L (int)   "),
RR_L3 => ( FETCH, FETCH,         L, T,  NULLL,  NONE, X"00", PC, FETCH, "RR  L (int)   "),

LD_L_RR_bIXdb => ( RR_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, RRC(IX+d"),

RR_bHLb  => ( RR_bHLb2, RR_bIXdb, NONE,  NONE,   TST_EC, NONE, X"00", PC, NONE,    "RR  (HL)      "),
RR_bHLb2 => ( RR_bHLb3, FETCH,   T,      EXTERN, RR,     F,    X"FF", HL, MEM_RD, "RR  (HL)      "),
RR_bHLb3 => ( FETCH,    FETCH,   EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RR  (HL)(int) "),

RR_bIXdb  => ( RR_bIXdb2, FETCH, T,      EXTERN, RR,    F,    X"FF", TT, MEM_RD, "RR  (IX+d)(int"),
RR_bIXdb2 => ( FETCH,     FETCH, EXTERN, T,      NULLL, NONE, X"00", TT, MEM_WR, "RR  (IX+d)(int"),

SLA_A  => ( SLA_A2, LD_A_SLA_bIXdb, T, A,  TST_EC, NONE, X"00", PC, NONE,  "SLA A         "),
SLA_A2 => ( SLA_A3, FETCH,          T, T,  SLAA,   F,    X"FF", PC, NONE,  "SLA A (int)   "),
SLA_A3 => ( FETCH,  FETCH,          A, T,  NULLL,  NONE, X"00", PC, FETCH, "SLA A (int)   "),

LD_A_SLA_bIXdb => ( SLA_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, SLA(IX+d"),

SLA_B  => ( SLA_B2, LD_B_SLA_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "SLA B         "),
SLA_B2 => ( SLA_B3, FETCH,          T, T,  SLAA,   F,    X"FF", PC, NONE,  "SLA B (int)   "),
SLA_B3 => ( FETCH,  FETCH,          B, T,  NULLL,  NONE, X"00", PC, FETCH, "SLA B (int)   "),

LD_B_SLA_bIXdb => ( SLA_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, SLA(IX+d"),

SLA_C  => ( SLA_C2, LD_C_SLA_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "SLA C         "),
SLA_C2 => ( SLA_C3, FETCH,          T, T,  SLAA,   F,    X"FF", PC, NONE,  "SLA C (int)   "),
SLA_C3 => ( FETCH,  FETCH,          C, T,  NULLL,  NONE, X"00", PC, FETCH, "SLA C (int)   "),

LD_C_SLA_bIXdb => ( SLA_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, SLA(IX+d"),

SLA_D  => ( SLA_D2, LD_D_SLA_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "SLA D         "),
SLA_D2 => ( SLA_D3, FETCH,          T, T,  SLAA,   F,    X"FF", PC, NONE,  "SLA D (int)   "),
SLA_D3 => ( FETCH,  FETCH,          D, T,  NULLL,  NONE, X"00", PC, FETCH, "SLA D (int)   "),

LD_D_SLA_bIXdb => ( SLA_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, SLA(IX+d"),

SLA_E  => ( SLA_E2, LD_E_SLA_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "SLA E         "),
SLA_E2 => ( SLA_E3, FETCH,          T, T,  SLAA,   F,    X"FF", PC, NONE,  "SLA E (int)   "),
SLA_E3 => ( FETCH,  FETCH,          E, T,  NULLL,  NONE, X"00", PC, FETCH, "SLA E (int)   "),

LD_E_SLA_bIXdb => ( SLA_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, SLA(IX+d"),

SLA_H  => ( SLA_H2, LD_H_SLA_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "SLA H         "),
SLA_H2 => ( SLA_H3, FETCH,          T, T,  SLAA,   F,    X"FF", PC, NONE,  "SLA H (int)   "),
SLA_H3 => ( FETCH,  FETCH,          H, T,  NULLL,  NONE, X"00", PC, FETCH, "SLA H (int)   "),

LD_H_SLA_bIXdb => ( SLA_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, SLA(IX+d"),

SLA_L  => ( SLA_L2, LD_L_SLA_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "SLA L         "),
SLA_L2 => ( SLA_L3, FETCH,          T, T,  SLAA,   F,    X"FF", PC, NONE,  "SLA L (int)   "),
SLA_L3 => ( FETCH,  FETCH,          L, T,  NULLL,  NONE, X"00", PC, FETCH, "SLA L (int)   "),

LD_L_SLA_bIXdb => ( SLA_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, SLA(IX+d"),

SLA_bHLb  => ( SLA_bHLb2, SLA_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", PC, NONE,   "ADD A,(HL)    "),
SLA_bHLb2 => ( SLA_bHLb3, FETCH,     T,      EXTERN, SLAA,   F,    X"FF", HL, MEM_RD, "SLA (HL)      "),
SLA_bHLb3 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SLA (HL)(int) "),

SLA_bIXdb  => ( SLA_bIXdb2, FETCH, T,      EXTERN, SLAA,  F,    X"FF", TT, MEM_RD, "SLA (IX+d)(int"),
SLA_bIXdb2 => ( FETCH,      FETCH, EXTERN, T,      NULLL, NONE, X"00", TT, MEM_WR, "SLA (IX+d)(int"),

SRA_A  => ( SRA_A2, LD_A_SRA_bIXdb, T, A,  TST_EC, NONE, X"00", PC, NONE,  "SRA A         "),
SRA_A2 => ( SRA_A3, FETCH,          T, T,  SRAA,   F,    X"FF", PC, NONE,  "SRA A (int)   "),
SRA_A3 => ( FETCH,  FETCH,          A, T,  NULLL,  NONE, X"00", PC, FETCH, "SRA A (int)   "),

LD_A_SRA_bIXdb => ( SRA_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, SRA(IX+d"),

SRA_B  => ( SRA_B2, LD_B_SRA_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "SRA B         "),
SRA_B2 => ( SRA_B3, FETCH,          T, T,  SRAA,   F,    X"FF", PC, NONE,  "SRA B (int)   "),
SRA_B3 => ( FETCH,  FETCH,          B, T,  NULLL,  NONE, X"00", PC, FETCH, "SRA B (int)   "),

LD_B_SRA_bIXdb => ( SRA_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, SRA(IX+d"),

SRA_C  => ( SRA_C2, LD_C_SRA_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "SRA C         "),
SRA_C2 => ( SRA_C3, FETCH,          T, T,  SRAA,   F,    X"FF", PC, NONE,  "SRA C (int)   "),
SRA_C3 => ( FETCH,  FETCH,          C, T,  NULLL,  NONE, X"00", PC, FETCH, "SRA C (int)   "),

LD_C_SRA_bIXdb => ( SRA_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, SRA(IX+d"),

SRA_D  => ( SRA_D2, LD_D_SRA_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "SRA D         "),
SRA_D2 => ( SRA_D3, FETCH,          T, T,  SRAA,   F,    X"FF", PC, NONE,  "SRA D (int)   "),
SRA_D3 => ( FETCH,  FETCH,          D, T,  NULLL,  NONE, X"00", PC, FETCH, "SRA D (int)   "),

LD_D_SRA_bIXdb => ( SRA_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, SRA(IX+d"),

SRA_E  => ( SRA_E2, LD_E_SRA_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "SRA E         "),
SRA_E2 => ( SRA_E3, FETCH,          T, T,  SRAA,   F,    X"FF", PC, NONE,  "SRA E (int)   "),
SRA_E3 => ( FETCH,  FETCH,          E, T,  NULLL,  NONE, X"00", PC, FETCH, "SRA E (int)   "),

LD_E_SRA_bIXdb => ( SRA_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, SRA(IX+d"),

SRA_H  => ( SRA_H2, LD_H_SRA_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "SRA H         "),
SRA_H2 => ( SRA_H3, FETCH,          T, T,  SRAA,   F,    X"FF", PC, NONE,  "SRA H (int)   "),
SRA_H3 => ( FETCH,  FETCH,          H, T,  NULLL,  NONE, X"00", PC, FETCH, "SRA H (int)   "),

LD_H_SRA_bIXdb => ( SRA_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, SRA(IX+d"),

SRA_L  => ( SRA_L2, LD_L_SRA_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "SRA L         "),
SRA_L2 => ( SRA_L3, FETCH,          T, T,  SRAA,   F,    X"FF", PC, NONE,  "SRA L (int)   "),
SRA_L3 => ( FETCH,  FETCH,          L, T,  NULLL,  NONE, X"00", PC, FETCH, "SRA L (int)   "),

LD_L_SRA_bIXdb => ( SRA_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, SRA(IX+d"),

SRA_bHLb  => ( SRA_bHLb2, SRA_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", PC, NONE,   "SRA (HL)      "),
SRA_bHLb2 => ( SRA_bHLb3, FETCH,     T,      EXTERN, SRAA,   F,    X"FF", HL, MEM_RD, "SRA (HL)      "),
SRA_bHLb3 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SRA (HL)(int) "),

SRA_bIXdb  => ( SRA_bIXdb2, FETCH, T,      EXTERN, SRAA,  F,    X"FF", TT, MEM_RD, "SRA (IX+d)(int"),
SRA_bIXdb2 => ( FETCH,      FETCH, EXTERN, T,      NULLL, NONE, X"00", TT, MEM_WR, "SRA (IX+d)(int"),

SLL_A  => ( SLL_A2, LD_A_SLL_bIXdb, T, A,  TST_EC, NONE, X"00", PC, NONE,  "SLL A         "),
SLL_A2 => ( SLL_A3, FETCH,          T, T,  SLLL,   F,    X"FF", PC, NONE,  "SLL A (int)   "),
SLL_A3 => ( FETCH,  FETCH,          A, T,  NULLL,  NONE, X"00", PC, FETCH, "SLL A (int)   "),

LD_A_SLL_bIXdb => ( SLL_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, SLL(IX+d"),

SLL_B  => ( SLL_B2, LD_B_SLL_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "SLL B         "),
SLL_B2 => ( SLL_B3, FETCH,          T, T,  SLLL,   F,    X"FF", PC, NONE,  "SLL B (int)   "),
SLL_B3 => ( FETCH,  FETCH,          B, T,  NULLL,  NONE, X"00", PC, FETCH, "SLL B (int)   "),

LD_B_SLL_bIXdb => ( SLL_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, SLL(IX+d"),

SLL_C  => ( SLL_C2, LD_C_SLL_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "SLL C         "),
SLL_C2 => ( SLL_C3, FETCH,          T, T,  SLLL,   F,    X"FF", PC, NONE,  "SLL C (int)   "),
SLL_C3 => ( FETCH,  FETCH,          C, T,  NULLL,  NONE, X"00", PC, FETCH, "SLL C (int)   "),

LD_C_SLL_bIXdb => ( SLL_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, SLL(IX+d"),

SLL_D  => ( SLL_D2, LD_D_SLL_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "SLL D         "),
SLL_D2 => ( SLL_D3, FETCH,          T, T,  SLLL,   F,    X"FF", PC, NONE,  "SLL D (int)   "),
SLL_D3 => ( FETCH,  FETCH,          D, T,  NULLL,  NONE, X"00", PC, FETCH, "SLL D (int)   "),

LD_D_SLL_bIXdb => ( SLL_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, SLL(IX+d"),

SLL_E  => ( SLL_E2, LD_E_SLL_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "SLL E         "),
SLL_E2 => ( SLL_E3, FETCH,          T, T,  SLLL,   F,    X"FF", PC, NONE,  "SLL E (int)   "),
SLL_E3 => ( FETCH,  FETCH,          E, T,  NULLL,  NONE, X"00", PC, FETCH, "SLL E (int)   "),

LD_E_SLL_bIXdb => ( SLL_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, SLL(IX+d"),

SLL_H  => ( SLL_H2, LD_H_SLL_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "SLL H         "),
SLL_H2 => ( SLL_H3, FETCH,          T, T,  SLLL,   F,    X"FF", PC, NONE,  "SLL H (int)   "),
SLL_H3 => ( FETCH,  FETCH,          H, T,  NULLL,  NONE, X"00", PC, FETCH, "SLL H (int)   "),

LD_H_SLL_bIXdb => ( SLL_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, SLL(IX+d"),

SLL_L  => ( SLL_L2, LD_L_SLL_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "SLL L         "),
SLL_L2 => ( SLL_L3, FETCH,          T, T,  SLLL,   F,    X"FF", PC, NONE,  "SLL L (int)   "),
SLL_L3 => ( FETCH,  FETCH,          L, T,  NULLL,  NONE, X"00", PC, FETCH, "SLL L (int)   "),

LD_L_SLL_bIXdb => ( SLL_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, SLL(IX+d"),

SLL_bHLb  => ( SLL_bHLb2, SLL_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", PC, NONE,   "SLL (HL)      "),
SLL_bHLb2 => ( SLL_bHLb3, FETCH,     T,      EXTERN, SLLL,   F,    X"FF", HL, MEM_RD, "SLL (HL)      "),
SLL_bHLb3 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SLL (HL)(int) "),

SLL_bIXdb  => ( SLL_bIXdb2, FETCH, T,      EXTERN, SLLL,  F,    X"FF", TT, MEM_RD, "SLL (IX+d)(int"),
SLL_bIXdb2 => ( FETCH,      FETCH, EXTERN, T,      NULLL, NONE, X"00", TT, MEM_WR, "SLL (IX+d)(int"),

SRL_A  => ( SRL_A2, LD_A_SRL_bIXdb, T, A,  TST_EC, NONE, X"00", PC, NONE,  "SRL A         "),
SRL_A2 => ( SRL_A3, FETCH,          T, T,  SRLL,    F,    X"FF", PC, NONE, "SRL A (int)   "),
SRL_A3 => ( FETCH,  FETCH,          A, T,  NULLL,  NONE, X"00", PC, FETCH, "SRL A (int)   "),

LD_A_SRL_bIXdb => ( SRL_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A, SRL(IX+d"),

SRL_B  => ( SRL_B2, LD_B_SRL_bIXdb, T, B,  TST_EC, NONE, X"00", PC, NONE,  "SRL B         "),
SRL_B2 => ( SRL_B3, FETCH,          T, T,  SRLL,   F,    X"FF", PC, NONE,  "SRL B (int)   "),
SRL_B3 => ( FETCH,  FETCH,          B, T,  NULLL,  NONE, X"00", PC, FETCH, "SRL B (int)   "),

LD_B_SRL_bIXdb => ( SRL_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B, SRL(IX+d"),

SRL_C  => ( SRL_C2, LD_C_SRL_bIXdb, T, C,  TST_EC, NONE, X"00", PC, NONE,  "SRL C         "),
SRL_C2 => ( SRL_C3, FETCH,          T, T,  SRLL,   F,    X"FF", PC, NONE,  "SRL C (int)   "),
SRL_C3 => ( FETCH,  FETCH,          C, T,  NULLL,  NONE, X"00", PC, FETCH, "SRL C (int)   "),

LD_C_SRL_bIXdb => ( SRL_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C, SRL(IX+d"),

SRL_D  => ( SRL_D2, LD_D_SRL_bIXdb, T, D,  TST_EC, NONE, X"00", PC, NONE,  "SRL D         "),
SRL_D2 => ( SRL_D3, FETCH,          T, T,  SRLL,   F,    X"FF", PC, NONE,  "SRL D (int)   "),
SRL_D3 => ( FETCH,  FETCH,          D, T,  NULLL,  NONE, X"00", PC, FETCH, "SRL D (int)   "),

LD_D_SRL_bIXdb => ( SRL_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D, SRL(IX+d"),

SRL_E  => ( SRL_E2, LD_E_SRL_bIXdb, T, E,  TST_EC, NONE, X"00", PC, NONE,  "SRL E         "),
SRL_E2 => ( SRL_E3, FETCH,          T, T,  SRLL,   F,    X"FF", PC, NONE,  "SRL E (int)   "),
SRL_E3 => ( FETCH,  FETCH,          E, T,  NULLL,  NONE, X"00", PC, FETCH, "SRL E (int)   "),

LD_E_SRL_bIXdb => ( SRL_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E, SRL(IX+d"),

SRL_H  => ( SRL_H2, LD_H_SRL_bIXdb, T, H,  TST_EC, NONE, X"00", PC, NONE,  "SRL H         "),
SRL_H2 => ( SRL_H3, FETCH,          T, T,  SRLL,   F,    X"FF", PC, NONE,  "SRL H (int)   "),
SRL_H3 => ( FETCH,  FETCH,          H, T,  NULLL,  NONE, X"00", PC, FETCH, "SRL H (int)   "),

LD_H_SRL_bIXdb => ( SRL_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H, SRL(IX+d"),

SRL_L  => ( SRL_L2, LD_L_SRL_bIXdb, T, L,  TST_EC, NONE, X"00", PC, NONE,  "SRL L         "),
SRL_L2 => ( SRL_L3, FETCH,          T, T,  SRLL,   F,    X"FF", PC, NONE,  "SRL L (int)   "),
SRL_L3 => ( FETCH,  FETCH,          L, T,  NULLL,  NONE, X"00", PC, FETCH, "SRL L (int)   "),

LD_L_SRL_bIXdb => ( SRL_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L, SRL(IX+d"),

SRL_bHLb  => ( SRL_bHLb2, SRL_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", PC, NONE,   "SRL (HL)      "),
SRL_bHLb2 => ( SRL_bHLb3, FETCH,     T,      EXTERN, SRLL,   F,    X"FF", HL, MEM_RD, "SRL (HL)      "),
SRL_bHLb3 => ( FETCH,     FETCH,     EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SRL (HL)(int) "),

SRL_bIXdb  => ( SRL_bIXdb2, FETCH, T,      EXTERN, SRLL,   F,    X"FF", TT, MEM_RD, "SRL (IX+d)(int"),
SRL_bIXdb2 => ( FETCH,      FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SRL (IX+d)(int"),

RLD  => ( RLD2,  FETCH, T,      EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "RLD (int)     "),
RLD2 => ( RLD3,  FETCH, TT_H,   T,      NULLL, NONE, X"00", HL, NONE,   "RLD (int)     "),
RLD3 => ( RLD4,  FETCH, T,      A,      LBLB,  NONE, X"00", HL, NONE,   "RLD (int)     "),
RLD4 => ( RLD5,  FETCH, EXTERN, T,      NULLL, NONE, X"00", HL, MEM_WR, "RLD (int)     "),
RLD5 => ( FETCH, FETCH, A,      TT_H,   HBHB,  F,    X"FE", PC, FETCH,  "RLD (int)     "),

RRD  => ( RRD2,  FETCH, T,      A,      NULLL, NONE, X"00", HL,  NONE,  "RLD (int)     "),
RRD2 => ( RRD3,  FETCH, TT_H,   EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "RRD (int)     "),
RRD3 => ( RRD4,  FETCH, T,      TT_H,   LBHB,  NONE, X"00", HL, NONE,   "RRD (int)     "),
RRD4 => ( RRD5,  FETCH, EXTERN, T,      NULLL, NONE, X"00", HL, MEM_WR, "RRD (int)     "),
RRD5 => ( FETCH, FETCH, A,      TT_H,   HBLB,  F,    X"FE", PC, FETCH,  "RRD (int)     "),

--*********************************--
--                                    --
-- BIT SET/RESET AND TEST GROUP    --
--       INSTRUCTIONS                    --
--                                 --
--*********************************--
BIT0_A => ( BIT0, BIT0_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 0 A       "),
BIT0_B => ( BIT0, BIT0_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 0 B       "),
BIT0_C => ( BIT0, BIT0_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 0 C       "),
BIT0_D => ( BIT0, BIT0_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 0 D       "),
BIT0_E => ( BIT0, BIT0_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 0 E       "),
BIT0_H => ( BIT0, BIT0_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 0 H       "),
BIT0_L => ( BIT0, BIT0_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 0 L       "),

BIT0_bHLb  => ( BIT0_bHLb2, BIT0_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 0 (HL)    "),
BIT0_bHLb2 => ( BIT0,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 0 (HL)(int"),
BIT0_bIXdb => ( BIT0,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 0 (IX+d)(i"),

BIT0   => ( FETCH,  FETCH,   T, K_H01,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 0         "),

BIT1_A => ( BIT1, BIT1_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 1 A       "),
BIT1_B => ( BIT1, BIT1_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 1 B       "),
BIT1_C => ( BIT1, BIT1_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 1 C       "),
BIT1_D => ( BIT1, BIT1_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 1 D       "),
BIT1_E => ( BIT1, BIT1_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 1 E       "),
BIT1_H => ( BIT1, BIT1_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 1 H       "),
BIT1_L => ( BIT1, BIT1_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 1 L       "),

BIT1_bHLb  => ( BIT1_bHLb2, BIT1_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 1 (HL)    "),
BIT1_bHLb2 => ( BIT1,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 1 (HL)(int"),
BIT1_bIXdb => ( BIT1,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 1 (IX+d)(i"),

BIT1   => ( FETCH,  FETCH,   T, K_H02,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 1         "),

BIT2_A => ( BIT2, BIT2_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 2 A       "),
BIT2_B => ( BIT2, BIT2_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 2 B       "),
BIT2_C => ( BIT2, BIT2_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 2 C       "),
BIT2_D => ( BIT2, BIT2_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 2 D       "),
BIT2_E => ( BIT2, BIT2_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 2 E       "),
BIT2_H => ( BIT2, BIT2_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 2 H       "),
BIT2_L => ( BIT2, BIT2_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 2 L       "),

BIT2_bHLb  => ( BIT2_bHLb2, BIT2_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 2 (HL)    "),
BIT2_bHLb2 => ( BIT2,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 2 (HL)(int"),
BIT2_bIXdb => ( BIT2,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 2 (IX+d)(i"),

BIT2   => ( FETCH,  FETCH,   T, K_H04,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 2         "),

BIT3_A => ( BIT3, BIT3_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 3 A       "),
BIT3_B => ( BIT3, BIT3_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 3 B       "),
BIT3_C => ( BIT3, BIT3_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 3 C       "),
BIT3_D => ( BIT3, BIT3_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 3 D       "),
BIT3_E => ( BIT3, BIT3_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 3 E       "),
BIT3_H => ( BIT3, BIT3_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 3 H       "),
BIT3_L => ( BIT3, BIT3_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 3 L       "),

BIT3_bHLb  => ( BIT3_bHLb2, BIT3_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 3 (HL)    "),
BIT3_bHLb2 => ( BIT3,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 3 (HL)(int"),
BIT3_bIXdb => ( BIT3,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 3 (IX+d)(i"),

BIT3   => ( FETCH,  FETCH,   T, K_H08,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 3         "),

BIT4_A => ( BIT4, BIT4_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 4 A       "),
BIT4_B => ( BIT4, BIT4_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 4 B       "),
BIT4_C => ( BIT4, BIT4_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 4 C       "),
BIT4_D => ( BIT4, BIT4_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 4 D       "),
BIT4_E => ( BIT4, BIT4_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 4 E       "),
BIT4_H => ( BIT4, BIT4_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 4 H       "),
BIT4_L => ( BIT4, BIT4_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 4 L       "),

BIT4_bHLb  => ( BIT4_bHLb2, BIT4_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 4 (HL)    "),
BIT4_bHLb2 => ( BIT4,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 4 (HL)(int"),
BIT4_bIXdb => ( BIT4,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 4 (IX+d)(i"),

BIT4   => ( FETCH,  FETCH,   T, K_H10,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 4         "),

BIT5_A => ( BIT5, BIT5_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 5 A       "),
BIT5_B => ( BIT5, BIT5_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 5 B       "),
BIT5_C => ( BIT5, BIT5_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 5 C       "),
BIT5_D => ( BIT5, BIT5_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 5 D       "),
BIT5_E => ( BIT5, BIT5_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 5 E       "),
BIT5_H => ( BIT5, BIT5_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 5 H       "),
BIT5_L => ( BIT5, BIT5_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 5 L       "),

BIT5_bHLb  => ( BIT5_bHLb2, BIT5_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 5 (HL)    "),
BIT5_bHLb2 => ( BIT5,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 5 (HL)(int"),
BIT5_bIXdb => ( BIT5,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 5 (IX+d)(i"),

BIT5   => ( FETCH,  FETCH,   T, K_H20,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 5         "),

BIT6_A => ( BIT6, BIT6_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 6 A       "),
BIT6_B => ( BIT6, BIT6_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 6 B       "),
BIT6_C => ( BIT6, BIT6_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 6 C       "),
BIT6_D => ( BIT6, BIT6_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 6 D       "),
BIT6_E => ( BIT6, BIT6_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 6 E       "),
BIT6_H => ( BIT6, BIT6_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 6 H       "),
BIT6_L => ( BIT6, BIT6_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 6 L       "),

BIT6_bHLb  => ( BIT6_bHLb2, BIT6_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 6 (HL)    "),
BIT6_bHLb2 => ( BIT6,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 6 (HL)(int"),
BIT6_bIXdb => ( BIT6,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 6 (IX+d)(i"),

BIT6   => ( FETCH,  FETCH,   T, K_H40,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 6         "),

BIT7_A => ( BIT7, BIT7_bIXdb, T, A, TST_EC, NONE, X"00", PC, FETCH, "BIT 7 A       "),
BIT7_B => ( BIT7, BIT7_bIXdb, T, B, TST_EC, NONE, X"00", PC, FETCH, "BIT 7 B       "),
BIT7_C => ( BIT7, BIT7_bIXdb, T, C, TST_EC, NONE, X"00", PC, FETCH, "BIT 7 C       "),
BIT7_D => ( BIT7, BIT7_bIXdb, T, D, TST_EC, NONE, X"00", PC, FETCH, "BIT 7 D       "),
BIT7_E => ( BIT7, BIT7_bIXdb, T, E, TST_EC, NONE, X"00", PC, FETCH, "BIT 7 E       "),
BIT7_H => ( BIT7, BIT7_bIXdb, T, H, TST_EC, NONE, X"00", PC, FETCH, "BIT 7 H       "),
BIT7_L => ( BIT7, BIT7_bIXdb, T, L, TST_EC, NONE, X"00", PC, FETCH, "BIT 7 L       "),

BIT7_bHLb  => ( BIT7_bHLb2, BIT7_bIXdb, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "BIT 7 (HL)    "),
BIT7_bHLb2 => ( BIT7,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "BIT 7 (HL)(int"),
BIT7_bIXdb => ( BIT7,       FETCH,      T,    EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "BIT 7 (IX+d)(i"),

BIT7   => ( FETCH,  FETCH,   T, K_H80,   ANDD,   F, X"FE", PC,  FETCH,  "BIT 7         "),

RES0_A  => ( RES0_A2, LD_A_RES0_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 0 A       "),
RES0_A2 => ( RES0_A3, FETCH,           T, K_HFE, ANDD,   NONE, X"00", PC, NONE,  "RES 0 A(int)  "),
RES0_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 0 A(int)  "),

LD_A_RES0_bIXdb  => ( RES0_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES0(IX+d"),

RES0_B  => ( RES0_B2, LD_B_RES0_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 0 B       "),
RES0_B2 => ( RES0_B3, FETCH,           T, K_HFE, ANDD,  NONE, X"00", PC,  NONE, "RES 0 B(int)  "),
RES0_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 0 B(int)  "),

LD_B_RES0_bIXdb  => ( RES0_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES0(IX+d"),

RES0_C  => ( RES0_C2, LD_C_RES0_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 0 C       "),
RES0_C2 => ( RES0_C3, FETCH, T, K_HFE, ANDD,  NONE, X"00", PC,  NONE, "RES 0 C(int)  "),
RES0_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 0 D(int)  "),

LD_C_RES0_bIXdb  => ( RES0_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES0(IX+d"),

RES0_D  => ( RES0_D2, LD_D_RES0_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 0 D       "),
RES0_D2 => ( RES0_D3, FETCH, T, K_HFE, ANDD,  NONE, X"00", PC,  NONE, "RES 0 D(int)  "),
RES0_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 0 D(int)  "),

LD_D_RES0_bIXdb  => ( RES0_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES0(IX+d"),

RES0_E  => ( RES0_E2, LD_E_RES0_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 0 E       "),
RES0_E2 => ( RES0_E3, FETCH, T, K_HFE, ANDD,  NONE, X"00", PC,  NONE, "RES 0 E(int)  "),
RES0_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 0 E(int)  "),

LD_E_RES0_bIXdb  => ( RES0_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES0(IX+d"),

RES0_H  => ( RES0_H2, LD_H_RES0_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 0 H       "),
RES0_H2 => ( RES0_H3, FETCH, T, K_HFE, ANDD,  NONE, X"00", PC,  NONE, "RES 0 H(int)  "),
RES0_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 0 H(int)  "),

LD_H_RES0_bIXdb  => ( RES0_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES0(IX+d"),

RES0_L  => ( RES0_L2, LD_L_RES0_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 0 L       "),
RES0_L2 => ( RES0_L3, FETCH, T, K_HFE, ANDD,  NONE, X"00", PC,  NONE, "RES 0 L(int)  "),
RES0_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 0 L(int)  "),

LD_L_RES0_bIXdb  => ( RES0_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES0(IX+d"),

RES0_bHLb  => ( RES0_bHLb2, RES0_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 0 (HL)    "),
RES0_bHLb2 => ( RES0_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 0 (HL)    "),
RES0_bHLb3 => ( RES0_bHLb4, FETCH,      T,      K_HFE,  ANDD,   NONE, X"00", PC, NONE,   "RES 0 (HL)(INT"),
RES0_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 0 (HL)(INT"),

RES0_bIXdb  => ( RES0_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES0(IX+d"),
RES0_bIXdb2 => ( RES0_bIXdb3, FETCH, T,      K_HFE,  ANDD,   NONE, X"00", PC, NONE,   "RES 0 (HL)(INT"),
RES0_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 0 (HL)(INT"),

RES1_A  => ( RES1_A2, LD_A_RES1_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 1 A       "),
RES1_A2 => ( RES1_A3, FETCH,           T, K_HFD, ANDD,   NONE, X"00", PC, NONE,  "RES 1 A(int)  "),
RES1_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 1 A(int)  "),

LD_A_RES1_bIXdb  => ( RES1_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES1(IX+d"),

RES1_B  => ( RES1_B2, LD_B_RES1_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 1 B       "),
RES1_B2 => ( RES1_B3, FETCH,           T, K_HFD, ANDD,  NONE, X"00", PC,  NONE, "RES 1 B(int)  "),
RES1_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 1 B(int)  "),

LD_B_RES1_bIXdb  => ( RES1_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES1(IX+d"),

RES1_C  => ( RES1_C2, LD_C_RES1_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 1 C       "),
RES1_C2 => ( RES1_C3, FETCH, T, K_HFD, ANDD,  NONE, X"00", PC,  NONE, "RES 1 C(int)  "),
RES1_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 1 D(int)  "),

LD_C_RES1_bIXdb  => ( RES1_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES1(IX+d"),

RES1_D  => ( RES1_D2, LD_D_RES1_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 1 D       "),
RES1_D2 => ( RES1_D3, FETCH, T, K_HFD, ANDD,  NONE, X"00", PC,  NONE, "RES 1 D(int)  "),
RES1_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 1 D(int)  "),

LD_D_RES1_bIXdb  => ( RES1_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES1(IX+d"),

RES1_E  => ( RES1_E2, LD_E_RES1_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 1 E       "),
RES1_E2 => ( RES1_E3, FETCH, T, K_HFD, ANDD,  NONE, X"00", PC,  NONE, "RES 1 E(int)  "),
RES1_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 1 E(int)  "),

LD_E_RES1_bIXdb  => ( RES1_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES1(IX+d"),

RES1_H  => ( RES1_H2, LD_H_RES1_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 1 H       "),
RES1_H2 => ( RES1_H3, FETCH, T, K_HFD, ANDD,  NONE, X"00", PC,  NONE, "RES 1 H(int)  "),
RES1_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 1 H(int)  "),

LD_H_RES1_bIXdb  => ( RES1_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES1(IX+d"),

RES1_L  => ( RES1_L2, LD_L_RES1_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 1 L       "),
RES1_L2 => ( RES1_L3, FETCH, T, K_HFD, ANDD,  NONE, X"00", PC,  NONE, "RES 1 L(int)  "),
RES1_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 1 L(int)  "),

LD_L_RES1_bIXdb  => ( RES1_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES1(IX+d"),

RES1_bHLb  => ( RES1_bHLb2, RES1_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 1 (HL)    "),
RES1_bHLb2 => ( RES1_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 1 (HL)    "),
RES1_bHLb3 => ( RES1_bHLb4, FETCH,      T,      K_HFD,  ANDD,   NONE, X"00", PC, NONE,   "RES 1 (HL)(INT"),
RES1_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 1 (HL)(INT"),

RES1_bIXdb  => ( RES1_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES1(IX+d"),
RES1_bIXdb2 => ( RES1_bIXdb3, FETCH, T,      K_HFD,  ANDD,   NONE, X"00", PC, NONE,   "RES 1 (HL)(INT"),
RES1_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 1 (HL)(INT"),

RES2_A  => ( RES2_A2, LD_A_RES2_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 2 A       "),
RES2_A2 => ( RES2_A3, FETCH,           T, K_HFB, ANDD,   NONE, X"00", PC, NONE,  "RES 2 A(int)  "),
RES2_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 2 A(int)  "),

LD_A_RES2_bIXdb  => ( RES2_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES2(IX+d"),

RES2_B  => ( RES2_B2, LD_B_RES2_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 2 B       "),
RES2_B2 => ( RES2_B3, FETCH,           T, K_HFB, ANDD,  NONE, X"00", PC,  NONE, "RES 2 B(int)  "),
RES2_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 2 B(int)  "),

LD_B_RES2_bIXdb  => ( RES2_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES2(IX+d"),

RES2_C  => ( RES2_C2, LD_C_RES2_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 2 C       "),
RES2_C2 => ( RES2_C3, FETCH, T, K_HFB, ANDD,  NONE, X"00", PC,  NONE, "RES 2 C(int)  "),
RES2_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 2 D(int)  "),

LD_C_RES2_bIXdb  => ( RES2_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES2(IX+d"),

RES2_D  => ( RES2_D2, LD_D_RES2_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 2 D       "),
RES2_D2 => ( RES2_D3, FETCH, T, K_HFB, ANDD,  NONE, X"00", PC,  NONE, "RES 2 D(int)  "),
RES2_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 2 D(int)  "),

LD_D_RES2_bIXdb  => ( RES2_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES2(IX+d"),

RES2_E  => ( RES2_E2, LD_E_RES2_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 2 E       "),
RES2_E2 => ( RES2_E3, FETCH, T, K_HFB, ANDD,  NONE, X"00", PC,  NONE, "RES 2 E(int)  "),
RES2_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 2 E(int)  "),

LD_E_RES2_bIXdb  => ( RES2_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES2(IX+d"),

RES2_H  => ( RES2_H2, LD_H_RES2_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 2 H       "),
RES2_H2 => ( RES2_H3, FETCH, T, K_HFB, ANDD,  NONE, X"00", PC,  NONE, "RES 2 H(int)  "),
RES2_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 2 H(int)  "),

LD_H_RES2_bIXdb  => ( RES2_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES2(IX+d"),

RES2_L  => ( RES2_L2, LD_L_RES2_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 2 L       "),
RES2_L2 => ( RES2_L3, FETCH, T, K_HFB, ANDD,  NONE, X"00", PC,  NONE, "RES 2 L(int)  "),
RES2_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 2 L(int)  "),

LD_L_RES2_bIXdb  => ( RES2_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES2(IX+d"),

RES2_bHLb  => ( RES2_bHLb2, RES2_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 2 (HL)    "),
RES2_bHLb2 => ( RES2_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 2 (HL)    "),
RES2_bHLb3 => ( RES2_bHLb4, FETCH,      T,      K_HFB,  ANDD,   NONE, X"00", PC, NONE,   "RES 2 (HL)(INT"),
RES2_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 2 (HL)(INT"),

RES2_bIXdb  => ( RES2_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES2(IX+d"),
RES2_bIXdb2 => ( RES2_bIXdb3, FETCH, T,      K_HFB,  ANDD,   NONE, X"00", PC, NONE,   "RES 2 (HL)(INT"),
RES2_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 2 (HL)(INT"),

RES3_A  => ( RES3_A2, LD_A_RES3_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 3 A       "),
RES3_A2 => ( RES3_A3, FETCH,           T, K_HF7, ANDD,   NONE, X"00", PC, NONE,  "RES 3 A(int)  "),
RES3_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 3 A(int)  "),

LD_A_RES3_bIXdb  => ( RES3_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES3(IX+d"),

RES3_B  => ( RES3_B2, LD_B_RES3_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 3 B       "),
RES3_B2 => ( RES3_B3, FETCH,           T, K_HF7, ANDD,  NONE, X"00", PC,  NONE, "RES 3 B(int)  "),
RES3_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 3 B(int)  "),

LD_B_RES3_bIXdb  => ( RES3_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES3(IX+d"),

RES3_C  => ( RES3_C2, LD_C_RES3_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 3 C       "),
RES3_C2 => ( RES3_C3, FETCH, T, K_HF7, ANDD,  NONE, X"00", PC,  NONE, "RES 3 C(int)  "),
RES3_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 3 D(int)  "),

LD_C_RES3_bIXdb  => ( RES3_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES3(IX+d"),

RES3_D  => ( RES3_D2, LD_D_RES3_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 3 D       "),
RES3_D2 => ( RES3_D3, FETCH, T, K_HF7, ANDD,  NONE, X"00", PC,  NONE, "RES 3 D(int)  "),
RES3_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 3 D(int)  "),

LD_D_RES3_bIXdb  => ( RES3_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES3(IX+d"),

RES3_E  => ( RES3_E2, LD_E_RES3_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 3 E       "),
RES3_E2 => ( RES3_E3, FETCH, T, K_HF7, ANDD,  NONE, X"00", PC,  NONE, "RES 3 E(int)  "),
RES3_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 3 E(int)  "),

LD_E_RES3_bIXdb  => ( RES3_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES3(IX+d"),

RES3_H  => ( RES3_H2, LD_H_RES3_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 3 H       "),
RES3_H2 => ( RES3_H3, FETCH, T, K_HF7, ANDD,  NONE, X"00", PC,  NONE, "RES 3 H(int)  "),
RES3_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 3 H(int)  "),

LD_H_RES3_bIXdb  => ( RES3_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES3(IX+d"),

RES3_L  => ( RES3_L2, LD_L_RES3_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 3 L       "),
RES3_L2 => ( RES3_L3, FETCH, T, K_HF7, ANDD,  NONE, X"00", PC,  NONE, "RES 3 L(int)  "),
RES3_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 3 L(int)  "),

LD_L_RES3_bIXdb  => ( RES3_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES3(IX+d"),

RES3_bHLb  => ( RES3_bHLb2, RES3_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 3 (HL)    "),
RES3_bHLb2 => ( RES3_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 3 (HL)    "),
RES3_bHLb3 => ( RES3_bHLb4, FETCH,      T,      K_HF7,  ANDD,   NONE, X"00", PC, NONE,   "RES 3 (HL)(INT"),
RES3_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 3 (HL)(INT"),

RES3_bIXdb  => ( RES3_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES3(IX+d"),
RES3_bIXdb2 => ( RES3_bIXdb3, FETCH, T,      K_HF7,  ANDD,   NONE, X"00", PC, NONE,   "RES 3 (HL)(INT"),
RES3_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 3 (HL)(INT"),

RES4_A  => ( RES4_A2, LD_A_RES4_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 4 A       "),
RES4_A2 => ( RES4_A3, FETCH,           T, K_HEF, ANDD,   NONE, X"00", PC, NONE,  "RES 4 A(int)  "),
RES4_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 4 A(int)  "),

LD_A_RES4_bIXdb  => ( RES4_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES4(IX+d"),

RES4_B  => ( RES4_B2, LD_B_RES4_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 4 B       "),
RES4_B2 => ( RES4_B3, FETCH,           T, K_HEF, ANDD,  NONE, X"00", PC,  NONE, "RES 4 B(int)  "),
RES4_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 4 B(int)  "),

LD_B_RES4_bIXdb  => ( RES4_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES4(IX+d"),

RES4_C  => ( RES4_C2, LD_C_RES4_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 4 C       "),
RES4_C2 => ( RES4_C3, FETCH, T, K_HEF, ANDD,  NONE, X"00", PC,  NONE, "RES 4 C(int)  "),
RES4_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 4 D(int)  "),

LD_C_RES4_bIXdb  => ( RES4_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES4(IX+d"),

RES4_D  => ( RES4_D2, LD_D_RES4_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 4 D       "),
RES4_D2 => ( RES4_D3, FETCH, T, K_HEF, ANDD,  NONE, X"00", PC,  NONE, "RES 4 D(int)  "),
RES4_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 4 D(int)  "),

LD_D_RES4_bIXdb  => ( RES4_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES4(IX+d"),

RES4_E  => ( RES4_E2, LD_E_RES4_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 4 E       "),
RES4_E2 => ( RES4_E3, FETCH, T, K_HEF, ANDD,  NONE, X"00", PC,  NONE, "RES 4 E(int)  "),
RES4_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 4 E(int)  "),

LD_E_RES4_bIXdb  => ( RES4_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES4(IX+d"),

RES4_H  => ( RES4_H2, LD_H_RES4_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 4 H       "),
RES4_H2 => ( RES4_H3, FETCH, T, K_HEF, ANDD,  NONE, X"00", PC,  NONE, "RES 4 H(int)  "),
RES4_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 4 H(int)  "),

LD_H_RES4_bIXdb  => ( RES4_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES4(IX+d"),

RES4_L  => ( RES4_L2, LD_L_RES4_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 4 L       "),
RES4_L2 => ( RES4_L3, FETCH, T, K_HEF, ANDD,  NONE, X"00", PC,  NONE, "RES 4 L(int)  "),
RES4_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 4 L(int)  "),

LD_L_RES4_bIXdb  => ( RES4_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES4(IX+d"),

RES4_bHLb  => ( RES4_bHLb2, RES4_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 4 (HL)    "),
RES4_bHLb2 => ( RES4_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 4 (HL)    "),
RES4_bHLb3 => ( RES4_bHLb4, FETCH,      T,      K_HEF,  ANDD,   NONE, X"00", PC, NONE,   "RES 4 (HL)(INT"),
RES4_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 4 (HL)(INT"),

RES4_bIXdb  => ( RES4_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES4(IX+d"),
RES4_bIXdb2 => ( RES4_bIXdb3, FETCH, T,      K_HEF,  ANDD,   NONE, X"00", PC, NONE,   "RES 4 (HL)(INT"),
RES4_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 4 (HL)(INT"),

RES5_A  => ( RES5_A2, LD_A_RES5_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 5 A       "),
RES5_A2 => ( RES5_A3, FETCH,           T, K_HDF, ANDD,   NONE, X"00", PC, NONE,  "RES 5 A(int)  "),
RES5_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 5 A(int)  "),

LD_A_RES5_bIXdb  => ( RES5_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES5(IX+d"),

RES5_B  => ( RES5_B2, LD_B_RES5_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 5 B       "),
RES5_B2 => ( RES5_B3, FETCH,           T, K_HDF, ANDD,  NONE, X"00", PC,  NONE, "RES 5 B(int)  "),
RES5_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 5 B(int)  "),

LD_B_RES5_bIXdb  => ( RES5_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES5(IX+d"),

RES5_C  => ( RES5_C2, LD_C_RES5_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 5 C       "),
RES5_C2 => ( RES5_C3, FETCH, T, K_HDF, ANDD,  NONE, X"00", PC,  NONE, "RES 5 C(int)  "),
RES5_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 5 D(int)  "),

LD_C_RES5_bIXdb  => ( RES5_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES5(IX+d"),

RES5_D  => ( RES5_D2, LD_D_RES5_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 5 D       "),
RES5_D2 => ( RES5_D3, FETCH, T, K_HDF, ANDD,  NONE, X"00", PC,  NONE, "RES 5 D(int)  "),
RES5_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 5 D(int)  "),

LD_D_RES5_bIXdb  => ( RES5_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES5(IX+d"),

RES5_E  => ( RES5_E2, LD_E_RES5_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 5 E       "),
RES5_E2 => ( RES5_E3, FETCH, T, K_HDF, ANDD,  NONE, X"00", PC,  NONE, "RES 5 E(int)  "),
RES5_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 5 E(int)  "),

LD_E_RES5_bIXdb  => ( RES5_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES5(IX+d"),

RES5_H  => ( RES5_H2, LD_H_RES5_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 5 H       "),
RES5_H2 => ( RES5_H3, FETCH, T, K_HDF, ANDD,  NONE, X"00", PC,  NONE, "RES 5 H(int)  "),
RES5_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 5 H(int)  "),

LD_H_RES5_bIXdb  => ( RES5_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES5(IX+d"),

RES5_L  => ( RES5_L2, LD_L_RES5_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 5 L       "),
RES5_L2 => ( RES5_L3, FETCH, T, K_HDF, ANDD,  NONE, X"00", PC,  NONE, "RES 5 L(int)  "),
RES5_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 5 L(int)  "),

LD_L_RES5_bIXdb  => ( RES5_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES5(IX+d"),

RES5_bHLb  => ( RES5_bHLb2, RES5_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 5 (HL)    "),
RES5_bHLb2 => ( RES5_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 5 (HL)    "),
RES5_bHLb3 => ( RES5_bHLb4, FETCH,      T,      K_HDF,  ANDD,   NONE, X"00", PC, NONE,   "RES 5 (HL)(INT"),
RES5_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 5 (HL)(INT"),

RES5_bIXdb  => ( RES5_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES5(IX+d"),
RES5_bIXdb2 => ( RES5_bIXdb3, FETCH, T,      K_HDF,  ANDD,   NONE, X"00", PC, NONE,   "RES 5 (HL)(INT"),
RES5_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 5 (HL)(INT"),

RES6_A  => ( RES6_A2, LD_A_RES6_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 6 A       "),
RES6_A2 => ( RES6_A3, FETCH,           T, K_HBF, ANDD,   NONE, X"00", PC, NONE,  "RES 6 A(int)  "),
RES6_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 6 A(int)  "),

LD_A_RES6_bIXdb  => ( RES6_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES6(IX+d"),

RES6_B  => ( RES6_B2, LD_B_RES6_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 6 B       "),
RES6_B2 => ( RES6_B3, FETCH,           T, K_HBF, ANDD,  NONE, X"00", PC,  NONE, "RES 6 B(int)  "),
RES6_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 6 B(int)  "),

LD_B_RES6_bIXdb  => ( RES6_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES6(IX+d"),

RES6_C  => ( RES6_C2, LD_C_RES6_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 6 C       "),
RES6_C2 => ( RES6_C3, FETCH, T, K_HBF, ANDD,  NONE, X"00", PC,  NONE, "RES 6 C(int)  "),
RES6_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 6 D(int)  "),

LD_C_RES6_bIXdb  => ( RES6_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES6(IX+d"),

RES6_D  => ( RES6_D2, LD_D_RES6_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 6 D       "),
RES6_D2 => ( RES6_D3, FETCH, T, K_HBF, ANDD,  NONE, X"00", PC,  NONE, "RES 6 D(int)  "),
RES6_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 6 D(int)  "),

LD_D_RES6_bIXdb  => ( RES6_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES6(IX+d"),

RES6_E  => ( RES6_E2, LD_E_RES6_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 6 E       "),
RES6_E2 => ( RES6_E3, FETCH, T, K_HBF, ANDD,  NONE, X"00", PC,  NONE, "RES 6 E(int)  "),
RES6_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 6 E(int)  "),

LD_E_RES6_bIXdb  => ( RES6_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES6(IX+d"),

RES6_H  => ( RES6_H2, LD_H_RES6_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 6 H       "),
RES6_H2 => ( RES6_H3, FETCH, T, K_HBF, ANDD,  NONE, X"00", PC,  NONE, "RES 6 H(int)  "),
RES6_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 6 H(int)  "),

LD_H_RES6_bIXdb  => ( RES6_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES6(IX+d"),

RES6_L  => ( RES6_L2, LD_L_RES6_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 6 L       "),
RES6_L2 => ( RES6_L3, FETCH, T, K_HBF, ANDD,  NONE, X"00", PC,  NONE, "RES 6 L(int)  "),
RES6_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 6 L(int)  "),

LD_L_RES6_bIXdb  => ( RES6_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES6(IX+d"),

RES6_bHLb  => ( RES6_bHLb2, RES6_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 6 (HL)    "),
RES6_bHLb2 => ( RES6_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 6 (HL)    "),
RES6_bHLb3 => ( RES6_bHLb4, FETCH,      T,      K_HBF,  ANDD,   NONE, X"00", PC, NONE,   "RES 6 (HL)(INT"),
RES6_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 6 (HL)(INT"),

RES6_bIXdb  => ( RES6_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES6(IX+d"),
RES6_bIXdb2 => ( RES6_bIXdb3, FETCH, T,      K_HBF,  ANDD,   NONE, X"00", PC, NONE,   "RES 6 (HL)(INT"),
RES6_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 6 (HL)(INT"),

RES7_A  => ( RES7_A2, LD_A_RES7_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "RES 7 A       "),
RES7_A2 => ( RES7_A3, FETCH,           T, K_H7F, ANDD,   NONE, X"00", PC, NONE,  "RES 7 A(int)  "),
RES7_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "RES 7 A(int)  "),

LD_A_RES7_bIXdb  => ( RES7_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A RES7(IX+d"),

RES7_B  => ( RES7_B2, LD_B_RES7_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "RES 7 B       "),
RES7_B2 => ( RES7_B3, FETCH,           T, K_H7F, ANDD,  NONE, X"00", PC,  NONE, "RES 7 B(int)  "),
RES7_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 7 B(int)  "),

LD_B_RES7_bIXdb  => ( RES7_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B RES7(IX+d"),

RES7_C  => ( RES7_C2, LD_C_RES7_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "RES 7 C       "),
RES7_C2 => ( RES7_C3, FETCH, T, K_H7F, ANDD,  NONE, X"00", PC,  NONE, "RES 7 C(int)  "),
RES7_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 7 D(int)  "),

LD_C_RES7_bIXdb  => ( RES7_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C RES7(IX+d"),

RES7_D  => ( RES7_D2, LD_D_RES7_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "RES 7 D       "),
RES7_D2 => ( RES7_D3, FETCH, T, K_H7F, ANDD,  NONE, X"00", PC,  NONE, "RES 7 D(int)  "),
RES7_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 7 D(int)  "),

LD_D_RES7_bIXdb  => ( RES7_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D RES7(IX+d"),

RES7_E  => ( RES7_E2, LD_E_RES7_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "RES 7 E       "),
RES7_E2 => ( RES7_E3, FETCH, T, K_H7F, ANDD,  NONE, X"00", PC,  NONE, "RES 7 E(int)  "),
RES7_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 7 E(int)  "),

LD_E_RES7_bIXdb  => ( RES7_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E RES7(IX+d"),

RES7_H  => ( RES7_H2, LD_H_RES7_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "RES 7 H       "),
RES7_H2 => ( RES7_H3, FETCH, T, K_H7F, ANDD,  NONE, X"00", PC,  NONE, "RES 7 H(int)  "),
RES7_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 7 H(int)  "),

LD_H_RES7_bIXdb  => ( RES7_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H RES7(IX+d"),

RES7_L  => ( RES7_L2, LD_L_RES7_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "RES 7 L       "),
RES7_L2 => ( RES7_L3, FETCH, T, K_H7F, ANDD,  NONE, X"00", PC,  NONE, "RES 7 L(int)  "),
RES7_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "RES 7 L(int)  "),

LD_L_RES7_bIXdb  => ( RES7_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L RES7(IX+d"),

RES7_bHLb  => ( RES7_bHLb2, RES7_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "RES 7 (HL)    "),
RES7_bHLb2 => ( RES7_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "RES 7 (HL)    "),
RES7_bHLb3 => ( RES7_bHLb4, FETCH,      T,      K_H7F,  ANDD,   NONE, X"00", PC, NONE,   "RES 7 (HL)(INT"),
RES7_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "RES 7 (HL)(INT"),

RES7_bIXdb  => ( RES7_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B RES7(IX+d"),
RES7_bIXdb2 => ( RES7_bIXdb3, FETCH, T,      K_H7F,  ANDD,   NONE, X"00", PC, NONE,   "RES 7 (HL)(INT"),
RES7_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "RES 7 (HL)(INT"),

SET0_A  => ( SET0_A2, LD_A_SET0_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 0 A       "),
SET0_A2 => ( SET0_A3, FETCH,           T, K_H01, ORR,    NONE, X"00", PC, NONE,  "SET 0 A(int)  "),
SET0_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 0 A(int)  "),

LD_A_SET0_bIXdb  => ( SET0_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET0(IX+d"),

SET0_B  => ( SET0_B2, LD_B_SET0_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 0 B       "),
SET0_B2 => ( SET0_B3, FETCH,           T, K_H01, ORR,   NONE, X"00", PC,  NONE, "SET 0 B(int)  "),
SET0_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 0 B(int)  "),

LD_B_SET0_bIXdb  => ( SET0_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET0(IX+d"),

SET0_C  => ( SET0_C2, LD_C_SET0_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 0 C       "),
SET0_C2 => ( SET0_C3, FETCH, T, K_H01, ORR,   NONE, X"00", PC,  NONE, "SET 0 C(int)  "),
SET0_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 0 D(int)  "),

LD_C_SET0_bIXdb  => ( SET0_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET0(IX+d"),

SET0_D  => ( SET0_D2, LD_D_SET0_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 0 D       "),
SET0_D2 => ( SET0_D3, FETCH, T, K_H01, ORR,   NONE, X"00", PC,  NONE, "SET 0 D(int)  "),
SET0_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 0 D(int)  "),

LD_D_SET0_bIXdb  => ( SET0_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET0(IX+d"),

SET0_E  => ( SET0_E2, LD_E_SET0_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 0 E       "),
SET0_E2 => ( SET0_E3, FETCH, T, K_H01, ORR,   NONE, X"00", PC,  NONE, "SET 0 E(int)  "),
SET0_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 0 E(int)  "),

LD_E_SET0_bIXdb  => ( SET0_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET0(IX+d"),

SET0_H  => ( SET0_H2, LD_H_SET0_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 0 H       "),
SET0_H2 => ( SET0_H3, FETCH, T, K_H01, ORR,   NONE, X"00", PC,  NONE, "SET 0 H(int)  "),
SET0_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 0 H(int)  "),

LD_H_SET0_bIXdb  => ( SET0_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET0(IX+d"),

SET0_L  => ( SET0_L2, LD_L_SET0_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 0 L       "),
SET0_L2 => ( SET0_L3, FETCH, T, K_H01, ORR,   NONE, X"00", PC,  NONE, "SET 0 L(int)  "),
SET0_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 0 L(int)  "),

LD_L_SET0_bIXdb  => ( SET0_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET0(IX+d"),

SET0_bHLb  => ( SET0_bHLb2, SET0_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 0 (HL)    "),
SET0_bHLb2 => ( SET0_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 0 (HL)    "),
SET0_bHLb3 => ( SET0_bHLb4, FETCH,      T,      K_H01,  ORR,    NONE, X"00", PC, NONE,   "SET 0 (HL)(INT"),
SET0_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 0 (HL)(INT"),

SET0_bIXdb  => ( SET0_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET0(IX+d"),
SET0_bIXdb2 => ( SET0_bIXdb3, FETCH, T,      K_H01,  ORR,    NONE, X"00", PC, NONE,   "SET 0 (HL)(INT"),
SET0_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 0 (HL)(INT"),

SET1_A  => ( SET1_A2, LD_A_SET1_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 1 A       "),
SET1_A2 => ( SET1_A3, FETCH,           T, K_H02, ORR,    NONE, X"00", PC, NONE,  "SET 1 A(int)  "),
SET1_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 1 A(int)  "),

LD_A_SET1_bIXdb  => ( SET1_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET1(IX+d"),

SET1_B  => ( SET1_B2, LD_B_SET1_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 1 B       "),
SET1_B2 => ( SET1_B3, FETCH,           T, K_H02, ORR,   NONE, X"00", PC,  NONE, "SET 1 B(int)  "),
SET1_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 1 B(int)  "),

LD_B_SET1_bIXdb  => ( SET1_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET1(IX+d"),

SET1_C  => ( SET1_C2, LD_C_SET1_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 1 C       "),
SET1_C2 => ( SET1_C3, FETCH, T, K_H02, ORR,   NONE, X"00", PC,  NONE, "SET 1 C(int)  "),
SET1_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 1 D(int)  "),

LD_C_SET1_bIXdb  => ( SET1_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET1(IX+d"),

SET1_D  => ( SET1_D2, LD_D_SET1_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 1 D       "),
SET1_D2 => ( SET1_D3, FETCH, T, K_H02, ORR,   NONE, X"00", PC,  NONE, "SET 1 D(int)  "),
SET1_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 1 D(int)  "),

LD_D_SET1_bIXdb  => ( SET1_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET1(IX+d"),

SET1_E  => ( SET1_E2, LD_E_SET1_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 1 E       "),
SET1_E2 => ( SET1_E3, FETCH, T, K_H02, ORR,   NONE, X"00", PC,  NONE, "SET 1 E(int)  "),
SET1_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 1 E(int)  "),

LD_E_SET1_bIXdb  => ( SET1_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET1(IX+d"),

SET1_H  => ( SET1_H2, LD_H_SET1_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 1 H       "),
SET1_H2 => ( SET1_H3, FETCH, T, K_H02, ORR,   NONE, X"00", PC,  NONE, "SET 1 H(int)  "),
SET1_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 1 H(int)  "),

LD_H_SET1_bIXdb  => ( SET1_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET1(IX+d"),

SET1_L  => ( SET1_L2, LD_L_SET1_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 1 L       "),
SET1_L2 => ( SET1_L3, FETCH, T, K_H02, ORR,   NONE, X"00", PC,  NONE, "SET 1 L(int)  "),
SET1_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 1 L(int)  "),

LD_L_SET1_bIXdb  => ( SET1_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET1(IX+d"),

SET1_bHLb  => ( SET1_bHLb2, SET1_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 1 (HL)    "),
SET1_bHLb2 => ( SET1_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 1 (HL)    "),
SET1_bHLb3 => ( SET1_bHLb4, FETCH,      T,      K_H02,  ORR,    NONE, X"00", PC, NONE,   "SET 1 (HL)(INT"),
SET1_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 1 (HL)(INT"),

SET1_bIXdb  => ( SET1_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET1(IX+d"),
SET1_bIXdb2 => ( SET1_bIXdb3, FETCH, T,      K_H02,  ORR,    NONE, X"00", PC, NONE,   "SET 1 (HL)(INT"),
SET1_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 1 (HL)(INT"),

SET2_A  => ( SET2_A2, LD_A_SET2_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 2 A       "),
SET2_A2 => ( SET2_A3, FETCH,           T, K_H04, ORR,    NONE, X"00", PC, NONE,  "SET 2 A(int)  "),
SET2_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 2 A(int)  "),

LD_A_SET2_bIXdb  => ( SET2_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET2(IX+d"),

SET2_B  => ( SET2_B2, LD_B_SET2_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 2 B       "),
SET2_B2 => ( SET2_B3, FETCH,           T, K_H04, ORR,   NONE, X"00", PC,  NONE, "SET 2 B(int)  "),
SET2_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 2 B(int)  "),

LD_B_SET2_bIXdb  => ( SET2_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET2(IX+d"),

SET2_C  => ( SET2_C2, LD_C_SET2_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 2 C       "),
SET2_C2 => ( SET2_C3, FETCH, T, K_H04, ORR,   NONE, X"00", PC,  NONE, "SET 2 C(int)  "),
SET2_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 2 D(int)  "),

LD_C_SET2_bIXdb  => ( SET2_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET2(IX+d"),

SET2_D  => ( SET2_D2, LD_D_SET2_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 2 D       "),
SET2_D2 => ( SET2_D3, FETCH, T, K_H04, ORR,   NONE, X"00", PC,  NONE, "SET 2 D(int)  "),
SET2_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 2 D(int)  "),

LD_D_SET2_bIXdb  => ( SET2_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET2(IX+d"),

SET2_E  => ( SET2_E2, LD_E_SET2_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 2 E       "),
SET2_E2 => ( SET2_E3, FETCH, T, K_H04, ORR,   NONE, X"00", PC,  NONE, "SET 2 E(int)  "),
SET2_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 2 E(int)  "),

LD_E_SET2_bIXdb  => ( SET2_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET2(IX+d"),

SET2_H  => ( SET2_H2, LD_H_SET2_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 2 H       "),
SET2_H2 => ( SET2_H3, FETCH, T, K_H04, ORR,   NONE, X"00", PC,  NONE, "SET 2 H(int)  "),
SET2_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 2 H(int)  "),

LD_H_SET2_bIXdb  => ( SET2_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET2(IX+d"),

SET2_L  => ( SET2_L2, LD_L_SET2_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 2 L       "),
SET2_L2 => ( SET2_L3, FETCH, T, K_H04, ORR,   NONE, X"00", PC,  NONE, "SET 2 L(int)  "),
SET2_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 2 L(int)  "),

LD_L_SET2_bIXdb  => ( SET2_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET2(IX+d"),

SET2_bHLb  => ( SET2_bHLb2, SET2_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 2 (HL)    "),
SET2_bHLb2 => ( SET2_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 2 (HL)    "),
SET2_bHLb3 => ( SET2_bHLb4, FETCH,      T,      K_H04,  ORR,    NONE, X"00", PC, NONE,   "SET 2 (HL)(INT"),
SET2_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 2 (HL)(INT"),

SET2_bIXdb  => ( SET2_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET2(IX+d"),
SET2_bIXdb2 => ( SET2_bIXdb3, FETCH, T,      K_H04,  ORR,    NONE, X"00", PC, NONE,   "SET 2 (HL)(INT"),
SET2_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 2 (HL)(INT"),

SET3_A  => ( SET3_A2, LD_A_SET3_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 3 A       "),
SET3_A2 => ( SET3_A3, FETCH,           T, K_H08, ORR,    NONE, X"00", PC, NONE,  "SET 3 A(int)  "),
SET3_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 3 A(int)  "),

LD_A_SET3_bIXdb  => ( SET3_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET3(IX+d"),

SET3_B  => ( SET3_B2, LD_B_SET3_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 3 B       "),
SET3_B2 => ( SET3_B3, FETCH,           T, K_H08, ORR,   NONE, X"00", PC,  NONE, "SET 3 B(int)  "),
SET3_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 3 B(int)  "),

LD_B_SET3_bIXdb  => ( SET3_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET3(IX+d"),

SET3_C  => ( SET3_C2, LD_C_SET3_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 3 C       "),
SET3_C2 => ( SET3_C3, FETCH, T, K_H08, ORR,   NONE, X"00", PC,  NONE, "SET 3 C(int)  "),
SET3_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 3 D(int)  "),

LD_C_SET3_bIXdb  => ( SET3_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET3(IX+d"),

SET3_D  => ( SET3_D2, LD_D_SET3_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 3 D       "),
SET3_D2 => ( SET3_D3, FETCH, T, K_H08, ORR,   NONE, X"00", PC,  NONE, "SET 3 D(int)  "),
SET3_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 3 D(int)  "),

LD_D_SET3_bIXdb  => ( SET3_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET3(IX+d"),

SET3_E  => ( SET3_E2, LD_E_SET3_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 3 E       "),
SET3_E2 => ( SET3_E3, FETCH, T, K_H08, ORR,   NONE, X"00", PC,  NONE, "SET 3 E(int)  "),
SET3_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 3 E(int)  "),

LD_E_SET3_bIXdb  => ( SET3_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET3(IX+d"),

SET3_H  => ( SET3_H2, LD_H_SET3_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 3 H       "),
SET3_H2 => ( SET3_H3, FETCH, T, K_H08, ORR,   NONE, X"00", PC,  NONE, "SET 3 H(int)  "),
SET3_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 3 H(int)  "),

LD_H_SET3_bIXdb  => ( SET3_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET3(IX+d"),

SET3_L  => ( SET3_L2, LD_L_SET3_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 3 L       "),
SET3_L2 => ( SET3_L3, FETCH, T, K_H08, ORR,   NONE, X"00", PC,  NONE, "SET 3 L(int)  "),
SET3_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 3 L(int)  "),

LD_L_SET3_bIXdb  => ( SET3_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET3(IX+d"),

SET3_bHLb  => ( SET3_bHLb2, SET3_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 3 (HL)    "),
SET3_bHLb2 => ( SET3_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 3 (HL)    "),
SET3_bHLb3 => ( SET3_bHLb4, FETCH,      T,      K_H08,  ORR,    NONE, X"00", PC, NONE,   "SET 3 (HL)(INT"),
SET3_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 3 (HL)(INT"),

SET3_bIXdb  => ( SET3_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET3(IX+d"),
SET3_bIXdb2 => ( SET3_bIXdb3, FETCH, T,      K_H08,  ORR,    NONE, X"00", PC, NONE,   "SET 3 (HL)(INT"),
SET3_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 3 (HL)(INT"),

SET4_A  => ( SET4_A2, LD_A_SET4_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 4 A       "),
SET4_A2 => ( SET4_A3, FETCH,           T, K_H10, ORR,    NONE, X"00", PC, NONE,  "SET 4 A(int)  "),
SET4_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 4 A(int)  "),

LD_A_SET4_bIXdb  => ( SET4_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET4(IX+d"),

SET4_B  => ( SET4_B2, LD_B_SET4_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 4 B       "),
SET4_B2 => ( SET4_B3, FETCH,           T, K_H10, ORR,   NONE, X"00", PC,  NONE, "SET 4 B(int)  "),
SET4_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 4 B(int)  "),

LD_B_SET4_bIXdb  => ( SET4_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET4(IX+d"),

SET4_C  => ( SET4_C2, LD_C_SET4_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 4 C       "),
SET4_C2 => ( SET4_C3, FETCH, T, K_H10, ORR,   NONE, X"00", PC,  NONE, "SET 4 C(int)  "),
SET4_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 4 D(int)  "),

LD_C_SET4_bIXdb  => ( SET4_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET4(IX+d"),

SET4_D  => ( SET4_D2, LD_D_SET4_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 4 D       "),
SET4_D2 => ( SET4_D3, FETCH, T, K_H10, ORR,   NONE, X"00", PC,  NONE, "SET 4 D(int)  "),
SET4_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 4 D(int)  "),

LD_D_SET4_bIXdb  => ( SET4_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET4(IX+d"),

SET4_E  => ( SET4_E2, LD_E_SET4_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 4 E       "),
SET4_E2 => ( SET4_E3, FETCH, T, K_H10, ORR,   NONE, X"00", PC,  NONE, "SET 4 E(int)  "),
SET4_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 4 E(int)  "),

LD_E_SET4_bIXdb  => ( SET4_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET4(IX+d"),

SET4_H  => ( SET4_H2, LD_H_SET4_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 4 H       "),
SET4_H2 => ( SET4_H3, FETCH, T, K_H10, ORR,   NONE, X"00", PC,  NONE, "SET 4 H(int)  "),
SET4_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 4 H(int)  "),

LD_H_SET4_bIXdb  => ( SET4_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET4(IX+d"),

SET4_L  => ( SET4_L2, LD_L_SET4_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 4 L       "),
SET4_L2 => ( SET4_L3, FETCH, T, K_H10, ORR,   NONE, X"00", PC,  NONE, "SET 4 L(int)  "),
SET4_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 4 L(int)  "),

LD_L_SET4_bIXdb  => ( SET4_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET4(IX+d"),

SET4_bHLb  => ( SET4_bHLb2, SET4_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 4 (HL)    "),
SET4_bHLb2 => ( SET4_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 4 (HL)    "),
SET4_bHLb3 => ( SET4_bHLb4, FETCH,      T,      K_H10,  ORR,    NONE, X"00", PC, NONE,   "SET 4 (HL)(INT"),
SET4_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 4 (HL)(INT"),

SET4_bIXdb  => ( SET4_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET4(IX+d"),
SET4_bIXdb2 => ( SET4_bIXdb3, FETCH, T,      K_H10,  ORR,    NONE, X"00", PC, NONE,   "SET 4 (HL)(INT"),
SET4_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 4 (HL)(INT"),

SET5_A  => ( SET5_A2, LD_A_SET5_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 5 A       "),
SET5_A2 => ( SET5_A3, FETCH,           T, K_H20, ORR,    NONE, X"00", PC, NONE,  "SET 5 A(int)  "),
SET5_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 5 A(int)  "),

LD_A_SET5_bIXdb  => ( SET5_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET5(IX+d"),

SET5_B  => ( SET5_B2, LD_B_SET5_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 5 B       "),
SET5_B2 => ( SET5_B3, FETCH,           T, K_H20, ORR,   NONE, X"00", PC,  NONE, "SET 5 B(int)  "),
SET5_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 5 B(int)  "),

LD_B_SET5_bIXdb  => ( SET5_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET5(IX+d"),

SET5_C  => ( SET5_C2, LD_C_SET5_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 5 C       "),
SET5_C2 => ( SET5_C3, FETCH, T, K_H20, ORR,   NONE, X"00", PC,  NONE, "SET 5 C(int)  "),
SET5_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 5 D(int)  "),

LD_C_SET5_bIXdb  => ( SET5_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET5(IX+d"),

SET5_D  => ( SET5_D2, LD_D_SET5_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 5 D       "),
SET5_D2 => ( SET5_D3, FETCH, T, K_H20, ORR,   NONE, X"00", PC,  NONE, "SET 5 D(int)  "),
SET5_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 5 D(int)  "),

LD_D_SET5_bIXdb  => ( SET5_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET5(IX+d"),

SET5_E  => ( SET5_E2, LD_E_SET5_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 5 E       "),
SET5_E2 => ( SET5_E3, FETCH, T, K_H20, ORR,   NONE, X"00", PC,  NONE, "SET 5 E(int)  "),
SET5_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 5 E(int)  "),

LD_E_SET5_bIXdb  => ( SET5_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET5(IX+d"),

SET5_H  => ( SET5_H2, LD_H_SET5_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 5 H       "),
SET5_H2 => ( SET5_H3, FETCH, T, K_H20, ORR,   NONE, X"00", PC,  NONE, "SET 5 H(int)  "),
SET5_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 5 H(int)  "),

LD_H_SET5_bIXdb  => ( SET5_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET5(IX+d"),

SET5_L  => ( SET5_L2, LD_L_SET5_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 5 L       "),
SET5_L2 => ( SET5_L3, FETCH, T, K_H20, ORR,   NONE, X"00", PC,  NONE, "SET 5 L(int)  "),
SET5_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 5 L(int)  "),

LD_L_SET5_bIXdb  => ( SET5_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET5(IX+d"),

SET5_bHLb  => ( SET5_bHLb2, SET5_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 5 (HL)    "),
SET5_bHLb2 => ( SET5_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 5 (HL)    "),
SET5_bHLb3 => ( SET5_bHLb4, FETCH,      T,      K_H20,  ORR,    NONE, X"00", PC, NONE,   "SET 5 (HL)(INT"),
SET5_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 5 (HL)(INT"),

SET5_bIXdb  => ( SET5_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET5(IX+d"),
SET5_bIXdb2 => ( SET5_bIXdb3, FETCH, T,      K_H20,  ORR,    NONE, X"00", PC, NONE,   "SET 5 (HL)(INT"),
SET5_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 5 (HL)(INT"),

SET6_A  => ( SET6_A2, LD_A_SET6_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 6 A       "),
SET6_A2 => ( SET6_A3, FETCH,           T, K_H40, ORR,    NONE, X"00", PC, NONE,  "SET 6 A(int)  "),
SET6_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 6 A(int)  "),

LD_A_SET6_bIXdb  => ( SET6_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET6(IX+d"),

SET6_B  => ( SET6_B2, LD_B_SET6_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 6 B       "),
SET6_B2 => ( SET6_B3, FETCH,           T, K_H40, ORR,   NONE, X"00", PC,  NONE, "SET 6 B(int)  "),
SET6_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 6 B(int)  "),

LD_B_SET6_bIXdb  => ( SET6_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET6(IX+d"),

SET6_C  => ( SET6_C2, LD_C_SET6_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 6 C       "),
SET6_C2 => ( SET6_C3, FETCH, T, K_H40, ORR,   NONE, X"00", PC,  NONE, "SET 6 C(int)  "),
SET6_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 6 D(int)  "),

LD_C_SET6_bIXdb  => ( SET6_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET6(IX+d"),

SET6_D  => ( SET6_D2, LD_D_SET6_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 6 D       "),
SET6_D2 => ( SET6_D3, FETCH, T, K_H40, ORR,   NONE, X"00", PC,  NONE, "SET 6 D(int)  "),
SET6_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 6 D(int)  "),

LD_D_SET6_bIXdb  => ( SET6_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET6(IX+d"),

SET6_E  => ( SET6_E2, LD_E_SET6_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 6 E       "),
SET6_E2 => ( SET6_E3, FETCH, T, K_H40, ORR,   NONE, X"00", PC,  NONE, "SET 6 E(int)  "),
SET6_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 6 E(int)  "),

LD_E_SET6_bIXdb  => ( SET6_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET6(IX+d"),

SET6_H  => ( SET6_H2, LD_H_SET6_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 6 H       "),
SET6_H2 => ( SET6_H3, FETCH, T, K_H40, ORR,   NONE, X"00", PC,  NONE, "SET 6 H(int)  "),
SET6_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 6 H(int)  "),

LD_H_SET6_bIXdb  => ( SET6_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET6(IX+d"),

SET6_L  => ( SET6_L2, LD_L_SET6_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 6 L       "),
SET6_L2 => ( SET6_L3, FETCH, T, K_H40, ORR,   NONE, X"00", PC,  NONE, "SET 6 L(int)  "),
SET6_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 6 L(int)  "),

LD_L_SET6_bIXdb  => ( SET6_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET6(IX+d"),

SET6_bHLb  => ( SET6_bHLb2, SET6_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 6 (HL)    "),
SET6_bHLb2 => ( SET6_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 6 (HL)    "),
SET6_bHLb3 => ( SET6_bHLb4, FETCH,      T,      K_H40,  ORR,    NONE, X"00", PC, NONE,   "SET 6 (HL)(INT"),
SET6_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 6 (HL)(INT"),

SET6_bIXdb  => ( SET6_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET6(IX+d"),
SET6_bIXdb2 => ( SET6_bIXdb3, FETCH, T,      K_H40,  ORR,    NONE, X"00", PC, NONE,   "SET 6 (HL)(INT"),
SET6_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 6 (HL)(INT"),

SET7_A  => ( SET7_A2, LD_A_SET7_bIXdb, T, A,     TST_EC, NONE, X"00", PC, NONE,  "SET 7 A       "),
SET7_A2 => ( SET7_A3, FETCH,           T, K_H80, ORR,    NONE, X"00", PC, NONE,  "SET 7 A(int)  "),
SET7_A3 => ( FETCH,   FETCH,           A, T,     NULLL,  NONE, X"00", PC, FETCH, "SET 7 A(int)  "),

LD_A_SET7_bIXdb  => ( SET7_A2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD A SET7(IX+d"),

SET7_B  => ( SET7_B2, LD_B_SET7_bIXdb, T, B,     TST_EC, NONE, X"00", PC,  NONE, "SET 7 B       "),
SET7_B2 => ( SET7_B3, FETCH,           T, K_H80, ORR,   NONE, X"00", PC,  NONE, "SET 7 B(int)  "),
SET7_B3 => ( FETCH,   FETCH,           B, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 7 B(int)  "),

LD_B_SET7_bIXdb  => ( SET7_B2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD B SET7(IX+d"),

SET7_C  => ( SET7_C2, LD_C_SET7_bIXdb, T, C,     TST_EC, NONE, X"00", PC,  NONE, "SET 7 C       "),
SET7_C2 => ( SET7_C3, FETCH, T, K_H80, ORR,   NONE, X"00", PC,  NONE, "SET 7 C(int)  "),
SET7_C3 => ( FETCH,   FETCH, C, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 7 D(int)  "),

LD_C_SET7_bIXdb  => ( SET7_C2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD C SET7(IX+d"),

SET7_D  => ( SET7_D2, LD_D_SET7_bIXdb, T, D,     TST_EC, NONE, X"00", PC,  NONE, "SET 7 D       "),
SET7_D2 => ( SET7_D3, FETCH, T, K_H80, ORR,   NONE, X"00", PC,  NONE, "SET 7 D(int)  "),
SET7_D3 => ( FETCH,   FETCH, D, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 7 D(int)  "),

LD_D_SET7_bIXdb  => ( SET7_D2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD D SET7(IX+d"),

SET7_E  => ( SET7_E2, LD_E_SET7_bIXdb, T, E,     TST_EC, NONE, X"00", PC,  NONE, "SET 7 E       "),
SET7_E2 => ( SET7_E3, FETCH, T, K_H80, ORR,   NONE, X"00", PC,  NONE, "SET 7 E(int)  "),
SET7_E3 => ( FETCH,   FETCH, E, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 7 E(int)  "),

LD_E_SET7_bIXdb  => ( SET7_E2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD E SET7(IX+d"),

SET7_H  => ( SET7_H2, LD_H_SET7_bIXdb, T, H,     TST_EC, NONE, X"00", PC,  NONE, "SET 7 H       "),
SET7_H2 => ( SET7_H3, FETCH, T, K_H80, ORR,   NONE, X"00", PC,  NONE, "SET 7 H(int)  "),
SET7_H3 => ( FETCH,   FETCH, H, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 7 H(int)  "),

LD_H_SET7_bIXdb  => ( SET7_H2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD H SET7(IX+d"),

SET7_L  => ( SET7_L2, LD_L_SET7_bIXdb, T, L,     TST_EC, NONE, X"00", PC,  NONE, "SET 7 L       "),
SET7_L2 => ( SET7_L3, FETCH, T, K_H80, ORR,   NONE, X"00", PC,  NONE, "SET 7 L(int)  "),
SET7_L3 => ( FETCH,   FETCH, L, T,     NULLL, NONE, X"00", PC,  FETCH, "SET 7 L(int)  "),

LD_L_SET7_bIXdb  => ( SET7_L2, FETCH, T, EXTERN, NULLL, NONE, X"00", TT, MEM_RD, "LD L SET7(IX+d"),

SET7_bHLb  => ( SET7_bHLb2, SET7_bIXdb, NONE,   NONE,   TST_EC, NONE, X"00", HL, MEM_RD, "SET 7 (HL)    "),
SET7_bHLb2 => ( SET7_bHLb3, FETCH,      T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "SET 7 (HL)    "),
SET7_bHLb3 => ( SET7_bHLb4, FETCH,      T,      K_H80,  ORR,    NONE, X"00", PC, NONE,   "SET 7 (HL)(INT"),
SET7_bHLb4 => ( FETCH,      FETCH,      EXTERN, T,      NULLL,  NONE, X"00", HL, MEM_WR, "SET 7 (HL)(INT"),

SET7_bIXdb  => ( SET7_bIXdb2, FETCH, T,      EXTERN, NULLL,  NONE, X"00", TT, MEM_RD, "LD B SET7(IX+d"),
SET7_bIXdb2 => ( SET7_bIXdb3, FETCH, T,      K_H80,  ORR,    NONE, X"00", PC, NONE,   "SET 7 (HL)(INT"),
SET7_bIXdb3 => ( FETCH,       FETCH, EXTERN, T,      NULLL,  NONE, X"00", TT, MEM_WR, "SET 7 (HL)(INT"),

--*********************************--
--                                 --
--         JUMP INSTRUCTIONS           --
--                                 --
--*********************************--

JP_C     => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_C,  F, X"00", PC,  MEM_RD, "JP C          "),
JP_NC    => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_NC, F, X"00", PC,  MEM_RD, "JP NC         "),
JP_Z     => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_Z,  F, X"00", PC,  MEM_RD, "JP Z          "),
JP_NZ    => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_NZ, F, X"00", PC,  MEM_RD, "JP NZ         "),
JP_PO    => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_PO, F, X"00", PC,  MEM_RD, "JP PO         "),
JP_PE    => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_PE, F, X"00", PC,  MEM_RD, "JP PE         "),
JP_P     => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_P,  F, X"00", PC,  MEM_RD, "JP P          "),
JP_M     => ( JP_nn,    JP_FAIL, NONE,   NONE,   TST_M,  F, X"00", PC,  MEM_RD, "JP M          "),
JP_FAIL  => ( JP_FAIL2, FETCH,   NONE,   EXTERN, INCPC,  NONE, X"00", PC,  MEM_RD, "JP cc (int)f  "),
JP_FAIL2 => ( FETCH,    FETCH,   NONE,   EXTERN, INCPC,  NONE, X"00", PC,  MEM_RD, "JP cc (int)f  "),

JP_nn  => ( JP_nn2, FETCH, PC_L, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "JP nn         "),
JP_nn2 => ( FETCH,  FETCH, PC_H, EXTERN, NULLL, NONE, X"00", PC,  MEM_RD, "JP nn (int)   "),

JP_HL  => ( JP_HL2, FETCH, PC_L, L, NULLL, NONE, X"00", PC,  NONE, "JP HL         "),
JP_HL2 => ( FETCH,  FETCH, PC_H, H, NULLL, NONE, X"00", PC,  NONE, "JP HL (int)   "),

JR_C  => ( JR_e, JR_FAIL, NONE, NONE, TST_C,  F, X"00", PC,  MEM_RD, "JR C          "),
JR_NC => ( JR_e, JR_FAIL, NONE, NONE, TST_NC, F, X"00", PC,  MEM_RD, "JR NC         "),
JR_Z  => ( JR_e, JR_FAIL, NONE, NONE, TST_Z,  F, X"00", PC,  MEM_RD, "JR Z          "),
JR_NZ => ( JR_e, JR_FAIL, NONE, NONE, TST_NZ, F, X"00", PC,  MEM_RD, "JR NZ         "),

DJNZ  => ( DJNZ2, FETCH,   T, B,     NULLL,  NONE, X"00", PC, NONE,   "DJNZ          "),
DJNZ2 => ( DJNZ3, FETCH,   T, K_H01, SUB,    G,    X"40", PC, MEM_RD, "DJNZ(int)     "),
DJNZ3 => ( JR_e,  JR_FAIL, B, T,     TST_NZ, G,    X"00", PC, MEM_RD, "DJNZ(int)     "),

JR_e   => ( JR2,    FETCH,  T,    EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "JR(int)       "),           
JR2    => ( JR3,    FETCH,  T,    K_H00,  ADD,   G,    X"80", PC, NONE,   "JR(int)       "),           
JR3    => ( JR4,    FETCH,  T,    PC_L,   ADD,   G,    X"01", PC, NONE,   "JR(int)       "),
JR4    => ( JR5,    FETCH,  PC_L, T,      NULLL, NONE, X"00", PC, NONE,   "JR(int)       "),
JR5    => ( JR_NEG, JR_POS, T,    PC_H,   TST_M, NONE, X"00", PC, NONE,   "JR(int)       "),
JR_NEG => ( JR_END, FETCH,  T,    K_HFF,  ADDC,  NONE, X"00", PC, NONE,   "JR(neg)       "),
JR_POS => ( JR_END, FETCH,  T,    K_H00,  ADDC,  NONE, X"00", PC, NONE,   "JR(pos)       "),

JR_END => ( FETCH,  FETCH,  PC_H, T,      NULLL, NONE, X"00", PC,  NONE,  "JR(end)       "),

JR_FAIL => ( FETCH, FETCH,  NONE, EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "JR(fail)      "),

   --*********************************--
   --                                 --
   --      CALL AND RETURN GROUP        --
   --                                 --
   --*********************************--
CALL  => ( CALL2, FETCH, TT_L,   EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "CALL          "),
CALL2 => ( CALL3, FETCH, TT_H,   EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "CALL(int)     "),
CALL3 => ( CALL4, FETCH, T,      PC_L,   DECSP, NONE, X"00", PC, NONE,   "CALL(int)     "),
CALL4 => ( CALL5, FETCH, EXTERN, PC_H,   DECSP, NONE, X"00", SP, MEM_WR, "CALL(int)     "),
CALL5 => ( CALL6, FETCH, PC_L,   TT_L,   NULLL, NONE, X"00", SP, NONE,   "CALL(int)     "),
CALL6 => ( CALL7, FETCH, EXTERN, T,      NULLL, NONE, X"00", SP, MEM_WR, "CALL(int)     "),
CALL7 => ( FETCH, FETCH, PC_H,   TT_H,   NULLL, NONE, X"00", SP, NONE,   "CALL(int)     "),

CALL_NZ => ( CALL, JP_FAIL, NONE, NONE, TST_NZ,  F, X"00", PC,  MEM_RD,   "CALL NZ       "),
CALL_Z  => ( CALL, JP_FAIL, NONE, NONE, TST_Z,   F, X"00", PC,  MEM_RD,   "CALL Z        "),
CALL_NC => ( CALL, JP_FAIL, NONE, NONE, TST_NC,  F, X"00", PC,  MEM_RD,   "CALL NC       "),
CALL_C  => ( CALL, JP_FAIL, NONE, NONE, TST_C,   F, X"00", PC,  MEM_RD,   "CALL C        "),
CALL_PO => ( CALL, JP_FAIL, NONE, NONE, TST_PO,  F, X"00", PC,  MEM_RD,   "CALL PO       "),
CALL_PE => ( CALL, JP_FAIL, NONE, NONE, TST_PE,  F, X"00", PC,  MEM_RD,   "CALL PE       "),
CALL_P  => ( CALL, JP_FAIL, NONE, NONE, TST_P,   F, X"00", PC,  MEM_RD,   "CALL P        "),
CALL_M  => ( CALL, JP_FAIL, NONE, NONE, TST_M,   F, X"00", PC,  MEM_RD,   "CALL M        "),

RET    => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RET           "),

RETI   => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETI          "),
RETI_2 => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETI          "),
RETI_3 => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETI          "),
RETI_4 => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETI          "),

RETN   => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETN          "),
RETN_2 => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETN          "),
RETN_3 => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETN          "),
RETN_4 => ( RET2,   FETCH,   PC_L,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RETN          "),

RET2   => ( FETCH,  FETCH,   PC_H,   EXTERN,   INCSP,   NONE, X"00", SP,  MEM_RD,   "RET(int)      "),

RET_NZ => ( RET, FETCH, NONE, NONE, TST_NZ,  F, X"00", SP,  NONE, "RET NZ        "),
RET_Z  => ( RET, FETCH, NONE, NONE, TST_Z,   F, X"00", SP,  NONE, "RET Z         "),
RET_NC => ( RET, FETCH, NONE, NONE, TST_NC,  F, X"00", SP,  NONE, "RET NC        "),
RET_C  => ( RET, FETCH, NONE, NONE, TST_C,   F, X"00", SP,  NONE, "RET C         "),
RET_PO => ( RET, FETCH, NONE, NONE, TST_PO,  F, X"00", SP,  NONE, "RET PO        "),
RET_PE => ( RET, FETCH, NONE, NONE, TST_PE,  F, X"00", SP,  NONE, "RET PE        "),
RET_P  => ( RET, FETCH, NONE, NONE, TST_P,   F, X"00", SP,  NONE, "RET P         "),
RET_M  => ( RET, FETCH, NONE, NONE, TST_M,   F, X"00", SP,  NONE, "RET M         "),

RST_0 => ( RST2, FETCH, T, K_H00, NULLL, NONE, X"00", SP,  NONE, "RST 0         "),
RST_1 => ( RST2, FETCH, T, K_H08, NULLL, NONE, X"00", SP,  NONE, "RST 1         "),
RST_2 => ( RST2, FETCH, T, K_H10, NULLL, NONE, X"00", SP,  NONE, "RST 2         "),
RST_3 => ( RST2, FETCH, T, K_H18, NULLL, NONE, X"00", SP,  NONE, "RST 3         "),   
RST_4 => ( RST2, FETCH, T, K_H20, NULLL, NONE, X"00", SP,  NONE, "RST 4         "),
RST_5 => ( RST2, FETCH, T, K_H28, NULLL, NONE, X"00", SP,  NONE, "RST 5         "),
RST_6 => ( RST2, FETCH, T, K_H30, NULLL, NONE, X"00", SP,  NONE, "RST 6         "),
RST_7 => ( RST2, FETCH, T, K_H38, NULLL, NONE, X"00", SP,  NONE, "RST 7         "),

RST2 => ( RST3,  FETCH, TT_L,   T,     DECSP,   NONE, X"00", SP,  NONE,   "RST (int)     "),
RST3 => ( RST4,  FETCH, EXTERN, PC_H,  DECSP,   NONE, X"00", SP,  MEM_WR, "RST (int)     "),
RST4 => ( RST5,  FETCH, T,      K_H00, NULLL,   NONE, X"00", SP,  NONE,   "RST (int)     "),
RST5 => ( RST6,  FETCH, EXTERN, PC_L,  NULLL,   NONE, X"00", SP,  MEM_WR, "RST (int)     "),
RST6 => ( RST7,  FETCH, PC_L,   TT_L,  NULLL,   NONE, X"00", PC,  FETCH,  "RST (int)     "),
RST7 => ( FETCH, FETCH, PC_H,   T,     NULLL,   NONE, X"00", PC,  FETCH,  "RST (int)     "),

   --*********************************--
   --                                 --
   --      INPUT AND OUTPUT GROUP     --
   --                                 --
   --*********************************--

IN_n =>  ( IN_n2, FETCH, TT_L, EXTERN, INCPC, NONE, X"00", PC,  MEM_RD, "IN            "),
IN_n2 => ( IN_n3, FETCH, TT_H, A,      NULLL, NONE, X"00", PC,  NONE,   "IN(int)       "),
IN_n3 => ( FETCH, FETCH, A,    EXTERN, NULLL, NONE, X"00", TT,  IO_RD,  "IN(int)       "),

IN_A_bCb  => ( IN_A_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN A,(C)      "),
IN_A_bCb2 => ( IN_A_bCb3, FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN A,(C)(int) "),
IN_A_bCb3 => ( FETCH,     FETCH, A, T,      NULLL, NONE, X"00", PC, FETCH, "IN A,(C)(int) "),

IN_B_bCb  => ( IN_B_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN B,(C)      "),
IN_B_bCb2 => ( IN_B_bCb3, FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN B,(C)(int) "),
IN_B_bCb3 => ( FETCH,     FETCH, B, T,      NULLL, NONE, X"00", PC, FETCH, "IN B,(C)(int) "),

IN_C_bCb  => ( IN_C_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN C,(C)      "),
IN_C_bCb2 => ( IN_C_bCb3, FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN C,(C)(int) "),
IN_C_bCb3 => ( FETCH,     FETCH, C, T,      NULLL, NONE, X"00", PC, FETCH, "IN C,(C)(int) "),

IN_D_bCb  => ( IN_D_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN D,(C)      "),
IN_D_bCb2 => ( IN_D_bCb3, FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN D,(C)(int) "),
IN_D_bCb3 => ( FETCH,     FETCH, D, T,      NULLL, NONE, X"00", PC, FETCH, "IN D,(C)(int) "),

IN_E_bCb  => ( IN_E_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN E,(C)      "),
IN_E_bCb2 => ( IN_E_bCb3, FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN E,(C)(int) "),
IN_E_bCb3 => ( FETCH,     FETCH, E, T,      NULLL, NONE, X"00", PC, FETCH, "IN E,(C)(int) "),

IN_H_bCb  => ( IN_H_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN H,(C)      "),
IN_H_bCb2 => ( IN_H_bCb3, FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN H,(C)(int) "),
IN_H_bCb3 => ( FETCH,     FETCH, H, T,      NULLL, NONE, X"00", PC, FETCH, "IN H,(C)(int) "),

IN_L_bCb  => ( IN_L_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN L,(C)      "),
IN_L_bCb2 => ( IN_L_bCb3, FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN L,(C)(int) "),
IN_L_bCb3 => ( FETCH,     FETCH, L, T,      NULLL, NONE, X"00", PC, FETCH, "IN L,(C)(int) "),

IN_T_bCb  => ( IN_T_bCb2, FETCH, T, K_H00,  NULLL, NONE, X"00", PC, NONE,  "IN T,(C)      "),
IN_T_bCb2 => ( FETCH,     FETCH, T, EXTERN, ORR,   F,    X"FF", BC, IO_RD, "IN T,(C)(int) "),

INI  => ( INI2,  FETCH, T,      B,      NULLL, F,    X"00", PC, NONE,   "INI (int)     "),
INI2 => ( INI3,  FETCH, T,      K_H01,  SUB,   F,    X"42", PC, NONE,   "INI (int)     "),
INI3 => ( INI4,  FETCH, B,      T,      NULLL, NONE, X"00", PC, NONE,   "INI (int)     "),
INI4 => ( INI5,  FETCH, T,      EXTERN, NULLL, NONE, X"00", BC, IO_RD,  "INI (int)     "),
INI5 => ( FETCH, FETCH, EXTERN, T,      INCHL, NONE, X"00", HL, MEM_WR, "INI (int)     "),

INIR  => ( INIR2, FETCH, T,      B,      NULLL,  F,    X"00", PC, NONE,   "INIR (int)    "),
INIR2 => ( INIR3, FETCH, T,      K_H01,  SUB,    F,    X"42", PC, NONE,   "INIR (int)    "),
INIR3 => ( INIR4, FETCH, B,      T,      NULLL,  NONE, X"00", PC, NONE,   "INIR (int)    "),
INIR4 => ( INIR5, FETCH, T,      EXTERN, NULLL,  NONE, X"00", BC, IO_RD,  "INIR (int)    "),
INIR5 => ( CHKBR, FETCH, EXTERN, T,      INCHL,  NONE, X"00", HL, MEM_WR, "INIR (int)    "),

IND  => ( IND2,  FETCH, T,      B,      NULLL, F,    X"00", PC, NONE,   "IND (int)     "),
IND2 => ( IND3,  FETCH, T,      K_H01,  SUB,   F,    X"42", PC, NONE,   "IND (int)     "),
IND3 => ( IND4,  FETCH, B,      T,      NULLL, NONE, X"00", PC, NONE,   "IND (int)     "),
IND4 => ( IND5,  FETCH, T,      EXTERN, NULLL, NONE, X"00", BC, IO_RD,  "IND (int)     "),
IND5 => ( FETCH, FETCH, EXTERN, T,      DECHL, NONE, X"00", HL, MEM_WR, "IND (int)     "),

INDR  => ( INDR2, FETCH, T,      B,      NULLL, F,    X"00", PC, NONE,   "INDR (int)    "),
INDR2 => ( INDR3, FETCH, T,      K_H01,  SUB,   F,    X"42", PC, NONE,   "INDR (int)    "),
INDR3 => ( INDR4, FETCH, B,      T,      NULLL, NONE, X"00", PC, NONE,   "INDR (int)    "),
INDR4 => ( INDR5, FETCH, T,      EXTERN, NULLL, NONE, X"00", BC, IO_RD,  "INDR (int)    "),
INDR5 => ( CHKBR, FETCH, EXTERN, T,      DECHL, NONE, X"00", HL, MEM_WR, "INDR (int)    "),

OUTI  => ( OUTI2, FETCH, T,      B,      NULLL, F,    X"00", PC, NONE,   "OUTI (int)    "),
OUTI2 => ( OUTI3, FETCH, T,      K_H01,  SUB,   F,    X"42", PC, NONE,   "OUTI (int)    "),
OUTI3 => ( OUTI4, FETCH, B,      T,      NULLL, NONE, X"00", PC, NONE,   "OUTI (int)    "),
OUTI4 => ( OUTI5, FETCH, T,      EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "OUTI (int)    "),
OUTI5 => ( FETCH, FETCH, EXTERN, T,      INCHL, NONE, X"00", BC, IO_WR,  "OUTI (int)    "),

OTIR  => ( OTIR2, FETCH, T,      B,      NULLL, F,    X"00", PC, NONE,   "OTIR (int)    "),
OTIR2 => ( OTIR3, FETCH, T,      K_H01,  SUB,   F,    X"42", PC, NONE,   "OTIR (int)    "),
OTIR3 => ( OTIR4, FETCH, B,      T,      NULLL, NONE, X"00", PC, NONE,   "OTIR (int)    "),
OTIR4 => ( OTIR5, FETCH, T,      EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "OTIR (int)    "),
OTIR5 => ( CHKBR, FETCH, EXTERN, T,      INCHL, NONE, X"00", BC, IO_WR,  "OTIR (int)    "),

OUTD  => ( OUTD2, FETCH, T,      B,      NULLL, F,    X"00", PC, NONE,   "OUTD (int)    "),
OUTD2 => ( OUTD3, FETCH, T,      K_H01,  SUB,   F,    X"42", PC, NONE,   "OUTD (int)    "),
OUTD3 => ( OUTD4, FETCH, B,      T,      NULLL, NONE, X"00", PC, NONE,   "OUTD (int)    "),
OUTD4 => ( OUTD5, FETCH, T,      EXTERN, NULLL, NONE, X"00", HL, MEM_RD, "OUTD (int)    "),
OUTD5 => ( FETCH, FETCH, EXTERN, T,      DECHL, NONE, X"00", BC, IO_WR,  "OUTD (int)    "),

OTDR  => ( OTDR2, FETCH, T,      B,      NULLL, F,    X"00", PC, NONE,   "OTDR (int)    "),
OTDR2 => ( OTDR3, FETCH, T,      K_H01,  SUB,   F,    X"42", PC, NONE,   "OTDR (int)    "),
OTDR3 => ( OTDR4, FETCH, B,      T,      NULLL, NONE, X"00", PC, NONE,   "OTDR (int)    "),
OTDR4 => ( OTDR5, FETCH, T,      EXTERN, NULLL,  NONE, X"00", HL, MEM_RD, "OTDR          "),
OTDR5 => ( CHKBR, FETCH, EXTERN, T,      DECHL,  NONE, X"00", BC, IO_WR,  "OTDR (int)    "),

CHKBR  => ( CHKBR2, FETCH, NONE, NONE, TST_NZ, F,    X"00", HL, NONE, "CHKBR (int)   "),
CHKBR2 => ( CHKBR3, FETCH, NONE, NONE, DECPC,  NONE, X"00", PC, NONE, "CHKBR (int)   "),
CHKBR3 => ( FETCH,  FETCH, NONE, NONE, DECPC,  NONE, X"00", PC, NONE, "CHKBR (int)   "),

OUT_bCb_B => ( FETCH, FETCH, EXTERN, B, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) B     "),
OUT_bCb_C => ( FETCH, FETCH, EXTERN, C, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) C     "),
OUT_bCb_D => ( FETCH, FETCH, EXTERN, D, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) D     "),
OUT_bCb_E => ( FETCH, FETCH, EXTERN, E, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) E     "),
OUT_bCb_H => ( FETCH, FETCH, EXTERN, H, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) H     "),
OUT_bCb_L => ( FETCH, FETCH, EXTERN, L, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) L     "),
OUT_bCb_0 => ( FETCH, FETCH, EXTERN, T, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) 0     "),
OUT_bCb_A => ( FETCH, FETCH, EXTERN, A, NULLL, NONE, X"00", BC, IO_WR, "OUT (C) A     "),

OUT_n  => ( OUT_n2, FETCH, TT_L,   EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "OUT           "),
OUT_n2 => ( OUT_n3, FETCH, TT_H,   A,      NULLL, NONE, X"00", PC, NONE,   "OUT(int)      "),
OUT_n3 => ( FETCH,  FETCH, EXTERN, A,      NULLL, NONE, X"00", TT, IO_WR,  "OUT(int)      "),

   --*********************************--
   --                                 --
   --      ESCAPE INSTRUCTIONS        --
   --                                 --
   --*********************************--
ESC_CB    => ( ESC_CB2, ESC_DDCB, NONE, NONE,   TST_EC, NONE, X"00", PC, NONE,   "ESC CB        "),
ESC_CB2   => ( FETCH,   FETCH,    INST, EXTERN, INCPC,  NONE, X"00", PC, FETCH,  "ESC CB        "),

ESC_DDCB  => ( ESC_DDCB2, FETCH, T,    EXTERN, INCPC, NONE, X"00", PC, MEM_RD, "ESC DDCB      "),
ESC_DDCB2 => ( ESC_DDCB3, FETCH, T,    L,      ADD,   G,    X"01", PC, NONE,   "ESC DDCB (int)"),
ESC_DDCB3 => ( ESC_DDCB4, FETCH, TT_L, T,      NULLL, NONE, X"00", PC, NONE,   "ESC DDCB (int)"),
ESC_DDCB4 => ( ESC_DDCB5, FETCH, T,    H,      NULLL, NONE, X"00", PC, NONE,   "ESC DDCB (int)"),
ESC_DDCB5 => ( ESC_DDCB6, FETCH, T,    K_H00,  ADDC,  NONE, X"00", PC, NONE,   "ESC DDCB (int)"),
ESC_DDCB6 => ( ESC_DDCB7, FETCH, TT_H, T,      NULLL, NONE, X"00", PC, NONE,   "ESC DDCB (int)"),
ESC_DDCB7 => ( FETCH,     FETCH, INST, EXTERN, INCPC, NONE, X"00", PC, FETCH,  "ESC DDCB (int)"),

ESC_DD => ( FETCH,   FETCH,   INST,   EXTERN,   INCPC,   NONE, X"00", PC,  FETCH,   "ESC DD        "),
ESC_ED => ( FETCH,   FETCH,   INST,   EXTERN,   INCPC,   NONE, X"00", PC,  FETCH,   "ESC ED        "),
ESC_FD => ( FETCH,   FETCH,   INST,   EXTERN,   INCPC,   NONE, X"00", PC,  FETCH,   "ESC FD        "),


   --*********************************--
   --                                 --
   --      INTERRUPT RESPONSE            --
   --      INSTRUCTIONS               --
   --*********************************--

I_NMI    => ( I_NMI2, FETCH,   T,      EXTERN, NULLL, NONE, X"00", PC,  NMI,  "INT NMI       "),
I_NMI2   => ( RST2,   FETCH,   T,      K_H66,  NULLL, NONE, X"00", PC,  NONE, "INT NMI (INT) "),

I_MODE0  => ( FETCH,  FETCH,   INST,   EXTERN, NULLL,  NONE, X"00", PC,  INT,  "INT M0        "),

I_MODE1  => ( I_MODE12, FETCH, T,      EXTERN, NULLL,  NONE, X"00", PC,  INT,  "INT M1        "),
I_MODE12 => ( RST2,     FETCH, T,      K_H38,  NULLL,  NONE, X"00", PC,  NONE, "INT M1  (INT) "),

I_MODE2  => ( I_MODE22, FETCH, TT_L,   EXTERN, DECSP,  NONE, X"00", PC,  INT,    "INT M2        "),
I_MODE22 => ( I_MODE23, FETCH, EXTERN, PC_H,   DECSP,  NONE, X"00", SP,  MEM_WR, "INT M2  (INT) "),
I_MODE23 => ( I_MODE24, FETCH, T,      IPAGE,  NULLL,  NONE, X"00", SP,  NONE,   "INT M2  (INT) "),
I_MODE24 => ( RST6,     FETCH, EXTERN, PC_L,   NULLL,  NONE, X"00", SP,  MEM_WR, "INT M2  (INT) ")

);

   end package Instruction_array_pak;