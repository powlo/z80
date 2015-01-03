--File architecture for memory interface
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the memory interface for the block, currently
--just handles code fetches.

architecture rtl of memory_interface is
   
   type t_mem_state	is (
	S_START,
   S_BUS_ACK,
   S_FETCH,
   S_REFRESH,
   S_REFRESH_2,
   S_MEM_RD, 
	S_MEM_RD_2, 
	S_MEM_WR, 
	S_MEM_WR_2, 
	S_IO_RD,
	S_IO_RD_2, 
	S_IO_RD_3, 
	S_IO_WR,
	S_IO_WR_2,
	S_IO_WR_3,
	S_NMI,
	S_INT,
	S_INT_2,
	S_INT_3
	);
   
   signal mem_state 			: t_mem_state;
   
   signal Mreq_temp1          : std_logic;
   signal Mreq_temp2          : std_logic;
   signal IOreq_temp1			: std_logic;
   signal IOreq_temp2			: std_logic;
   signal Rd_temp1		      : std_logic;
   signal Rd_temp2		      : std_logic;
   signal Wr_temp1		      : std_logic;
   signal Wr_temp2				: std_logic;
   signal WStrobe_temp1       : std_logic;
   signal WStrobe_temp2       : std_logic;
   signal Write_Strobe        : std_logic;
   signal Mreq_refresh1			: std_logic;
   signal MREQ_Fetch				: std_logic;
   signal MREQ_Mem        		: std_logic;
   signal Rd_Fetch        		: std_logic;
   signal Rd_Mem        		: std_logic;
   signal Rd_IO        			: std_logic;
   signal Wr_Mem        		: std_logic;
   signal Wr_IO        			: std_logic;
   signal Wait_Int     			: std_logic;

   signal Fetch_Cycle		: std_logic; 
   signal Bus_Ack_Cycle		: std_logic; 
   signal Refresh_Cycle 	: std_logic;
   signal Mem_Rd_Cycle		: std_logic;			
   signal Mem_Wr_Cycle 		: std_logic;
   signal IO_Rd_Cycle		: std_logic;
	signal IO_Wr_Cycle		: std_logic;
	signal Int_Cycle			: std_logic;
	signal Nmi_Cycle			: std_logic;
   signal Mem_Access 		: std_logic;
   signal IO_Access			: std_logic;
   
   signal Core_DataIn_Latched     : std_logic_vector (7 downto 0);
   signal Core_DataOut_Latched    : std_logic_vector (7 downto 0);
   signal Core_Address_Latched    : std_logic_vector (15 downto 0);
   signal Valid_Address_Latched   : std_logic_vector (15 downto 0);
   signal Refresh_Address_Latched : std_logic_vector (15 downto 0);
   
