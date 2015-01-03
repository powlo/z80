--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a 16 bit register for the Z80
--with swap capacity, also includes inc
-- and dec capability as well as read and write

architecture rtl of register_16bit_swap_inc_dec is

component register_16bit_nonswap_inc_dec is

port (

	CLK				: IN std_logic;
	RESET_n			: IN std_logic;
	DATAIN			: IN std_logic_vector (7 downto 0);
	DATAOUT			: OUT std_logic_vector (7 downto 0);
	READ				: IN std_logic_vector (1 downto 0);
	WRITE		 		: IN std_logic_vector (1 downto 0);
   INC            : IN std_logic;
   DEC            : IN std_logic;
	REGISTER_VALUE : OUT std_logic_vector (15 downto 0)
);

end component register_16bit_nonswap_inc_dec;

signal RegSelect 	: std_logic;

signal RegValue   	: std_logic_vector (15 downto 0);
signal DataOut_Reg	: std_logic_vector (7 downto 0);
signal Read_Reg		: std_logic_vector (1 downto 0);
signal Write_Reg		: std_logic_vector (1 downto 0);
signal Inc_Reg		   : std_logic;
signal Dec_Reg		   : std_logic;

signal TickValue   	: std_logic_vector (15 downto 0);
signal DataOut_Tick	: std_logic_vector (7 downto 0);
signal Read_Tick		: std_logic_vector (1 downto 0);
signal Write_Tick		: std_logic_vector (1 downto 0);
signal Inc_Tick		: std_logic;
signal Dec_Tick		: std_logic;

begin

   --The swap signal is used to contol the selection
   --of either the (normal) register or the tick register.
   --Note that SWAP must only be active for one cycle.
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         RegSelect <= '0';
      elsif CLK'event and CLK='1' then
         if SWAP = '1' then
            RegSelect <= not RegSelect;
         end if;
      end if;
   end process;
   
   --Then using the select we activate either 
   --the Reg or its shadow, 'tick'.
   Read_Reg(0)  <= READ(0) and not RegSelect;
   Read_Reg(1)  <= READ(1) and not RegSelect;
   Read_Tick(0) <= READ(0) and RegSelect;
   Read_Tick(1) <= READ(1) and RegSelect;

   Write_Reg(0)  <= WRITE(0) and not RegSelect;
   Write_Reg(1)  <= WRITE(1) and not RegSelect;
   Write_Tick(0) <= WRITE(0) and RegSelect;
   Write_Tick(1) <= WRITE(1) and RegSelect;

   Inc_Reg  <= INC and not RegSelect;
   Inc_Tick <= INC and RegSelect;
   Dec_Reg  <= DEC and not RegSelect;
   Dec_Tick <= DEC and RegSelect;

Inst_reg: register_16bit_nonswap_inc_dec 

port map (

	CLK		=> CLK,
	RESET_n	=> RESET_n,
	DATAIN	=> DATAIN,
	DATAOUT	=> DataOut_Reg,
	READ 		=> Read_Reg,
	WRITE 	=> Write_Reg,
   INC      => Inc_Reg,
   DEC      => Dec_Reg,
	REGISTER_VALUE => RegValue

);

Inst_tick: register_16bit_nonswap_inc_dec 

port map (

	CLK		=> CLK,
	RESET_n	=> RESET_n,
	DATAIN	=> DATAIN,
	DATAOUT	=> DataOut_Tick,
	READ 		=> Read_Tick,
	WRITE 	=> Write_Tick,
   INC      => Inc_Tick,
   DEC      => Dec_Tick,
	REGISTER_VALUE => TickValue

);

DATAOUT 			<= DataOut_Reg or DataOut_Tick;

   process (RegValue,TickValue,RegSelect)
   begin
      case (RegSelect) is
         when '0'    => REGISTER_VALUE <= RegValue;
         when others => REGISTER_VALUE <= TickValue;
      end case;
   end process;

end architecture rtl;