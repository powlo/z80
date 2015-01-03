--This is a beginner testbench to test the Z80
library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

    entity Z80_tb is
   end entity Z80_tb;

library IEEE;
   use IEEE.STD_LOGIC_ARITH.ALL;
   use IEEE.STD_LOGIC_UNSIGNED.ALL;
   use work.Z80_synth_pak.ALL;

    architecture v2 of Z80_tb is
   
      component Z80 is
         port (
         CLK		: IN    std_logic;
         RESET_n	: IN    std_logic;
         ADDRESS	: OUT   std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
         DATA		: INOUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
         M1_n		: OUT   std_logic;
         MREQ_n	: OUT   std_logic;
         IOREQ_n	: OUT   std_logic;
         RD_n		: OUT   std_logic;
         WR_n		: OUT   std_logic;
         RFSH_n	: OUT   std_logic;
         HALT_n	: OUT   std_logic;
         WAIT_n	: IN    std_logic;
         INT_n		: IN    std_logic;
         NMI_n		: IN    std_logic;
         BUSREQ_n	: IN    std_logic;
         BUSACK_n	: OUT   std_logic
         );
      end component Z80;
   
      component Z80_ram is
         generic (file_name   : string;
         G_DEBUG     : boolean   );
         port (
         
         RESET_n	: IN 		std_logic;
         Rd_n		: IN 		std_logic;
         WR_n		: IN 		std_logic;
         MReq_n	: IN 		std_logic;
         Address	: IN 		std_logic_vector(15 downto 0);
         Data		: INOUT 	std_logic_vector (7 downto 0)
         );
      
      end component Z80_ram;
   
      component Z80_IO is
         port (
         
         RESET_n	: IN 		std_logic;
         IOReq_n	: IN 		std_logic;
         Rd_n	   : IN 		std_logic;
         Wr_n	   : IN 		std_logic;
         Wait_n   : OUT		std_logic;
         Address	: IN 		std_logic_vector(7 downto 0);
         Data		: INOUT 	std_logic_vector (7 downto 0)
         );
      
      end component Z80_IO;
   
   component Z80_Counter is
   port (
   	CLK         : IN     std_logic;
   	RESET_n     : IN  	std_logic;
   	
   	CE_n        : IN     std_logic;
   	M1_n        : IN 	 	std_logic;
   	MREQ_n      : IN 	 	std_logic;
   	IOREQ_n     : IN     std_logic;
   	Address     : IN     std_logic_vector(15 downto 0);
   	Data        : INOUT  std_logic_vector (7 downto 0);
   	Rd_n        : IN 	 	std_logic;
   	WR_n        : IN     std_logic;
   	
   	IEI         : IN     std_logic;
   	IEO         : OUT    std_logic;
   	INT_n       : OUT    std_logic;
   	NMI_n       : OUT    std_logic
   	);

   end component Z80_Counter;

   
      signal Clk			: std_logic;
      signal Reset_n		: std_logic;
      signal Address		: std_logic_vector (15 downto 0);
      signal Address_IO	: std_logic_vector (7 downto 0);
      signal Data			: std_logic_vector (7 downto 0);
      signal M1_n			: std_logic;
      signal MReq_n		: std_logic;
      signal IOReq_n		: std_logic;
      signal RD_n			: std_logic;
      signal WR_n			: std_logic;
      signal Rfsh_n		: std_logic;
      signal Halt_n		: std_logic;
      signal Wait_n		: std_logic;
      signal Int_n		: std_logic;
      signal Nmi_n		: std_logic;
      signal BusReq_n	: std_logic;
      signal BusAck_n	: std_logic;
      signal Counter1_CE_n	: std_logic;
      signal Counter2_CE_n	: std_logic;
      signal Counter3_CE_n	: std_logic;
      signal IEI_high	: std_logic;
      signal IEO_Counter1	: std_logic;
      signal IEO_Counter2	: std_logic;
      signal IEO_Counter3	: std_logic;
      signal Cycle_Count	: integer;
      signal Int_Count		: integer;
   
   begin
   
      Address_IO <= Address(7 downto 0);
   
      INST_Z80 : Z80
            port map (
            CLK		=> Clk,
            RESET_n	=> Reset_n,
            ADDRESS	=> Address,
            DATA		=> Data,
            M1_n		=> M1_n,
            MREQ_n	=> MReq_n,
            IOREQ_n	=> IOREQ_n,
            RD_n		=> Rd_n,
            WR_n		=> Wr_n,
            RFSH_n	=> Rfsh_n,
            HALT_n	=> Halt_n,
            WAIT_n	=> Wait_n,
            INT_n		=> Int_n,
            NMI_n		=> Nmi_n,
            BUSREQ_n	=> BusReq_n,
            BUSACK_n	=> BusAck_n
            );
   
      INST_RAM : Z80_ram 
            generic map (
            file_name => "ram.txt",
            G_DEBUG => true)
            port map (
            
            RESET_n	=> RESET_n,
            Rd_n		=> Rd_n,
            WR_n		=> WR_n,
            MReq_n	=> MReq_n,
            Address	=> Address,
            Data		=> Data
            );
   