begin
   
   --We create a state machine to move through the 
   --steps required to fetch code from memory.
   --TODO Need to add the wait condition here.
   process (CLK, RESET_n)
   begin
      if RESET_N = '0' then
         mem_state <= S_START;
      elsif CLK'event and CLK='1' then
         case (mem_state) is
            when S_START =>
               if CORE_TYPE = NMI then
                  mem_state <= S_NMI;
               elsif CORE_TYPE = INT then
                  mem_state <= S_INT;
               elsif CORE_TYPE = FETCH then
                  mem_state <= S_FETCH;
               elsif CORE_TYPE = MEM_RD then
                  mem_state <= S_MEM_RD;
               elsif CORE_TYPE = MEM_WR then
                  mem_state <= S_MEM_WR;
               elsif CORE_TYPE = IO_RD then
                  mem_state <= S_IO_RD;
               elsif CORE_TYPE = IO_WR then
                  mem_state <= S_IO_WR;
               end if;
				when S_NMI =>
					mem_state <= S_REFRESH;
				when S_INT =>
					mem_state <= S_INT_2;
				when S_INT_2 =>
					mem_state <= S_INT_3;
				when S_INT_3 =>
					mem_state <= S_REFRESH;
				when S_BUS_ACK =>
					if BUSREQ_n = '1' then
						mem_state <= S_START;
					end if;
            when S_FETCH =>
               mem_state <= S_REFRESH;
            when S_REFRESH =>
               mem_state <= S_REFRESH_2;
            when S_MEM_RD =>
                  mem_state <= S_MEM_RD_2;
            when S_MEM_RD_2 =>
					if BUSREQ_n = '0' then
						mem_state <= S_BUS_ACK;
               else mem_state <= S_START;
					end if;
            when S_MEM_WR =>
                  mem_state <= S_MEM_WR_2;
            when S_MEM_WR_2 =>
					if BUSREQ_n = '0' then
						mem_state <= S_BUS_ACK;
               else mem_state <= S_START;
					end if;
            when S_IO_RD =>
                  mem_state <= S_IO_RD_2;
            when S_IO_RD_2 =>
               if Wait_int = '1' then
                  mem_state <= S_IO_RD_3;
               end if;
            when S_IO_RD_3 =>
					if BUSREQ_n = '0' then
						mem_state <= S_BUS_ACK;
               else mem_state <= S_START;
					end if;
            when S_IO_WR =>
                  mem_state <= S_IO_WR_2;
            when S_IO_WR_2 =>
               if Wait_int = '1' then
                  mem_state <= S_IO_WR_3;
               end if;
            when S_IO_WR_3 =>
					if BUSREQ_n = '0' then
						mem_state <= S_BUS_ACK;
               else mem_state <= S_START;
					end if;
            when others =>
            mem_state <= S_START;
         end case;
      end if;
   end process;

--Create simple signals to track what we're doing in a cycle
--to simplify processes later on eg if start and core_type = fetch etc.
Bus_Ack_Cycle <= '1' when mem_state = S_BUS_ACK else '0';

Fetch_Cycle <= '1' when mem_state = S_FETCH or 
				(CORE_TYPE = FETCH and mem_state = S_START) else '0';

Nmi_Cycle <= '1' when mem_state = S_NMI or 
				(CORE_TYPE = NMI and mem_state = S_START) else '0';

Refresh_Cycle <= '1' when mem_state = S_REFRESH or mem_state = S_REFRESH_2 else '0';

Mem_Rd_Cycle <= '1' when mem_state = S_MEM_RD or mem_state = S_MEM_RD_2 or
				(CORE_TYPE = MEM_RD and mem_state = S_START) else '0';
				
Mem_Wr_Cycle <= '1' when mem_state = S_MEM_WR or mem_state = S_MEM_WR_2 or
				(CORE_TYPE = MEM_WR and mem_state = S_START) else '0';

IO_Rd_Cycle <= '1' when mem_state = S_IO_RD or mem_state = S_IO_RD_2 or
				mem_state = S_IO_RD_3 or
				(CORE_TYPE = IO_RD and mem_state = S_START) else '0';
				
IO_Wr_Cycle <= '1' when mem_state = S_IO_WR or mem_state = S_IO_WR_2 or
				mem_state = S_IO_WR_3 or
				(CORE_TYPE = IO_WR and mem_state = S_START) else '0';

Int_Cycle <= '1' when mem_state = S_INT or mem_state = S_INT_2 or
				mem_state = S_INT_3 or
				(CORE_TYPE = INT and mem_state = S_START) else '0';

Mem_Access	<= '1' when	Mem_Rd_Cycle = '1' or Mem_Wr_Cycle = '1' else '0';			
IO_Access	<= '1' when	IO_Rd_Cycle = '1' or IO_Wr_Cycle = '1' else '0';

--We latch in the memory access values so that they are kept
--constant across the memory access cycle.				
--NOTE: CORE_RD and CORE_WR are not used here because sometimes
--we initiate accesses in advance of their use, so _RD, _WR will
--not be active, but CORE_TYPE will.
--TODO: Don't like the fact that there is a mux before
--Address out. Need to redesign with a next_mem_state
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         Core_Address_Latched    <= (others => '0');
         Refresh_Address_Latched <= (others => '0');
      elsif CLK'event and CLK='1' then
         if mem_state = S_START then
            Core_Address_Latched    <= CORE_ADDRESS;
            Refresh_Address_Latched <= REFRESH_ADDRESS;
         end if;
      end if;
   end process;

