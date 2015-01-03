--File Instruction List package for the Z80
--Date: 10 May 2006
--Copyright P. Backhouse 2006

--This package simply lists all Instructions and assigns
--the hardcoded values to those that are not micro code
--internal to the Z80.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_Synth_pak.ALL;

package Instruction_list_pak is
   
 type T_INSTRUCTION is (	
   LD_A_A,		LD_A_B,		LD_A_C,		LD_A_D,		LD_A_E,		LD_A_H,		LD_A_L,		
   LD_B_A,		LD_B_B,		LD_B_C,		LD_B_D,		LD_B_E,		LD_B_H,		LD_B_L,		
   LD_C_A,		LD_C_B,		LD_C_C,		LD_C_D,		LD_C_E,		LD_C_H,		LD_C_L,		
   LD_D_A,		LD_D_B,		LD_D_C,		LD_D_D,		LD_D_E,		LD_D_H,		LD_D_L,		
   LD_E_A,		LD_E_B,		LD_E_C,		LD_E_D,		LD_E_E,		LD_E_H,		LD_E_L,		
   LD_H_A,		LD_H_B,		LD_H_C,		LD_H_D,		LD_H_E,		LD_H_H,		LD_H_L,		
   LD_L_A,		LD_L_B,		LD_L_C,		LD_L_D,		LD_L_E,		LD_L_H,		LD_L_L,		
   LD_A_n,		LD_B_n,		LD_C_n,		LD_D_n,		LD_E_n,		LD_H_n,		LD_L_n,		
   LD_A_bHLb, 	LD_B_bHLb, 	LD_C_bHLb, 	LD_D_bHLb, 	LD_E_bHLb,	LD_H_bHLb,	LD_L_bHLb,
   
   LD_bHLb_A,	LD_bHLb_B,	LD_bHLb_C,	LD_bHLb_D,	LD_bHLb_E,	LD_bHLb_H,	LD_bHLb_L,
   
   LD_bHLb_n,
   
   LD_BC_nn,
   LD_DE_nn,
   LD_HL_nn,
   LD_SP_nn,
   LD_HL_bnnb,
   LD_bnnb_HL,
   LD_SP_HL,
   
   PUSH_BC,
   PUSH_DE,
   PUSH_HL,
   PUSH_AF,
   
   POP_BC,
   POP_DE,
   POP_HL,
   POP_AF,
   
   EX_DE_HL,
   EX_AF_AF,
   EX_X,
   EX_bSPb_HL,
   
   LD_A_bBCb,
   LD_A_bDEb,
   LD_A_bnnb,
   LD_bBCb_A,
   LD_bDEb_A,
   LD_bnnb_A,
   ADD_A,		ADD_B,		ADD_C,		ADD_D,		ADD_E,		ADD_H,		ADD_L,		
   ADD_n,
   ADD_bHLb,
   ADDC_A,		ADDC_B,		ADDC_C,		ADDC_D,		ADDC_E,		ADDC_H,		ADDC_L,		
   ADDC_n,
   ADDC_bHLb,
   SUB_A,		SUB_B,		SUB_C,		SUB_D,		SUB_E,		SUB_H,		SUB_L,		
   SUB_n,
   SUB_bHLb,
   SUBC_A,		SUBC_B,		SUBC_C,		SUBC_D,		SUBC_E,		SUBC_H,		SUBC_L,		
   SUBC_n,
   SUBC_bHLb,
   AND_A,		AND_B,		AND_C,		AND_D,		AND_E,		AND_H,		AND_L,		
   AND_n,
   AND_bHLb,
   OR_A,			OR_B,			OR_C,			OR_D,			OR_E,			OR_H,			OR_L,		
   OR_n,
   OR_bHLb,
   XOR_A,		XOR_B,		XOR_C,		XOR_D,		XOR_E,		XOR_H,		XOR_L,		
   XOR_n,
   XOR_bHLb,
   COMP_A,		COMP_B,		COMP_C,		COMP_D,		COMP_E,		COMP_H,		COMP_L,		
   COMP_n,
   COMP_bHLb,
   INC_A,		INC_B,		INC_C,		INC_D,		INC_E,		INC_H,		INC_L,		
   INC_bHLb,
   DEC_A,		DEC_B,		DEC_C,		DEC_D,		DEC_E,		DEC_H,		DEC_L,		
   DEC_bHLb,
	DAA,
	CPL,
	CCF,
	SCF,
   NOP,
	HALT,
	DI,
	EI,
   ADD_HL_BC,  ADD_HL_DE, ADD_HL_HL,  ADD_HL_SP,
   INC_BC,     INC_DE,    INC_HL,     INC_SP,
   DEC_BC,     DEC_DE,    DEC_HL,     DEC_SP,
   RLCA,       RLA,       RRCA,       RRA,
   JP_nn,
   JP_NZ, JP_Z, JP_NC, JP_C, JP_PO, JP_PE, JP_P, JP_M,
   JR_NZ, JR_Z, JR_NC, JR_C,JP_HL,
	JR_e, 
	DJNZ,

	CALL,
	CALL_NZ,CALL_Z,CALL_NC,CALL_C,CALL_PO,CALL_PE,CALL_P,CALL_M,
	RET,
	RET_NZ,RET_Z,RET_NC,RET_C,RET_PO,RET_PE,RET_P,RET_M,
	RST_0,RST_1,RST_2,RST_3,RST_4,RST_5,RST_6,RST_7,
	IN_n,OUT_n,
	ESC_CB,ESC_DD,ESC_ED, ESC_FD, 

--******************************************************--
--Start of Regular Internal Codes                       --
--******************************************************--
 	I_NMI,
	I_NMI2,
	I_MODE0,
	I_MODE1, I_MODE12,
	I_MODE2, I_MODE22, I_MODE23, I_MODE24,
	FETCH,
   LD_A_bHLb2,
   LD_A_bIXdb,
   LD_A_bIXdb2,
   LD_A_bIXdb3,
   LD_A_bIXdb4,
   LD_A_bIXdb5,
   LD_A_bIXdb6,
   LD_A_bIXdb7,
   LD_B_bHLb2,
   LD_B_bIXdb,
   LD_B_bIXdb2,
   LD_B_bIXdb3,
   LD_B_bIXdb4,
   LD_B_bIXdb5,
   LD_B_bIXdb6,
   LD_B_bIXdb7,
   LD_C_bHLb2,
   LD_C_bIXdb,
   LD_C_bIXdb2,
   LD_C_bIXdb3,
   LD_C_bIXdb4,
   LD_C_bIXdb5,
   LD_C_bIXdb6,
   LD_C_bIXdb7,
   LD_D_bHLb2,
   LD_D_bIXdb,
   LD_D_bIXdb2,
   LD_D_bIXdb3,
   LD_D_bIXdb4,
   LD_D_bIXdb5,
   LD_D_bIXdb6,
   LD_D_bIXdb7,
   LD_E_bHLb2,
   LD_E_bIXdb,
   LD_E_bIXdb2,
   LD_E_bIXdb3,
   LD_E_bIXdb4,
   LD_E_bIXdb5,
   LD_E_bIXdb6,
   LD_E_bIXdb7,
   LD_H_bHLb2,
   LD_H_bIXdb,
   LD_H_bIXdb2,
   LD_H_bIXdb3,
   LD_H_bIXdb4,
   LD_H_bIXdb5,
   LD_H_bIXdb6,
   LD_H_bIXdb7,
   LD_L_bHLb2,
   LD_L_bIXdb,
   LD_L_bIXdb2,
   LD_L_bIXdb3,
   LD_L_bIXdb4,
   LD_L_bIXdb5,
   LD_L_bIXdb6,
   LD_L_bIXdb7,
   LD_bHLb_A2,
   LD_bIXdb_A,
   LD_bIXdb_A2,
   LD_bIXdb_A3,
   LD_bIXdb_A4,
   LD_bIXdb_A5,
   LD_bIXdb_A6,
   LD_bIXdb_A7,
   LD_bHLb_B2,
   LD_bIXdb_B,
   LD_bIXdb_B2,
   LD_bIXdb_B3,
   LD_bIXdb_B4,
   LD_bIXdb_B5,
   LD_bIXdb_B6,
   LD_bIXdb_B7,
   LD_bHLb_C2,
   LD_bIXdb_C,
   LD_bIXdb_C2,
   LD_bIXdb_C3,
   LD_bIXdb_C4,
   LD_bIXdb_C5,
   LD_bIXdb_C6,
   LD_bIXdb_C7,
   LD_bHLb_D2,
   LD_bIXdb_D,
   LD_bIXdb_D2,
   LD_bIXdb_D3,
   LD_bIXdb_D4,
   LD_bIXdb_D5,
   LD_bIXdb_D6,
   LD_bIXdb_D7,
   LD_bHLb_E2,
   LD_bIXdb_E,
   LD_bIXdb_E2,
   LD_bIXdb_E3,
   LD_bIXdb_E4,
   LD_bIXdb_E5,
   LD_bIXdb_E6,
   LD_bIXdb_E7,
   LD_bHLb_H2,
   LD_bIXdb_H,
   LD_bIXdb_H2,
   LD_bIXdb_H3,
   LD_bIXdb_H4,
   LD_bIXdb_H5,
   LD_bIXdb_H6,
   LD_bIXdb_H7,
   LD_bHLb_L2,
   LD_bIXdb_L,
   LD_bIXdb_L2,
   LD_bIXdb_L3,
   LD_bIXdb_L4,
   LD_bIXdb_L5,
   LD_bIXdb_L6,
   LD_bIXdb_L7,
	LD_A_bnnb2,
   LD_A_bnnb3,
   LD_bnnb_A2,
   LD_bnnb_A3,
   LD_A_I2,
   LD_bHLb_n2,
   LD_bIXdb_n,
   LD_bIXdb_n2,
   LD_bIXdb_n3,
   LD_bIXdb_n4,
   LD_bIXdb_n5,
   LD_bIXdb_n6,
   LD_bIXdb_n7,
   LD_BC_nn2,
   LD_DE_nn2,
   LD_HL_nn2,
   
   LD_HL_bnnb2,
   LD_HL_bnnb3,
   LD_HL_bnnb4,

   LD_bnnb_HL2,
   LD_bnnb_HL3,
   LD_bnnb_HL4,

   LD_SP_HL2,
   PUSH_BC2,
   PUSH_BC3,
   PUSH_DE2,
   PUSH_DE3,
   PUSH_HL2,
   PUSH_HL3,
   PUSH_AF2,
   PUSH_AF3,
   POP_BC2,
   POP_DE2,
   POP_HL2,
   POP_AF2,
   LD_SP_nn2,
   EX_bSPb_HL2,
   EX_bSPb_HL3,
   EX_bSPb_HL4,
   EX_bSPb_HL5,
   EX_bSPb_HL6,
   EX_bSPb_HL7,
   EX_bSPb_HL8,
   EX_bSPb_HL9,
   EX_bSPb_HL10,
   EX_bSPb_HL11,
   EX_bSPb_HL12,
   INC_A2,
   INC_B2, INC_B3,
   INC_C2, INC_C3,
   INC_D2, INC_D3,
   INC_E2, INC_E3,
   INC_H2, INC_H3,
   INC_L2, INC_L3,
   INC_bHLb2,
   INC_bHLb3,
   INC_bIXdb,
   INC_bIXdb2,
   INC_bIXdb3,
   INC_bIXdb4,
   INC_bIXdb5,
   INC_bIXdb6,
   INC_bIXdb7,
   INC_bIXdb8,
   INC_bIXdb9,
   DEC_A2,
   DEC_B2, DEC_B3,
   DEC_C2, DEC_C3,
   DEC_D2, DEC_D3,
   DEC_E2, DEC_E3,
   DEC_H2, DEC_H3,
   DEC_L2, DEC_L3,
   DEC_bHLb2,
   DEC_bHLb3,
   DEC_bHLb4,
   DEC_bIXdb,
   DEC_bIXdb2,
   DEC_bIXdb3,
   DEC_bIXdb4,
   DEC_bIXdb5,
   DEC_bIXdb6,
   DEC_bIXdb7,
   DEC_bIXdb8,
   DEC_bIXdb9,
   CCF2,
   CCF3,
   SCF2,
   DAA2,
   DAA3,
   DAA4,
   CPL2,
   CPL3,
   NEG2,
   SUB_n2,
   SUB_bHLb2,
   SUB_bIXdb,
   SUB_bIXdb2,
   SUB_bIXdb3,
   SUB_bIXdb4,
   SUB_bIXdb5,
   SUB_bIXdb6,
   SUB_bIXdb7,
   SUB_bIXdb8,
   SUBC_n2,
   SUBC_bHLb2,
   SUBC_bIXdb,
   SUBC_bIXdb2,
   SUBC_bIXdb3,
   SUBC_bIXdb4,
   SUBC_bIXdb5,
   SUBC_bIXdb6,
   SUBC_bIXdb7,
   SUBC_bIXdb8,
   ADD_n2,
   ADD_bHLb2,
   ADD_bIXdb,
   ADD_bIXdb2,
   ADD_bIXdb3,
   ADD_bIXdb4,
   ADD_bIXdb5,
   ADD_bIXdb6,
   ADD_bIXdb7,
   ADD_bIXdb8,
   ADDC_n2,
   ADDC_bHLb2,
   ADDC_bIXdb,
   ADDC_bIXdb2,
   ADDC_bIXdb3,
   ADDC_bIXdb4,
   ADDC_bIXdb5,
   ADDC_bIXdb6,
   ADDC_bIXdb7,
   ADDC_bIXdb8,
   ADD_HL_BC2,
   ADD_HL_BC3,
   ADD_HL_BC4,
   ADD_HL_BC5,
   ADD_HL_BC6,
   ADD_HL_BC7,
   ADD_HL_DE2,
   ADD_HL_DE3,
   ADD_HL_DE4,
   ADD_HL_DE5,
   ADD_HL_DE6,
   ADD_HL_DE7,
   ADD_HL_HL2,
   ADD_HL_HL3,
   ADD_HL_HL4,
   ADD_HL_HL5,
   ADD_HL_HL6,
   ADD_HL_HL7,
   ADD_HL_SP2,
   ADD_HL_SP3,
   ADD_HL_SP4,
   ADD_HL_SP5,
   ADD_HL_SP6,
   ADD_HL_SP7,
   AND_n2,
   AND_bHLb2,
   AND_bIXdb,
   AND_bIXdb2,
   AND_bIXdb3,
   AND_bIXdb4,
   AND_bIXdb5,
   AND_bIXdb6,
   AND_bIXdb7,
   AND_bIXdb8,
   OR_n2,
   OR_bHLb2,
   OR_bIXdb,
   OR_bIXdb2,
   OR_bIXdb3,
   OR_bIXdb4,
   OR_bIXdb5,
   OR_bIXdb6,
   OR_bIXdb7,
   OR_bIXdb8,
   XOR_n2,
   XOR_bHLb2,
   XOR_bIXdb,
   XOR_bIXdb2,
   XOR_bIXdb3,
   XOR_bIXdb4,
   XOR_bIXdb5,
   XOR_bIXdb6,
   XOR_bIXdb7,
   XOR_bIXdb8,
   COMP_A2,
   COMP_B2,
   COMP_C2,
   COMP_D2,
   COMP_E2,
   COMP_H2,
   COMP_L2,
   COMP_n2,
   COMP_n3,
   COMP_bHLb2,
   COMP_bIXdb,
   COMP_bIXdb2,
   COMP_bIXdb3,
   COMP_bIXdb4,
   COMP_bIXdb5,
   COMP_bIXdb6,
   COMP_bIXdb7,
   COMP_bIXdb8,
   
   JP_nn2,JP_HL2,	JP_FAIL, 	JP_FAIL2,
	JR2, JR3, JR4, JR5,
   JR_NEG,  
   JR_POS, 
   JR_END,
	JR_FAIL, DJNZ2, DJNZ3,
	CALL2, CALL3, CALL4, CALL5, CALL6,	CALL7,
	RET2,
	RST2,	RST3,	RST4,	RST5,	RST6,	RST7,
   IN_A_bCb2,IN_A_bCb3,
   IN_B_bCb2,IN_B_bCb3,
   IN_C_bCb2,IN_C_bCb3,
   IN_D_bCb2,IN_D_bCb3,
   IN_E_bCb2,IN_E_bCb3,
   IN_H_bCb2,IN_H_bCb3,
   IN_L_bCb2,IN_L_bCb3,
   IN_T_bCb2,
   INI2,INI3,INI4,INI5,
   INIR2,INIR3,INIR4,INIR5,
   IND2,IND3,IND4,IND5,
   INDR2,INDR3,INDR4,INDR5,
   OUTI2,OUTI3,OUTI4,OUTI5,
   OTIR2,OTIR3,OTIR4,OTIR5,
   OUTD2,OUTD3,OUTD4,OUTD5,
   OTDR2,OTDR3,OTDR4,OTDR5,
   CHKBR,CHKBR2,CHKBR3,
	IN_n2, IN_n3,OUT_n2, OUT_n3,
   
--******************************************************--
--            Start of CB Codes                         --
--******************************************************--
   RLC_B, RLC_C, RLC_D, RLC_E, RLC_H, RLC_L,  RLC_bHLb,RLC_A,
   RRC_B, RRC_C, RRC_D, RRC_E, RRC_H, RRC_L,  RRC_bHLb,RRC_A,
   RL_B, RL_C, RL_D, RL_E, RL_H, RL_L, RL_bHLb, RL_A,
   RR_B, RR_C, RR_D, RR_E, RR_H, RR_L, RR_bHLb, RR_A,

   SLA_B, SLA_C, SLA_D, SLA_E, SLA_H, SLA_L, SLA_bHLb, SLA_A,
   SRA_B, SRA_C, SRA_D, SRA_E, SRA_H, SRA_L, SRA_bHLb, SRA_A,
   SLL_B, SLL_C, SLL_D, SLL_E, SLL_H, SLL_L, SLL_bHLb, SLL_A,
   SRL_B, SRL_C, SRL_D, SRL_E, SRL_H, SRL_L, SRL_bHLb, SRL_A,

   BIT0_B,BIT0_C,BIT0_D,BIT0_E,BIT0_H,BIT0_L,BIT0_bHLb,BIT0_A,
   BIT1_B,BIT1_C,BIT1_D,BIT1_E,BIT1_H,BIT1_L,BIT1_bHLb,BIT1_A,
   BIT2_B,BIT2_C,BIT2_D,BIT2_E,BIT2_H,BIT2_L,BIT2_bHLb,BIT2_A,
   BIT3_B,BIT3_C,BIT3_D,BIT3_E,BIT3_H,BIT3_L,BIT3_bHLb,BIT3_A,
   BIT4_B,BIT4_C,BIT4_D,BIT4_E,BIT4_H,BIT4_L,BIT4_bHLb,BIT4_A,
   BIT5_B,BIT5_C,BIT5_D,BIT5_E,BIT5_H,BIT5_L,BIT5_bHLb,BIT5_A,
   BIT6_B,BIT6_C,BIT6_D,BIT6_E,BIT6_H,BIT6_L,BIT6_bHLb,BIT6_A,
   BIT7_B,BIT7_C,BIT7_D,BIT7_E,BIT7_H,BIT7_L,BIT7_bHLb,BIT7_A,

   RES0_B,RES0_C,RES0_D,RES0_E,RES0_H,RES0_L,RES0_bHLb,RES0_A,
   RES1_B,RES1_C,RES1_D,RES1_E,RES1_H,RES1_L,RES1_bHLb,RES1_A,
   RES2_B,RES2_C,RES2_D,RES2_E,RES2_H,RES2_L,RES2_bHLb,RES2_A,
   RES3_B,RES3_C,RES3_D,RES3_E,RES3_H,RES3_L,RES3_bHLb,RES3_A,
   RES4_B,RES4_C,RES4_D,RES4_E,RES4_H,RES4_L,RES4_bHLb,RES4_A,
   RES5_B,RES5_C,RES5_D,RES5_E,RES5_H,RES5_L,RES5_bHLb,RES5_A,
   RES6_B,RES6_C,RES6_D,RES6_E,RES6_H,RES6_L,RES6_bHLb,RES6_A,
   RES7_B,RES7_C,RES7_D,RES7_E,RES7_H,RES7_L,RES7_bHLb,RES7_A,

   SET0_B,SET0_C,SET0_D,SET0_E,SET0_H,SET0_L,SET0_bHLb,SET0_A,
   SET1_B,SET1_C,SET1_D,SET1_E,SET1_H,SET1_L,SET1_bHLb,SET1_A,
   SET2_B,SET2_C,SET2_D,SET2_E,SET2_H,SET2_L,SET2_bHLb,SET2_A,
   SET3_B,SET3_C,SET3_D,SET3_E,SET3_H,SET3_L,SET3_bHLb,SET3_A,
   SET4_B,SET4_C,SET4_D,SET4_E,SET4_H,SET4_L,SET4_bHLb,SET4_A,
   SET5_B,SET5_C,SET5_D,SET5_E,SET5_H,SET5_L,SET5_bHLb,SET5_A,
   SET6_B,SET6_C,SET6_D,SET6_E,SET6_H,SET6_L,SET6_bHLb,SET6_A,
   SET7_B,SET7_C,SET7_D,SET7_E,SET7_H,SET7_L,SET7_bHLb,SET7_A,



--******************************************************--
--            Internals for CB Codes                    --
--******************************************************--
   RLC_B2,RLC_C2,RLC_D2,RLC_E2,RLC_H2,RLC_L2,RLC_bHLb2,RLC_A2,
   RLC_B3,RLC_C3,RLC_D3,RLC_E3,RLC_H3,RLC_L3,RLC_bHLb3,RLC_A3,
   LD_A_RLC_bIXdb,LD_B_RLC_bIXdb,LD_C_RLC_bIXdb,LD_D_RLC_bIXdb,
   LD_E_RLC_bIXdb,LD_H_RLC_bIXdb,LD_L_RLC_bIXdb,
   RLC_bIXdb,RLC_bIXdb2,
   RRC_B2,RRC_C2,RRC_D2,RRC_E2,RRC_H2,RRC_L2,RRC_bHLb2,RRC_A2,
   RRC_B3,RRC_C3,RRC_D3,RRC_E3,RRC_H3,RRC_L3,RRC_bHLb3,RRC_A3,
   LD_A_RRC_bIXdb,LD_B_RRC_bIXdb,LD_C_RRC_bIXdb,LD_D_RRC_bIXdb,
   LD_E_RRC_bIXdb,LD_H_RRC_bIXdb,LD_L_RRC_bIXdb,
   RRC_bIXdb,RRC_bIXdb2,

   RL_B2,RL_C2,RL_D2,RL_E2,RL_H2,RL_L2,RL_bHLb2,RL_A2,
   RL_B3,RL_C3,RL_D3,RL_E3,RL_H3,RL_L3,RL_bHLb3,RL_A3,
   LD_A_RL_bIXdb,LD_B_RL_bIXdb,LD_C_RL_bIXdb,LD_D_RL_bIXdb,
   LD_E_RL_bIXdb,LD_H_RL_bIXdb,LD_L_RL_bIXdb,
   RL_bIXdb,RL_bIXdb2,

   RR_B2,RR_C2,RR_D2,RR_E2,RR_H2,RR_L2,RR_bHLb2,RR_A2,
   RR_B3,RR_C3,RR_D3,RR_E3,RR_H3,RR_L3,RR_bHLb3,RR_A3,
   LD_A_RR_bIXdb,LD_B_RR_bIXdb,LD_C_RR_bIXdb,LD_D_RR_bIXdb,
   LD_E_RR_bIXdb,LD_H_RR_bIXdb,LD_L_RR_bIXdb,
   RR_bIXdb,RR_bIXdb2,

   SLA_B2,SLA_C2,SLA_D2,SLA_E2,SLA_H2,SLA_L2,SLA_bHLb2,SLA_A2,
   SLA_B3,SLA_C3,SLA_D3,SLA_E3,SLA_H3,SLA_L3,SLA_bHLb3,SLA_A3,
   LD_A_SLA_bIXdb,LD_B_SLA_bIXdb,LD_C_SLA_bIXdb,LD_D_SLA_bIXdb,
   LD_E_SLA_bIXdb,LD_H_SLA_bIXdb,LD_L_SLA_bIXdb,
   SLA_bIXdb,SLA_bIXdb2,

   SRA_B2,SRA_C2,SRA_D2,SRA_E2,SRA_H2,SRA_L2,SRA_bHLb2,SRA_A2,
   SRA_B3,SRA_C3,SRA_D3,SRA_E3,SRA_H3,SRA_L3,SRA_bHLb3,SRA_A3,
   LD_A_SRA_bIXdb,LD_B_SRA_bIXdb,LD_C_SRA_bIXdb,LD_D_SRA_bIXdb,
   LD_E_SRA_bIXdb,LD_H_SRA_bIXdb,LD_L_SRA_bIXdb,
   SRA_bIXdb,SRA_bIXdb2,

   SLL_B2,SLL_C2,SLL_D2,SLL_E2,SLL_H2,SLL_L2,SLL_bHLb2,SLL_A2,
   SLL_B3,SLL_C3,SLL_D3,SLL_E3,SLL_H3,SLL_L3,SLL_bHLb3,SLL_A3,
   LD_A_SLL_bIXdb,LD_B_SLL_bIXdb,LD_C_SLL_bIXdb,LD_D_SLL_bIXdb,
   LD_E_SLL_bIXdb,LD_H_SLL_bIXdb,LD_L_SLL_bIXdb,
   SLL_bIXdb,SLL_bIXdb2,

   SRL_B2,SRL_C2,SRL_D2,SRL_E2,SRL_H2,SRL_L2,SRL_bHLb2,SRL_A2,
   SRL_B3,SRL_C3,SRL_D3,SRL_E3,SRL_H3,SRL_L3,SRL_bHLb3,SRL_A3,
   LD_A_SRL_bIXdb,LD_B_SRL_bIXdb,LD_C_SRL_bIXdb,LD_D_SRL_bIXdb,
   LD_E_SRL_bIXdb,LD_H_SRL_bIXdb,LD_L_SRL_bIXdb,
   SRL_bIXdb,SRL_bIXdb2,

   BIT0, BIT0_bHLb2, BIT0_bIXdb,
   BIT1, BIT1_bHLb2, BIT1_bIXdb,
   BIT2, BIT2_bHLb2, BIT2_bIXdb,
   BIT3, BIT3_bHLb2, BIT3_bIXdb,
   BIT4, BIT4_bHLb2, BIT4_bIXdb,
   BIT5, BIT5_bHLb2, BIT5_bIXdb,
   BIT6, BIT6_bHLb2, BIT6_bIXdb,
   BIT7, BIT7_bHLb2, BIT7_bIXdb,

RES0_A2,RES0_A3,LD_A_RES0_bIXdb,
RES1_A2,RES1_A3,LD_A_RES1_bIXdb,
RES2_A2,RES2_A3,LD_A_RES2_bIXdb,
RES3_A2,RES3_A3,LD_A_RES3_bIXdb,
RES4_A2,RES4_A3,LD_A_RES4_bIXdb,
RES5_A2,RES5_A3,LD_A_RES5_bIXdb,
RES6_A2,RES6_A3,LD_A_RES6_bIXdb,
RES7_A2,RES7_A3,LD_A_RES7_bIXdb,

RES0_B2,RES0_B3,LD_B_RES0_bIXdb,
RES1_B2,RES1_B3,LD_B_RES1_bIXdb,
RES2_B2,RES2_B3,LD_B_RES2_bIXdb,
RES3_B2,RES3_B3,LD_B_RES3_bIXdb,
RES4_B2,RES4_B3,LD_B_RES4_bIXdb,
RES5_B2,RES5_B3,LD_B_RES5_bIXdb,
RES6_B2,RES6_B3,LD_B_RES6_bIXdb,
RES7_B2,RES7_B3,LD_B_RES7_bIXdb,

RES0_C2,RES0_C3,LD_C_RES0_bIXdb,
RES1_C2,RES1_C3,LD_C_RES1_bIXdb,
RES2_C2,RES2_C3,LD_C_RES2_bIXdb,
RES3_C2,RES3_C3,LD_C_RES3_bIXdb,
RES4_C2,RES4_C3,LD_C_RES4_bIXdb,
RES5_C2,RES5_C3,LD_C_RES5_bIXdb,
RES6_C2,RES6_C3,LD_C_RES6_bIXdb,
RES7_C2,RES7_C3,LD_C_RES7_bIXdb,

RES0_D2,RES0_D3,LD_D_RES0_bIXdb,
RES1_D2,RES1_D3,LD_D_RES1_bIXdb,
RES2_D2,RES2_D3,LD_D_RES2_bIXdb,
RES3_D2,RES3_D3,LD_D_RES3_bIXdb,
RES4_D2,RES4_D3,LD_D_RES4_bIXdb,
RES5_D2,RES5_D3,LD_D_RES5_bIXdb,
RES6_D2,RES6_D3,LD_D_RES6_bIXdb,
RES7_D2,RES7_D3,LD_D_RES7_bIXdb,

RES0_E2,RES0_E3,LD_E_RES0_bIXdb,
RES1_E2,RES1_E3,LD_E_RES1_bIXdb,
RES2_E2,RES2_E3,LD_E_RES2_bIXdb,
RES3_E2,RES3_E3,LD_E_RES3_bIXdb,
RES4_E2,RES4_E3,LD_E_RES4_bIXdb,
RES5_E2,RES5_E3,LD_E_RES5_bIXdb,
RES6_E2,RES6_E3,LD_E_RES6_bIXdb,
RES7_E2,RES7_E3,LD_E_RES7_bIXdb,

RES0_H2,RES0_H3,LD_H_RES0_bIXdb,
RES1_H2,RES1_H3,LD_H_RES1_bIXdb,
RES2_H2,RES2_H3,LD_H_RES2_bIXdb,
RES3_H2,RES3_H3,LD_H_RES3_bIXdb,
RES4_H2,RES4_H3,LD_H_RES4_bIXdb,
RES5_H2,RES5_H3,LD_H_RES5_bIXdb,
RES6_H2,RES6_H3,LD_H_RES6_bIXdb,
RES7_H2,RES7_H3,LD_H_RES7_bIXdb,

RES0_L2,RES0_L3,LD_L_RES0_bIXdb,
RES1_L2,RES1_L3,LD_L_RES1_bIXdb,
RES2_L2,RES2_L3,LD_L_RES2_bIXdb,
RES3_L2,RES3_L3,LD_L_RES3_bIXdb,
RES4_L2,RES4_L3,LD_L_RES4_bIXdb,
RES5_L2,RES5_L3,LD_L_RES5_bIXdb,
RES6_L2,RES6_L3,LD_L_RES6_bIXdb,
RES7_L2,RES7_L3,LD_L_RES7_bIXdb,

RES0_bHLb2,RES0_bHLb3,RES0_bHLb4,
RES0_bIXdb,RES0_bIXdb2,RES0_bIXdb3,
RES1_bHLb2,RES1_bHLb3,RES1_bHLb4,
RES1_bIXdb,RES1_bIXdb2,RES1_bIXdb3,
RES2_bHLb2,RES2_bHLb3,RES2_bHLb4,
RES2_bIXdb,RES2_bIXdb2,RES2_bIXdb3,
RES3_bHLb2,RES3_bHLb3,RES3_bHLb4,
RES3_bIXdb,RES3_bIXdb2,RES3_bIXdb3,
RES4_bHLb2,RES4_bHLb3,RES4_bHLb4,
RES4_bIXdb,RES4_bIXdb2,RES4_bIXdb3,
RES5_bHLb2,RES5_bHLb3,RES5_bHLb4,
RES5_bIXdb,RES5_bIXdb2,RES5_bIXdb3,
RES6_bHLb2,RES6_bHLb3,RES6_bHLb4,
RES6_bIXdb,RES6_bIXdb2,RES6_bIXdb3,
RES7_bHLb2,RES7_bHLb3,RES7_bHLb4,
RES7_bIXdb,RES7_bIXdb2,RES7_bIXdb3,

SET0_A2,SET0_A3,LD_A_SET0_bIXdb,
SET1_A2,SET1_A3,LD_A_SET1_bIXdb,
SET2_A2,SET2_A3,LD_A_SET2_bIXdb,
SET3_A2,SET3_A3,LD_A_SET3_bIXdb,
SET4_A2,SET4_A3,LD_A_SET4_bIXdb,
SET5_A2,SET5_A3,LD_A_SET5_bIXdb,
SET6_A2,SET6_A3,LD_A_SET6_bIXdb,
SET7_A2,SET7_A3,LD_A_SET7_bIXdb,

SET0_B2,SET0_B3,LD_B_SET0_bIXdb,
SET1_B2,SET1_B3,LD_B_SET1_bIXdb,
SET2_B2,SET2_B3,LD_B_SET2_bIXdb,
SET3_B2,SET3_B3,LD_B_SET3_bIXdb,
SET4_B2,SET4_B3,LD_B_SET4_bIXdb,
SET5_B2,SET5_B3,LD_B_SET5_bIXdb,
SET6_B2,SET6_B3,LD_B_SET6_bIXdb,
SET7_B2,SET7_B3,LD_B_SET7_bIXdb,

SET0_C2,SET0_C3,LD_C_SET0_bIXdb,
SET1_C2,SET1_C3,LD_C_SET1_bIXdb,
SET2_C2,SET2_C3,LD_C_SET2_bIXdb,
SET3_C2,SET3_C3,LD_C_SET3_bIXdb,
SET4_C2,SET4_C3,LD_C_SET4_bIXdb,
SET5_C2,SET5_C3,LD_C_SET5_bIXdb,
SET6_C2,SET6_C3,LD_C_SET6_bIXdb,
SET7_C2,SET7_C3,LD_C_SET7_bIXdb,

SET0_D2,SET0_D3,LD_D_SET0_bIXdb,
SET1_D2,SET1_D3,LD_D_SET1_bIXdb,
SET2_D2,SET2_D3,LD_D_SET2_bIXdb,
SET3_D2,SET3_D3,LD_D_SET3_bIXdb,
SET4_D2,SET4_D3,LD_D_SET4_bIXdb,
SET5_D2,SET5_D3,LD_D_SET5_bIXdb,
SET6_D2,SET6_D3,LD_D_SET6_bIXdb,
SET7_D2,SET7_D3,LD_D_SET7_bIXdb,

SET0_E2,SET0_E3,LD_E_SET0_bIXdb,
SET1_E2,SET1_E3,LD_E_SET1_bIXdb,
SET2_E2,SET2_E3,LD_E_SET2_bIXdb,
SET3_E2,SET3_E3,LD_E_SET3_bIXdb,
SET4_E2,SET4_E3,LD_E_SET4_bIXdb,
SET5_E2,SET5_E3,LD_E_SET5_bIXdb,
SET6_E2,SET6_E3,LD_E_SET6_bIXdb,
SET7_E2,SET7_E3,LD_E_SET7_bIXdb,

SET0_H2,SET0_H3,LD_H_SET0_bIXdb,
SET1_H2,SET1_H3,LD_H_SET1_bIXdb,
SET2_H2,SET2_H3,LD_H_SET2_bIXdb,
SET3_H2,SET3_H3,LD_H_SET3_bIXdb,
SET4_H2,SET4_H3,LD_H_SET4_bIXdb,
SET5_H2,SET5_H3,LD_H_SET5_bIXdb,
SET6_H2,SET6_H3,LD_H_SET6_bIXdb,
SET7_H2,SET7_H3,LD_H_SET7_bIXdb,

SET0_L2,SET0_L3,LD_L_SET0_bIXdb,
SET1_L2,SET1_L3,LD_L_SET1_bIXdb,
SET2_L2,SET2_L3,LD_L_SET2_bIXdb,
SET3_L2,SET3_L3,LD_L_SET3_bIXdb,
SET4_L2,SET4_L3,LD_L_SET4_bIXdb,
SET5_L2,SET5_L3,LD_L_SET5_bIXdb,
SET6_L2,SET6_L3,LD_L_SET6_bIXdb,
SET7_L2,SET7_L3,LD_L_SET7_bIXdb,

SET0_bHLb2,SET0_bHLb3,SET0_bHLb4,
SET0_bIXdb,SET0_bIXdb2,SET0_bIXdb3,
SET1_bHLb2,SET1_bHLb3,SET1_bHLb4,
SET1_bIXdb,SET1_bIXdb2,SET1_bIXdb3,
SET2_bHLb2,SET2_bHLb3,SET2_bHLb4,
SET2_bIXdb,SET2_bIXdb2,SET2_bIXdb3,
SET3_bHLb2,SET3_bHLb3,SET3_bHLb4,
SET3_bIXdb,SET3_bIXdb2,SET3_bIXdb3,
SET4_bHLb2,SET4_bHLb3,SET4_bHLb4,
SET4_bIXdb,SET4_bIXdb2,SET4_bIXdb3,
SET5_bHLb2,SET5_bHLb3,SET5_bHLb4,
SET5_bIXdb,SET5_bIXdb2,SET5_bIXdb3,
SET6_bHLb2,SET6_bHLb3,SET6_bHLb4,
SET6_bIXdb,SET6_bIXdb2,SET6_bIXdb3,
SET7_bHLb2,SET7_bHLb3,SET7_bHLb4,
SET7_bIXdb,SET7_bIXdb2,SET7_bIXdb3,

ESC_CB2, ESC_DDCB,  ESC_DDCB2, ESC_DDCB3, ESC_DDCB4, 
ESC_DDCB5, ESC_DDCB6, ESC_DDCB7, 

--******************************************************--
--            Start of ED Codes                         --
--******************************************************--
   
	IN_B_bCb, IN_C_bCb, IN_D_bCb, IN_E_bCb, IN_H_bCb, IN_L_bCb, IN_T_bCb, IN_A_bCb,
   INI, INIR,IND, INDR,
   OUTI, OTIR,OUTD, OTDR,
   OUT_bCb_B, OUT_bCb_C, OUT_bCb_D, OUT_bCb_E, OUT_bCb_H, OUT_bCb_L, OUT_bCb_0, OUT_bCb_A,
   ADDC_HL_BC,  ADDC_HL_DE, ADDC_HL_HL,  ADDC_HL_SP,
   SUBC_HL_BC,  SUBC_HL_DE, SUBC_HL_HL,  SUBC_HL_SP,
   LD_bnnb_BC, LD_bnnb_DE, LD_bnnb_HL_2, LD_bnnb_SP, 
   LD_BC_bnnb, LD_DE_bnnb, LD_HL2_bnnb, LD_SP_bnnb,

   NEG, NEG_2, NEG_3, NEG_4, NEG_5, NEG_6, NEG_7, NEG_8,
   RETI, RETI_2, RETI_3, RETI_4, 
   RETN, RETN_2, RETN_3, RETN_4, 
   IM0, IM1, IM2, 
   IM0_2, IM0_3, IM0_4, IM1_2, IM2_2,
   LD_I_A, LD_A_I, LD_R_A, LD_A_R,
   LDI,
   LDIR,
   LDD,
   LDDR,
   CPI,
   CPIR,
   CPD,
   CPDR,
   RLD,
   RRD,
--******************************************************--
--            Internals for ED Codes                    --
--******************************************************--

   ADDC_HL_BC2,
   ADDC_HL_BC3,
   ADDC_HL_BC4,
   ADDC_HL_BC5,
   ADDC_HL_BC6,
   ADDC_HL_BC7,
   ADDC_HL_DE2,
   ADDC_HL_DE3,
   ADDC_HL_DE4,
   ADDC_HL_DE5,
   ADDC_HL_DE6,
   ADDC_HL_DE7,
   ADDC_HL_HL2,
   ADDC_HL_HL3,
   ADDC_HL_HL4,
   ADDC_HL_HL5,
   ADDC_HL_HL6,
   ADDC_HL_HL7,
   ADDC_HL_SP2,
   ADDC_HL_SP3,
   ADDC_HL_SP4,
   ADDC_HL_SP5,
   ADDC_HL_SP6,
   ADDC_HL_SP7,

   SUBC_HL_BC2,
   SUBC_HL_BC3,
   SUBC_HL_BC4,
   SUBC_HL_BC5,
   SUBC_HL_BC6,
   SUBC_HL_BC7,
   
   SUBC_HL_DE2,
   SUBC_HL_DE3,
   SUBC_HL_DE4,
   SUBC_HL_DE5,
   SUBC_HL_DE6,
   SUBC_HL_DE7,
   
   SUBC_HL_HL2,
   SUBC_HL_HL3,
   SUBC_HL_HL4,
   SUBC_HL_HL5,
   SUBC_HL_HL6,
   SUBC_HL_HL7,
   
   SUBC_HL_SP2,
   SUBC_HL_SP3,
   SUBC_HL_SP4,
   SUBC_HL_SP5,
   SUBC_HL_SP6,
   SUBC_HL_SP7,
   
   LD_BC_bnnb2,
   LD_BC_bnnb3,
   LD_BC_bnnb4,
   
   LD_bnnb_BC2,
   LD_bnnb_BC3,
   LD_bnnb_BC4,

   LD_DE_bnnb2,
   LD_DE_bnnb3,
   LD_DE_bnnb4,
   
   LD_bnnb_DE2,
   LD_bnnb_DE3,
   LD_bnnb_DE4,

   LD_SP_bnnb2,
   LD_SP_bnnb3,
   LD_SP_bnnb4,
   
   LD_bnnb_SP2,
   LD_bnnb_SP3,
   LD_bnnb_SP4,

   LDI2,
   LDI3,
   
   LDIR2,
   LDIR3,

   LDD2,
   LDD3,
   
   LDDR2,
   LDDR3,
   
   CPI2,
   CPI3,
   
   CPIR2,
   CPIR3,

   CPD2,
   CPD3,
   
   CPDR2,
   CPDR3,
   
   LDRCHK,
   CPRCHK,
   LDRCHKR,
   CPRCHKR,
   CHKBC,
   CHKBC2,
   CHKBC3,
   CHKBC4,
   RLD2,
   RLD3,
   RLD4,
   RLD5,

   RRD2,
   RRD3,
   RRD4,
   RRD5

      );
   
   type T_Instruction_Coding is array (T_instruction range LD_A_A to ESC_FD) 
   of std_logic_vector (7 downto 0);
   
   type T_CB_Instruction_Coding is array (T_instruction range RLC_B to SET7_A) 
   of std_logic_vector (7 downto 0);

   type T_ED_Instruction_Coding is array (T_instruction range IN_B_bCb to RRD) 
   of std_logic_vector (7 downto 0);
   