Counter1_CE_n <= IOREQ_n when Address(7 downto 4) = X"0" else '1';
Counter2_CE_n <= IOREQ_n when Address(7 downto 4) = X"1" else '1';
Counter3_CE_n <= IOREQ_n when Address(7 downto 4) = X"2" else '1';

IEI_high <= '1';
   
   INST_Counter1 : Z80_Counter
   port map (
   	CLK      => CLK,
   	RESET_n  => RESET_n,
   	
   	CE_n     => Counter1_CE_n,
   	M1_n     => M1_n,
   	MREQ_n	=> MREQ_n,
   	IOREQ_n	=> IOREQ_n,
   	Address	=> Address,
   	Data     => Data,
   	Rd_n     => Rd_n,
   	WR_n     => WR_n,
   	
   	IEI      => IEI_high,
   	IEO      => IEO_Counter1,
   	INT_n    => INT_n,
   	NMI_n    => NMI_n
   	);
   
   INST_Counter2 : Z80_Counter
   port map (
   	CLK      => CLK,
   	RESET_n  => RESET_n,
   	
   	CE_n     => Counter2_CE_n,
   	M1_n     => M1_n,
   	IOREQ_n	=> IOREQ_n,
   	MREQ_n	=> MREQ_n,
   	Address	=> Address,
   	Data     => Data,
   	Rd_n     => Rd_n,
   	WR_n     => WR_n,
   	
   	IEI      => IEO_Counter1,
   	IEO      => IEO_Counter2,
   	INT_n    => INT_n,
   	NMI_n    => NMI_n
   	);
   
   INST_Counter3 : Z80_Counter
   port map (
   	CLK      => CLK,
   	RESET_n  => RESET_n,
   	
   	CE_n     => Counter3_CE_n,
   	M1_n     => M1_n,
   	IOREQ_n	=> IOREQ_n,
   	MREQ_n	=> MREQ_n,
   	Address	=> Address,
   	Data     => Data,
   	Rd_n     => Rd_n,
   	WR_n     => WR_n,
   	
   	IEI      => IEO_Counter2,
   	IEO      => IEO_Counter3,
   	INT_n    => INT_n,
   	NMI_n    => NMI_n
   	);
   
   --Clock generating process.
       process
      begin
         Clk <= '1';
         Wait for 2 ns;
         Clk <= '0';
         wait for 2 ns;
      end process;
   
   --a reset process
       process
      begin
      --Reset
         Reset_n <= '0';
         wait until Clk'event and Clk = '1';--two clock cycles.
         wait until Clk'event and Clk = '1';
         wait until Clk'event and Clk = '1';
         Reset_n <= '1';
         wait;
      end process;
   
   
   --Fudge method to test BusReq/Ack
       process (Clk, Reset_n)
      begin
         if Reset_n = '0' then
            Cycle_Count <= 0;
         elsif Clk'event and Clk='1' then
            Cycle_Count <= Cycle_Count + 1;
         end if;
      end process;
   
       process
      begin
         BusReq_n <= '1';
         wait until Cycle_Count = 200;
         BusReq_n <= '0';
         wait until BusAck_n = '0';
         wait for 20 ns;
         BusReq_n <= '1';
         wait;
      end process;
   
   --fudge method to generate an interrupt.
       process (Clk, Reset_n)
      begin
         if Reset_n = '0' then
            Int_Count <= 0;
         elsif Clk'event and Clk='1' then
            Int_Count <= Int_Count + 1;
         end if;
      end process;
   
   --Dummy since no IOs are connected.
   Wait_n <= '1';
   
   end architecture v2;