--Core DataIn is clocked in on the negative edge, to be 
--ready to output immediately.
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
			Core_DataIn_Latched		<= (others => '0');
      elsif CLK'event and CLK='0' then
         if mem_state = S_START and CORE_RD = EXTERN then
            Core_DataIn_Latched		<= CORE_DATAIN;
         end if;
      end if;
   end process;

--The WAIT_n signal is sampled on the falling edge
--Explicit tests and assignment because WAIT_n can
--be high impedance.
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
			Wait_int		<= '0';
      elsif CLK'event and CLK='0' then
         if WAIT_n = '0' then
            Wait_int <= '0';
         else Wait_int <= '1';
         end if;
      end if;
   end process;
   
--*********************************************************--
--** 				Generate The Bus Ack Signal					**--
--*********************************************************--

BUSACK_n <= '0' when mem_state = S_BUS_ACK else '1';

--*********************************************************--
--** 				Generate The M1 and REFRESH					**--
--*********************************************************--
   
   M1_n		<= '0'	when (Fetch_Cycle = '1' or 
                           Int_Cycle = '1' or
                           Nmi_Cycle = '1') else '1';       
   RFSH_n	<= '0'	when Refresh_Cycle = '1' else '1';
  
--*********************************************************--
--** 				Generate The MREQ Signal						**--
--*********************************************************--

   Mreq_temp1 <= '0' when	(CORE_TYPE = FETCH and mem_state = S_START) or
									(CORE_TYPE = NMI and mem_state = S_START) or
									(CORE_TYPE = MEM_RD and mem_state = S_START) or
									(CORE_TYPE = MEM_WR and mem_state = S_START) or
									mem_state = S_FETCH or 
									mem_state = S_NMI or 
									mem_state = S_MEM_RD or 
									mem_state = S_MEM_WR else '1';
   
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         Mreq_temp2 <= '1';
      elsif CLK'event and CLK = '0' then
         if (CORE_TYPE = FETCH and mem_state = S_START) or
				(CORE_TYPE = NMI and mem_state = S_START) or
				(CORE_TYPE = MEM_RD and mem_state = S_START) or
				(CORE_TYPE = MEM_WR and mem_state = S_START) or
				mem_state = S_NMI or 
				mem_state = S_FETCH or 
				mem_state = S_MEM_RD or 
				mem_state = S_MEM_WR then 
            Mreq_temp2 <= '0';
         else Mreq_temp2 <= '1';
         end if;
      end if;
   end process;
   
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         Mreq_refresh1 <= '1';
      elsif CLK'event and CLK = '0' then
         if mem_state = S_REFRESH then
            Mreq_refresh1 <= '0';
         else	Mreq_refresh1 <= '1';
         end if;
      end if;
   end process;

MREQ_Fetch <= (Mreq_temp1 or Mreq_temp2) and Mreq_refresh1;
MREQ_Mem	  <= Mreq_temp2;
   
   Proc_gen_mreq: process (Fetch_Cycle, Int_Cycle, Nmi_Cycle, Bus_Ack_Cycle, 
                           Mem_Access, MREQ_Fetch, Mreq_refresh1, MREQ_Mem)
   begin
		if Bus_Ack_Cycle = '1' then
			MREQ_n	<= 'Z';
      elsif Int_Cycle = '1' then
         MREQ_n	<= Mreq_refresh1;
      elsif Nmi_Cycle = '1' then
         MREQ_n	<= MREQ_Fetch;
      elsif Fetch_Cycle = '1' then
         MREQ_n	<= MREQ_Fetch;
      elsif Mem_Access = '1' then
         MREQ_n	<= MREQ_Mem;
      else MREQ_n <= '1';
      end if;
   end process;

