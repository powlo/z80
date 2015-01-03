--This is an intermediate file to test loading and running 
--of the ALU with registers.

architecture rtl of intermediate is

component gp_core is
port (

--this all needs to change below...
	CLK		: IN 	std_logic;
	RESET_n	: IN 	std_logic;

	DATAIN	: IN 	std_logic_vector (7 downto 0);
	DATAOUT	: OUT std_logic_vector (7 downto 0);
	READ		: IN  std_logic_vector (7 downto 0);		
	WRITE		: IN  std_logic_vector (7 downto 0);		

	A			: OUT std_logic_vector (7 downto 0);
	T			: OUT std_logic_vector (7 downto 0)
);

end component gp_core;

component sp_core is
port (

--this all needs to change below...
	CLK		: IN 	std_logic;
	RESET_n	: IN 	std_logic;

	DATAIN		: IN 	std_logic_vector (7 downto 0);
	DATAOUT		: OUT std_logic_vector (7 downto 0);
	READ			: IN  std_logic_vector (7 downto 0);		
	WRITE			: IN  std_logic_vector (7 downto 0);		
	INC_PC		: IN 	std_logic;	
	PUSH			: IN 	std_logic;	
	POP			: IN 	std_logic;	
	ADDRESSMUX	: IN 	std_logic_vector (1 downto 0);
	ADDRESS		: OUT std_logic_vector (15 downto 0)
);

end component sp_core;

component control is
      port (
			CLK			: IN std_logic;
			RESET_n		: IN std_logic;
			DATAIN		: IN std_logic_vector (K_DATA_WIDTH-1 downto 0);
			DATAOUT		: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
			GP_READ		: OUT std_logic_vector (K_NO_OF_GP_REGS-1 downto 0);
			GP_WRITE		: OUT std_logic_vector (K_NO_OF_GP_REGS-1 downto 0);
			SP_READ		: OUT std_logic_vector (K_NO_OF_SP_REGS-1 downto 0);
			SP_WRITE		: OUT std_logic_vector (K_NO_OF_SP_REGS-1 downto 0);
			X_TYPE		: OUT std_logic_vector (K_MEM_ACCESS_WIDTH-1 downto 0);
			X_READ		: OUT std_logic;
			X_WRITE		: OUT std_logic;
			X_ACK			: IN	std_logic;
			PUSH			: OUT std_logic;
			POP			: OUT std_logic;
			ALU			: OUT std_logic_vector (K_ALU_INSTRUCTION_WIDTH-1 downto 0);
			ADDRESSMUX	: OUT std_logic_vector (K_ADRMUX_WIDTH-1 downto 0)
    );

   end component control;

component ALU is

port (

	Temp_register	: IN std_logic_vector (7 downto 0);
	A_Register 		: IN std_logic_vector (7 downto 0);
	FIN_Register	: IN std_logic_vector (7 downto 0);
	FOUT_Register	: OUT std_logic_vector (7 downto 0);
	Result			: OUT std_logic_vector (7 downto 0);
	ALU_command 	: IN std_logic_vector (2 downto 0)
	
);

end component ALU;

signal ALU_Control	: std_logic_vector (2 downto 0);
signal AddressMux		: std_logic_vector (1 downto 0);

signal Temp_Reg				: std_logic_vector (7 downto 0);
signal A_Reg					: std_logic_vector (7 downto 0);

signal Result					: std_logic_vector (7 downto 0);
signal Flag_Register			: std_logic_vector (7 downto 0);
signal Flag_Register_zero	: std_logic_vector (7 downto 0);

signal Inc_PC 		: std_logic;
signal Stack_Push :std_logic;
signal Stack_Pop 	: std_logic;

signal Rd_Gp_Core : std_logic_vector (7 downto 0);
signal Wr_Gp_Core : std_logic_vector (7 downto 0);
signal Rd_Sp_Core : std_logic_vector (7 downto 0);
signal Wr_Sp_Core : std_logic_vector (7 downto 0);

signal DataBus : std_logic_vector (7 downto 0);
signal DataBusOut_Control : std_logic_vector (7 downto 0);
signal DataBusOut_GP : std_logic_vector (7 downto 0);
signal DataBusOut_SP : std_logic_vector (7 downto 0);

begin

Flag_Register_zero <= (others => '0');

INST_Control: control 
	port map (
		CLK			=> CLK,
		RESET_n		=> RESET_n,
		DATAIN		=> DataBus,
		DATAOUT		=> DataBusOut_Control,
		GP_READ		=> Rd_Gp_Core,
		GP_WRITE		=> Wr_Gp_Core,
		SP_READ		=> Rd_Sp_Core,
		SP_WRITE		=> Wr_Sp_Core,
		X_READ		=> DATA_RD,
		X_WRITE		=> DATA_WR,
		INC_PC		=> Inc_PC,
		PUSH			=> Stack_Push,
		POP			=> Stack_Pop,
		ALU			=> ALU_Control,
		ADDRESSMUX	=> AddressMux
);

INST_general_purpose_core : gp_core 
port map (

	CLK		=> CLK,
	RESET_n	=> RESET_n,

	DATAIN	=> Databus,
	DATAOUT	=> DataBusOut_GP,
	READ		=> Rd_Gp_Core,
	WRITE		=> Wr_Gp_Core,
	A			=> A_reg,
	T			=> Temp_reg
);

INST_special_purpose_core : sp_core 
port map (

	CLK			=> CLK,
	RESET_n		=> RESET_n,

	DATAIN		=> Databus,
	DATAOUT		=> DataBusOut_SP,
	READ			=> Rd_Sp_Core,
	WRITE			=> Wr_Sp_Core,
	INC_PC		=> Inc_PC,
	PUSH			=> Stack_Push,
	POP			=> Stack_Pop,
	ADDRESSMUX	=> AddressMux,
	ADDRESS		=> ADDRESS
);

--Hmm if FIN and FOUT match to the same, then there should be
--an internal signal somewhere...
INST_ALU: ALU
port map (

	Temp_register	=>	Temp_Reg,
	A_Register		=>	A_Reg,
	FIN_Register	=>	Flag_Register_zero,
	FOUT_Register	=>	Flag_Register,
	Result			=>	Result,
	ALU_command		=>	ALU_Control
	
);

DataBus <= 	DataBusOut_Control or
				DataBusOut_GP or
				DataBusOut_SP or
				Result or
				DATAIN;

DATAOUT <= DataBus;

end architecture rtl;