--TODO: A big job, but it might be more intuitive to have the coding the
--other way around, with a list of vectors, refering to types (as opposed
--to vectors indexed by type) This way an others clause can be inserted to
--give nop.   
   constant K_Instruction_Coding : T_Instruction_Coding := (
   LD_A_A 	=> X"7F",
   LD_A_B 	=> X"78",
   LD_A_C 	=> X"79",
   LD_A_D 	=> X"7A",
   LD_A_E 	=> X"7B",
   LD_A_H 	=> X"7C",
   LD_A_L 	=> X"7D",
   
   LD_B_A 	=> X"47",
   LD_B_B 	=> X"40",
   LD_B_C 	=> X"41",
   LD_B_D 	=> X"42",
   LD_B_E 	=> X"43",
   LD_B_H 	=> X"44",
   LD_B_L 	=> X"45",
   
   LD_C_A 	=> X"4F",
   LD_C_B 	=> X"48",
   LD_C_C 	=> X"49",
   LD_C_D 	=> X"4A",
   LD_C_E 	=> X"4B",
   LD_C_H 	=> X"4C",
   LD_C_L 	=> X"4D",
   
   LD_D_A 	=> X"57",
   LD_D_B 	=> X"50",
   LD_D_C 	=> X"51",
   LD_D_D 	=> X"52",
   LD_D_E 	=> X"53",
   LD_D_H 	=> X"54",
   LD_D_L 	=> X"55",
   
   LD_E_A 	=> X"5F",
   LD_E_B 	=> X"58",
   LD_E_C 	=> X"59",
   LD_E_D 	=> X"5A",
   LD_E_E 	=> X"5B",
   LD_E_H 	=> X"5C",
   LD_E_L 	=> X"5D",
   
   LD_H_A 	=> X"67",
   LD_H_B 	=> X"60",
   LD_H_C 	=> X"61",
   LD_H_D 	=> X"62",
   LD_H_E 	=> X"63",
   LD_H_H 	=> X"64",
   LD_H_L 	=> X"65",
   
   LD_L_A 	=> X"6F",
   LD_L_B 	=> X"68",
   LD_L_C 	=> X"69",
   LD_L_D 	=> X"6A",
   LD_L_E 	=> X"6B",
   LD_L_H 	=> X"6C",
   LD_L_L 	=> X"6D",
   
   LD_A_n 	=> X"3E",
   LD_B_n 	=> X"06",
   LD_C_n 	=> X"0E",
   LD_D_n 	=> X"16",
   LD_E_n 	=> X"1E",
   LD_H_n 	=> X"26",
   LD_L_n 	=> X"2E",
   
   LD_A_bHLb 	=> X"7E",
   LD_B_bHLb 	=> X"46",
   LD_C_bHLb 	=> X"4E",
   LD_D_bHLb 	=> X"56",
   LD_E_bHLb 	=> X"5E",
   LD_H_bHLb 	=> X"66",
   LD_L_bHLb 	=> X"6E",
      
   LD_bHLb_A 	=> X"77",
   LD_bHLb_B 	=> X"70",
   LD_bHLb_C 	=> X"71",
   LD_bHLb_D 	=> X"72",
   LD_bHLb_E 	=> X"73",
   LD_bHLb_H 	=> X"74",
   LD_bHLb_L 	=> X"75",
   
   LD_bHLb_n 	=> X"36",
   
   LD_A_bBCb 	=> X"0A",
   
   LD_A_bDEb 	=> X"1A",
   
   LD_A_bnnb 	=> X"3A",
   
   LD_bBCb_A 	=> X"02",
   
   LD_bDEb_A 	=> X"12",
   
   LD_bnnb_A 	=> X"32",
      
   --*********************************--
   --                                 --
   --   16 BIT LOAD INSTRUCTIONS      --
   --                                 --
   --*********************************--
   
   --		  IR (Bytecode), 	Next IR,			Read/Dest	Write/Src	ALU Inst		Exch		AddrSrc	Mem Acc Type	Name
   LD_BC_nn 	=> X"01",
   LD_DE_nn 	=> X"11",
   LD_HL_nn 	=> X"21",
   LD_SP_nn 	=> X"31",
   
   LD_HL_bnnb 	=> X"2A",
   LD_bnnb_HL 	=> X"22",
   
   LD_SP_HL 	=> X"F9",
   
   PUSH_BC 	=> X"C5",
   PUSH_DE 	=> X"D5",
   PUSH_HL 	=> X"E5",
   PUSH_AF 	=> X"F5",
   
   POP_BC 	=> X"C1",
   POP_DE 	=> X"D1",
   POP_HL 	=> X"E1",
   POP_AF 	=> X"F1",
   
   --*********************************--
   --  EXCHANGE, BLOCK TRANSFER AND   --
   --     SEARCH INSTRUCTIONS         --
   --                                 --
   --*********************************--
   --		  IR (Bytecode), 	Next IR,			Read/Dest	Write/Src	ALU Inst		Exch		AddrSrc	Mem Acc Type	Name
   EX_DE_HL 	=> X"EB",
   EX_AF_AF 	=> X"08",
   EX_X	 		=> X"D9",
   EX_bSPb_HL 	=> X"E3",
   
   --*********************************--
   --                                 --
   --   ARITHMETIC INSTRUCTIONS       --
   --                                 --
   --*********************************--
   
   ADD_A 	=> X"87",
   ADD_B 	=> X"80",
   ADD_C 	=> X"81",
   ADD_D 	=> X"82",
   ADD_E 	=> X"83",
   ADD_H 	=> X"84",
   ADD_L 	=> X"85",
   
   ADD_n 	=> X"C6",
   
   ADD_bHLb 	=> X"86",
   
   ADDC_A 	=> X"8F",
   ADDC_B 	=> X"88",
   ADDC_C 	=> X"89",
   ADDC_D 	=> X"8A",
   ADDC_E 	=> X"8B",
   ADDC_H 	=> X"8C",
   ADDC_L 	=> X"8D",
   
   ADDC_n 	=> X"CE",
   
   ADDC_bHLb	=> X"8E",
   
   SUB_A 	=> X"97",
   SUB_B 	=> X"90",
   SUB_C 	=> X"91",
   SUB_D 	=> X"92",
   SUB_E 	=> X"93",
   SUB_H 	=> X"94",
   SUB_L 	=> X"95",
   
   SUB_n 	=> X"D6",
   
   SUB_bHLb	=> X"96",
   
   SUBC_A 	=> X"9F",
   SUBC_B 	=> X"98",
   SUBC_C 	=> X"99",
   SUBC_D 	=> X"9A",
   SUBC_E 	=> X"9B",
   SUBC_H 	=> X"9C",
   SUBC_L 	=> X"9D",
   
   SUBC_n 	=> X"DE",
   
   SUBC_bHLb	=> X"9E",
   
   AND_A 	=> X"A7",
   AND_B 	=> X"A0",
   AND_C 	=> X"A1",
   AND_D 	=> X"A2",
   AND_E 	=> X"A3",
   AND_H 	=> X"A4",
   AND_L 	=> X"A5",
   
   AND_n 	=> X"E6",
   
   AND_bHLb	=> X"A6",
   
   OR_A 	=> X"B7",
   OR_B 	=> X"B0",
   OR_C 	=> X"B1",
   OR_D 	=> X"B2",
   OR_E 	=> X"B3",
   OR_H 	=> X"B4",
   OR_L 	=> X"B5",
   
   OR_n 	=> X"F6",
   
   OR_bHLb	=> X"B6",
   
   XOR_A 	=> X"AF",
   XOR_B 	=> X"A8",
   XOR_C 	=> X"A9",
   XOR_D 	=> X"AA",
   XOR_E 	=> X"AB",
   XOR_H 	=> X"AC",
   XOR_L 	=> X"AD",
   
   XOR_n 	=> X"EE",
   
   XOR_bHLb	=> X"AE",
   
   COMP_A 	=> X"BF",
   COMP_B 	=> X"B8",
   COMP_C 	=> X"B9",
   COMP_D 	=> X"BA",
   COMP_E 	=> X"BB",
   COMP_H 	=> X"BC",
   COMP_L 	=> X"BD",
   
   COMP_n 	=> X"FE",
   
   COMP_bHLb	=> X"BE",
   
   INC_A 	=> X"3C",
   INC_B 	=> X"04",
   INC_C 	=> X"0C",
   INC_D 	=> X"14",
   INC_E 	=> X"1C",
   INC_H 	=> X"24",
   INC_L 	=> X"2C",
   
   INC_bHLb	=> X"34",
   
   DEC_A 	=> X"3D",
   DEC_B 	=> X"05",
   DEC_C 	=> X"0D",
   DEC_D 	=> X"15",
   DEC_E 	=> X"1D",
   DEC_H 	=> X"25",
   DEC_L 	=> X"2D",
   
   DEC_bHLb	=> X"35",
   
   --*********************************--
   -- 	GENERAL PURPOSE ARITHMETIC	  --
   --   AND CPU CONTROL INSTRUCTIONS  --
   --                                 --
   --*********************************--
   DAA		=> X"27",
	CPL		=> X"2F",
	CCF		=> X"3F",
	SCF		=> X"37",
   NOP 		=> X"00",
   HALT		=> X"76",
	DI			=> X"F3",
	EI			=> X"FB",
   --*********************************--
   -- 	16-bit ARITHMENTIC GROUPIC	  --
   --                                 --
   --                                 --
   --*********************************--
   
   ADD_HL_BC   => X"09",
   ADD_HL_DE   => X"19",
   ADD_HL_HL   => X"29",
   ADD_HL_SP   => X"39",

   INC_BC      => X"03",
   INC_DE      => X"13",
   INC_HL      => X"23",
   INC_SP      => X"33",

   DEC_BC      => X"0B",
   DEC_DE      => X"1B",
   DEC_HL      => X"2B",
   DEC_SP      => X"3B",
   
   --*********************************--
   --                                 --
   --   ROTATE AND SHIFT GROUP        --
   --                                 --
   --*********************************--
   
   RLCA => X"07",
   RLA  => X"17",
   RRCA => X"0F",
   RRA  => X"1F",
   
   --*********************************--
   -- 										  --
   --			JUMP GROUP					  --
   --                                 --
   --*********************************--
   JP_nn	=> X"C3",
   JP_Z	=> X"CA",
   JP_NZ	=> X"C2",
   JP_C	=> X"DA",
   JP_NC	=> X"D2",
   JP_PO	=> X"E2",
   JP_PE	=> X"EA",
   JP_P	=> X"F2",
   JP_M	=> X"FA",
	JP_HL	=> X"E9",
	JR_e	=> X"18",
   JR_Z	=> X"28",
   JR_NZ	=> X"20",
   JR_C	=> X"38",
   JR_NC	=> X"30",
	DJNZ	=> X"10",
	
   --*********************************--
   -- 										  --
   --		CALL AND RETURN GROUP		  --
   --                                 --
   --*********************************--
	CALL		=> X"CD",
   CALL_NZ	=> X"C4",
   CALL_Z	=> X"CC",
   CALL_NC	=> X"D4",
   CALL_C	=> X"DC",
   CALL_PO	=> X"E4",
   CALL_PE	=> X"EC",
   CALL_P	=> X"F4",
   CALL_M	=> X"FC",

	RET		=> X"C9",
   RET_NZ	=> X"C0",
   RET_Z		=> X"C8",
   RET_NC	=> X"D0",
   RET_C		=> X"D8",
   RET_PO	=> X"E0",
   RET_PE	=> X"E8",
   RET_P		=> X"F0",
   RET_M		=> X"F8",

	RST_0		=> X"C7",	
	RST_1		=> X"CF",	
	RST_2		=> X"D7",	
	RST_3		=> X"DF",	
	RST_4		=> X"E7",	
	RST_5		=> X"EF",	
	RST_6		=> X"F7",	
	RST_7		=> X"FF",
   --*********************************--
   -- 										  --
   --		INPUT AND OUTPUT GROUP		  --
   --                                 --
   --*********************************--
	IN_N		=> X"DB",
	OUT_N		=> X"D3",

   --*********************************--
   -- 										  --
   --		ESCAPE INSTRUCTIONS			  --
   --                                 --
   --*********************************--
	ESC_CB	=> X"CB",
	ESC_DD	=> X"DD",
	ESC_ED	=> X"ED",
	ESC_FD	=> X"FD"
	);

   constant K_CB_Instruction_Coding : T_CB_Instruction_Coding := (
RLC_B       => X"00",
RLC_C       => X"01",
RLC_D       => X"02",
RLC_E       => X"03",
RLC_H       => X"04",
RLC_L       => X"05",
RLC_bHLb    => X"06",
RLC_A       => X"07",

RRC_B       => X"08",
RRC_C       => X"09",
RRC_D       => X"0A",
RRC_E       => X"0B",
RRC_H       => X"0C",
RRC_L       => X"0D",
RRC_bHLb    => X"0E",
RRC_A       => X"0F",

RL_B        => X"10",
RL_C        => X"11",
RL_D        => X"12",
RL_E        => X"13",
RL_H        => X"14",
RL_L        => X"15",
RL_bHLb     => X"16",
RL_A        => X"17",

RR_B        => X"18",
RR_C        => X"19",
RR_D        => X"1A",
RR_E        => X"1B",
RR_H        => X"1C",
RR_L        => X"1D",
RR_bHLb     => X"1E",
RR_A        => X"1F",

SLA_B        => X"20",
SLA_C        => X"21",
SLA_D        => X"22",
SLA_E        => X"23",
SLA_H        => X"24",
SLA_L        => X"25",
SLA_bHLb     => X"26",
SLA_A        => X"27",

SRA_B        => X"28",
SRA_C        => X"29",
SRA_D        => X"2A",
SRA_E        => X"2B",
SRA_H        => X"2C",
SRA_L        => X"2D",
SRA_bHLb     => X"2E",
SRA_A        => X"2F",

SLL_B        => X"30",
SLL_C        => X"31",
SLL_D        => X"32",
SLL_E        => X"33",
SLL_H        => X"34",
SLL_L        => X"35",
SLL_bHLb     => X"36",
SLL_A        => X"37",

SRL_B        => X"38",
SRL_C        => X"39",
SRL_D        => X"3A",
SRL_E        => X"3B",
SRL_H        => X"3C",
SRL_L        => X"3D",
SRL_bHLb     => X"3E",
SRL_A        => X"3F",

BIT0_B        => X"40",
BIT0_C        => X"41",
BIT0_D        => X"42",
BIT0_E        => X"43",
BIT0_H        => X"44",
BIT0_L        => X"45",
BIT0_bHLb     => X"46",
BIT0_A        => X"47",

BIT1_B        => X"48",
BIT1_C        => X"49",
BIT1_D        => X"4A",
BIT1_E        => X"4B",
BIT1_H        => X"4C",
BIT1_L        => X"4D",
BIT1_bHLb        => X"4E",
BIT1_A        => X"4F",

BIT2_B        => X"50",
BIT2_C        => X"51",
BIT2_D        => X"52",
BIT2_E        => X"53",
BIT2_H        => X"54",
BIT2_L        => X"55",
BIT2_bHLb     => X"56",
BIT2_A        => X"57",

BIT3_B        => X"58",
BIT3_C        => X"59",
BIT3_D        => X"5A",
BIT3_E        => X"5B",
BIT3_H        => X"5C",
BIT3_L        => X"5D",
BIT3_bHLb     => X"5E",
BIT3_A        => X"5F",

BIT4_B        => X"60",
BIT4_C        => X"61",
BIT4_D        => X"62",
BIT4_E        => X"63",
BIT4_H        => X"64",
BIT4_L        => X"65",
BIT4_bHLb     => X"66",
BIT4_A        => X"67",

BIT5_B        => X"68",
BIT5_C        => X"69",
BIT5_D        => X"6A",
BIT5_E        => X"6B",
BIT5_H        => X"6C",
BIT5_L        => X"6D",
BIT5_bHLb     => X"6E",
BIT5_A        => X"6F",

BIT6_B        => X"70",
BIT6_C        => X"71",
BIT6_D        => X"72",
BIT6_E        => X"73",
BIT6_H        => X"74",
BIT6_L        => X"75",
BIT6_bHLb     => X"76",
BIT6_A        => X"77",

BIT7_B        => X"78",
BIT7_C        => X"79",
BIT7_D        => X"7A",
BIT7_E        => X"7B",
BIT7_H        => X"7C",
BIT7_L        => X"7D",
BIT7_bHLb     => X"7E",
BIT7_A        => X"7F",


RES0_B        => X"80",
RES0_C        => X"81",
RES0_D        => X"82",
RES0_E        => X"83",
RES0_H        => X"84",
RES0_L        => X"85",
RES0_bHLb     => X"86",
RES0_A        => X"87",

RES1_B        => X"88",
RES1_C        => X"89",
RES1_D        => X"8A",
RES1_E        => X"8B",
RES1_H        => X"8C",
RES1_L        => X"8D",
RES1_bHLb     => X"8E",
RES1_A        => X"8F",

RES2_B        => X"90",
RES2_C        => X"91",
RES2_D        => X"92",
RES2_E        => X"93",
RES2_H        => X"94",
RES2_L        => X"95",
RES2_bHLb     => X"96",
RES2_A        => X"97",

RES3_B        => X"98",
RES3_C        => X"99",
RES3_D        => X"9A",
RES3_E        => X"9B",
RES3_H        => X"9C",
RES3_L        => X"9D",
RES3_bHLb     => X"9E",
RES3_A        => X"9F",

RES4_B        => X"A0",
RES4_C        => X"A1",
RES4_D        => X"A2",
RES4_E        => X"A3",
RES4_H        => X"A4",
RES4_L        => X"A5",
RES4_bHLb     => X"A6",
RES4_A        => X"A7",

RES5_B        => X"A8",
RES5_C        => X"A9",
RES5_D        => X"AA",
RES5_E        => X"AB",
RES5_H        => X"AC",
RES5_L        => X"AD",
RES5_bHLb     => X"AE",
RES5_A        => X"AF",

RES6_B        => X"B0",
RES6_C        => X"B1",
RES6_D        => X"B2",
RES6_E        => X"B3",
RES6_H        => X"B4",
RES6_L        => X"B5",
RES6_bHLb     => X"B6",
RES6_A        => X"B7",

RES7_B        => X"B8",
RES7_C        => X"B9",
RES7_D        => X"BA",
RES7_E        => X"BB",
RES7_H        => X"BC",
RES7_L        => X"BD",
RES7_bHLb     => X"BE",
RES7_A        => X"BF",


SET0_B        => X"C0",
SET0_C        => X"C1",
SET0_D        => X"C2",
SET0_E        => X"C3",
SET0_H        => X"C4",
SET0_L        => X"C5",
SET0_bHLb     => X"C6",
SET0_A        => X"C7",

SET1_B        => X"C8",
SET1_C        => X"C9",
SET1_D        => X"CA",
SET1_E        => X"CB",
SET1_H        => X"CC",
SET1_L        => X"CD",
SET1_bHLb     => X"CE",
SET1_A        => X"CF",

SET2_B        => X"D0",
SET2_C        => X"D1",
SET2_D        => X"D2",
SET2_E        => X"D3",
SET2_H        => X"D4",
SET2_L        => X"D5",
SET2_bHLb     => X"D6",
SET2_A        => X"D7",

SET3_B        => X"D8",
SET3_C        => X"D9",
SET3_D        => X"DA",
SET3_E        => X"DB",
SET3_H        => X"DC",
SET3_L        => X"DD",
SET3_bHLb     => X"DE",
SET3_A        => X"DF",

SET4_B        => X"E0",
SET4_C        => X"E1",
SET4_D        => X"E2",
SET4_E        => X"E3",
SET4_H        => X"E4",
SET4_L        => X"E5",
SET4_bHLb     => X"E6",
SET4_A        => X"E7",

SET5_B        => X"E8",
SET5_C        => X"E9",
SET5_D        => X"EA",
SET5_E        => X"EB",
SET5_H        => X"EC",
SET5_L        => X"ED",
SET5_bHLb     => X"EE",
SET5_A        => X"EF",

SET6_B        => X"F0",
SET6_C        => X"F1",
SET6_D        => X"F2",
SET6_E        => X"F3",
SET6_H        => X"F4",
SET6_L        => X"F5",
SET6_bHLb     => X"F6",
SET6_A        => X"F7",

SET7_B        => X"F8",
SET7_C        => X"F9",
SET7_D        => X"FA",
SET7_E        => X"FB",
SET7_H        => X"FC",
SET7_L        => X"FD",
SET7_bHLb     => X"FE",
SET7_A        => X"FF"	
	 );

   constant K_ED_Instruction_Coding : T_ED_Instruction_Coding := (
      IN_B_bCb     => X"40",
      IN_C_bCb     => X"48",
      IN_D_bCb     => X"50",
      IN_E_bCb     => X"58",
      IN_H_bCb     => X"60",
      IN_L_bCb     => X"68",
      IN_T_bCb     => X"70",
      IN_A_bCb     => X"78",
      INI          => X"A2",
      INIR         => X"B2",
      IND          => X"AA",
      INDR         => X"BA",
      OUTI         => X"A3",
      OTIR         => X"B3",
      OUTD         => X"AB",
      OTDR         => X"BB",

      OUT_bCb_B    => X"41",
      OUT_bCb_C    => X"49",
      OUT_bCb_D    => X"51",
      OUT_bCb_E    => X"59",
      OUT_bCb_H    => X"61",
      OUT_bCb_L    => X"69",
      OUT_bCb_0    => X"71",
      OUT_bCb_A    => X"79",

      ADDC_HL_BC    => X"4A",
      ADDC_HL_DE    => X"5A",
      ADDC_HL_HL    => X"6A",
      ADDC_HL_SP    => X"7A",
      SUBC_HL_BC    => X"42",
      SUBC_HL_DE    => X"52",
      SUBC_HL_HL    => X"62",
      SUBC_HL_SP    => X"72",

      LD_bnnb_BC    => X"43",
      LD_bnnb_DE    => X"53",
      LD_bnnb_HL_2  => X"63",
      LD_bnnb_SP    => X"73",
      LD_BC_bnnb    => X"4B",
      LD_DE_bnnb    => X"5B",
      LD_HL2_bnnb   => X"6B",
      LD_SP_bnnb    => X"7B",
      NEG           => X"44",
      NEG_2         => X"4C",
      NEG_3         => X"54",
      NEG_4         => X"5C",
      NEG_5         => X"64",
      NEG_6         => X"6C",
      NEG_7         => X"74",
      NEG_8         => X"7C",
      RETI          => X"4D",
      RETI_2        => X"5D",
      RETI_3        => X"6D",
      RETI_4        => X"7D",
      RETN          => X"45",
      RETN_2        => X"55",
      RETN_3        => X"65",
      RETN_4        => X"75",
      IM0           => X"46",
      IM1           => X"56",
      IM2           => X"5E",
      IM0_2         => X"4E",
      IM0_3         => X"66",
      IM0_4         => X"6E",
      IM1_2         => X"76",
      IM2_2         => X"7E",
      LD_I_A        => X"47",
      LD_R_A        => X"4F",
      LD_A_I        => X"57",
      LD_A_R        => X"5F",
      LDI           => X"A0",
      LDIR          => X"B0",
      LDD           => X"A8",
      LDDR          => X"B8",
      CPI           => X"A1",
      CPIR          => X"B1",
      CPD           => X"A9",
      CPDR          => X"B9",
      RLD           => X"6F",
      RRD           => X"67"
	 );

type T_Instruction_Record is record
	Next_IR_Micro	: T_INSTRUCTION;
	Fail_IR_Micro	: T_INSTRUCTION;
	RD_Micro			: T_REGISTER_SELECT;
	WR_Micro			: T_REGISTER_SELECT;
	ALU_Micro		: T_ALU_INSTRUCTION;
	Flag_Micro		: T_REGISTER_SELECT;
   Mask_Micro     : std_logic_vector (7 downto 0);
	ADR_Mux_Micro	: T_ADDRESS;
	Access_Micro	: T_ACCESS;
	NAME 				: string(1 to 14);
end record T_Instruction_Record;
	
type T_INSTRUCTION_ARRAY is array (T_INSTRUCTION range <>) of T_Instruction_Record;
   
end package Instruction_list_pak;