--*********************************************************--
--** 				Generate The IOREQ Signal						**--
--*********************************************************--
   IOreq_temp1 <= '0' when	mem_state = S_IO_RD or 
									mem_state = S_IO_RD_2 or 
									mem_state = S_IO_WR or
									mem_state = S_IO_WR_2 or
									mem_state = S_INT_3 else '1';


   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         IOreq_temp2 <= '1';
      elsif CLK'event and CLK = '0' then
         if mem_state = S_IO_RD or 
				mem_state = S_IO_RD_2 or 
				mem_state = S_IO_WR or 
				mem_state = S_IO_WR_2 or 
				mem_state = S_INT_2 then 
            IOreq_temp2 <= '0';
         else IOreq_temp2 <= '1';
         end if;
      end if;
   end process;

	IOREQ_n <= (IOreq_temp1 and IOreq_temp2) 
					when (IO_Access = '1' or Int_Cycle = '1') else
					'Z' when Bus_Ack_Cycle = '1' else '1';

--*********************************************************--
--** 				Generate The RD Signal							**--
--*********************************************************--

   Rd_temp1 <= '0'	when 	(CORE_TYPE = FETCH and mem_state = S_START) or
									(CORE_TYPE = NMI and mem_state = S_START) or
									(CORE_TYPE = MEM_RD and mem_state = S_START) or
									mem_state = S_NMI or 
									mem_state = S_FETCH or 
									mem_state = S_MEM_RD or 
									mem_state = S_IO_RD or
									mem_state = S_IO_RD_2 else '1';
   
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         Rd_temp2 <= '1';
      elsif CLK'event and CLK = '0' then
         if (CORE_TYPE = FETCH and mem_state = S_START) or
				(CORE_TYPE = NMI and mem_state = S_START) or
				(CORE_TYPE = MEM_RD and mem_state = S_START) or
				mem_state = S_NMI or 
				mem_state = S_FETCH or 
				mem_state = S_MEM_RD or 
				mem_state = S_IO_RD or
				mem_state = S_IO_RD_2 then
            Rd_temp2 <= '0';
         else Rd_temp2 <= '1';
         end if;
      end if;
   end process;
   
RD_Fetch <= Rd_temp1 or Rd_temp2;
RD_Mem	<= Rd_temp2;
RD_IO		<= Rd_temp1 and Rd_temp2;
      
   Proc_gen_rd: process (Bus_Ack_Cycle, Fetch_Cycle, Nmi_Cycle, Mem_Rd_Cycle, 
                         IO_Rd_Cycle, RD_Fetch, RD_Mem,RD_IO)
   begin
		if Bus_Ack_Cycle = '1' then
			RD_n	<= 'Z';
      elsif Fetch_Cycle = '1' then
         RD_n	<= RD_Fetch;
       elsif Nmi_Cycle = '1' then
         RD_n	<= RD_Fetch;
      elsif Mem_Rd_Cycle = '1' then
         RD_n	<= RD_Mem;
      elsif IO_Rd_Cycle = '1' then
         RD_n	<= RD_IO;
      else RD_n <= '1';
      end if;
   end process;

--*********************************************************--
--** 				Generate The WR Signal							**--
--*********************************************************--

Wr_temp1 <= '0' when  mem_state = S_IO_WR or mem_state = S_IO_WR_2 else '1';

   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         Wr_temp2 <= '1';
      elsif CLK'event and CLK = '0' then
         if mem_state = S_MEM_WR or mem_state = S_IO_WR or 
				mem_state = S_IO_WR_2 then
            Wr_temp2 <= '0';
         else Wr_temp2 <= '1';
         end if;
      end if;
   end process;

WR_Mem	<= Wr_temp2;
WR_IO		<= Wr_temp1 and Wr_temp2;
   
   Proc_gen_wr: process (Mem_Wr_Cycle, Bus_Ack_Cycle, IO_Wr_Cycle, WR_Mem, WR_IO)
   begin
      if Bus_Ack_Cycle = '1' then
         WR_n	<= 'Z';
      elsif Mem_Wr_Cycle = '1' then
         WR_n	<= WR_Mem;
      elsif IO_Wr_Cycle = '1' then
         WR_n	<= WR_IO;
      else WR_n <= '1';
      end if;
   end process;

--*********************************************************--
--** 				Generate The DATA									**--
--*********************************************************--
--First we need a write strobe to gate the data out.

WStrobe_temp1 <= '0' when Mem_Wr_Cycle = '1' or IO_Wr_Cycle = '1' else '1';

   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         WStrobe_temp2 <= '1';
      elsif CLK'event and CLK = '0' then
         if Mem_Wr_Cycle = '1' or IO_Wr_Cycle = '1' then
            WStrobe_temp2 <= '0';
         else WStrobe_temp2 <= '1';
         end if;
      end if;
   end process;

   Write_Strobe <= WStrobe_temp1 or WStrobe_temp2;

   DATA <= Core_DataIn_Latched when Write_Strobe = '0' else (others => 'Z');
  
--*********************************************************--
--** 				Generate the ADDRESS								**--
--*********************************************************--
   process (mem_state,CORE_ADDRESS,
      Core_Address_Latched,Refresh_Address_Latched )
   begin
      case (mem_state) is
         when S_START =>
            ADDRESS <= CORE_ADDRESS;      
         when S_BUS_ACK =>
            ADDRESS <= (others => 'Z');      
         when S_REFRESH | S_REFRESH_2 =>
               ADDRESS <= Refresh_Address_Latched;
         when others =>
            ADDRESS <= Core_Address_Latched;
      end case;
   end process;
   
--*********************************************************--
--** 				Latch in the Data       						**--
--*********************************************************--
   --Core DataOut is produced resulting from a read request.
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         Core_DataOut_Latched <= (others => '0');
      elsif CLK'event and CLK = '1' then
         if (mem_state = S_FETCH or 
            mem_state = S_NMI or 
            mem_state = S_MEM_RD or 
            mem_state = S_IO_RD_2 or 
            mem_state = S_INT_3 ) then
               Core_DataOut_Latched <= DATA;
         end if;
      end if;
   end process;

   --similar to above we latch in the address we just used
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         Valid_Address_Latched <= (others => '0');
      elsif CLK'event and CLK = '1' then
         if (mem_state = S_FETCH or 
            mem_state = S_NMI or 
            mem_state = S_MEM_RD or 
            mem_state = S_IO_RD_2 or 
            mem_state = S_INT_3 ) then
               Valid_Address_Latched <= Core_Address_Latched;
         end if;
      end if;
   end process;

   --The generation of CORE_DATAOUT is async, as with
   --other registers.
   process (RESET_n, CORE_WR,Core_DataOut_Latched,
         mem_state,Core_Address_Latched,Valid_Address_Latched)
   begin
      if RESET_n = '0' then
         CORE_DATAOUT <= (others => '0');
      elsif ( (Valid_Address_Latched = Core_Address_Latched) or 
            (mem_state = S_FETCH or 
            mem_state = S_NMI or 
            mem_state = S_MEM_RD or 
            mem_state = S_IO_RD_2 or 
            mem_state = S_INT_3 ) ) and CORE_WR = EXTERN then
         CORE_DATAOUT <= Core_DataOut_Latched;
      else CORE_DATAOUT <= (Others => '0');
      end if;
   end process;
   
--*********************************************************--
--** 				Generate the CORE_ACK							**--
--*********************************************************--
   --an Acknowledge is produced for memory access requests.
	--Either we are doing a read access (which may already have been done)
	--or a write access (in which case we need to wait for the begining
	--of the cycle.
   --TODO: Can we not filter out CORE_TYPE here...
   process (mem_state,CORE_TYPE)         
   begin
      if (CORE_TYPE = FETCH and mem_state = S_REFRESH ) or
			(CORE_TYPE = NMI and mem_state = S_REFRESH ) or
			(CORE_TYPE = INT and mem_state = S_INT_3 ) or
			(CORE_TYPE = MEM_RD and mem_state = S_MEM_RD_2 ) or
			(CORE_TYPE = IO_RD and mem_state = S_IO_RD_3 ) or
			(CORE_TYPE = MEM_WR and mem_state = S_START ) or
			(CORE_TYPE = IO_WR and mem_state = S_START ) then
         CORE_ACK <= '1';
      else CORE_ACK <= '0';
      end if;
   end process;
      
end architecture rtl;