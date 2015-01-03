--just an idea, but when we see a nop, that means we want to fetch, right?
--so nop is in fact our fetch instruction... ?

--and our fetch req is really just a CS to the data buffer...
--but could be problems when data doesn't arrive.

--The fetch an be stripped right down to a memory now.
--Ie Bytecode is address, Microcode is data out.

--Infact a smart way to code it would be to have the 
--memory file external.

--Some random comment...

architecture rtl of simple_fetch is

type T_instruction_names is (	
	LDB,	LDC,	LDD,	LDE,	LDH,	LDL,	LDA,
	ADDB,	ADDC,	ADDD,	ADDE,	ADDH,	ADDL,	ADDA,
	ADDAN,
	NOP
);

type T_Instruction_Record is record
	ByteID		: std_logic_vector (7 downto 0);
	Mask			: std_logic_vector (7 downto 0);
	NoOfBytes	: std_logic_vector (1 downto 0); --the number of following bytes for this instruction.
end record T_Instruction_Record;

type T_Instruction_Array is array (T_instruction_names range <>) of T_Instruction_Record;

constant K_Instruction_Array : T_Instruction_Array := (
--	name, 	ID,			Mask
	LDB	=>	"00000110", "01"), --LD <<<---------- UR HERE FIGUER OUT HOW TO HANDLE MICROCODE
	LDC	=>	"00001110", "01"), --LD
	LDD	=>	"00010110", "01"), --LD
	LDE	=>	"00011110", "01"), --LD
	LDH	=>	"00100110", "01"), --LD
	LDL	=>	"00101110", "01"), --LD
	LDA	=>	"00111110", "01"), --LD

	ADDB	=>	"10000000",	"00")	--ADD
	ADDC	=>	"10000001", "00")	--ADD
	ADDD	=>	"10000010", "00")	--ADD
	ADDE	=>	"10000011", "00")	--ADD
	ADDH	=>	"10000100", "00")	--ADD
	ADDL	=>	"10000101", "00")	--ADD
	ADDA	=>	"10000111", "00")	--ADD

	ADDAN	=>	"11000110",	"00")	--ADD

	NOP	=>	"00000000", "00")	--NOP
);

begin

--apply the mask, if the result equals the instruction ID
--this is done as a clocked process at the moment, not sure
--if thats the fastest way.
	process (CLOCK, RESET_n)
	begin
		if RESET_n = '0' then
			INST_ID <= NOP;
		elsif CLOCK'event and CLOCK='1' then
			for i in T_instruction_names'range loop
				if  (K_Instruction_Array(i, Mask) and instruction_register) = K_Instruction_Array(i, ByteID) then
					INST_ID <= T_instruction_names(i) 
				end if;
			end loop;
		end if;
	end process;
			
end generate;

--Now we've ID'd our instruction, what do we do with it?
--first build a state machine for the fetching, counting
--off the bytes required for a fetched Bytecode.
process (CLOCK, RESET_n)
begin
	if RESET_n = '0' then
		fetch_state <= S_RESET;
	elsif CLOCK'event and CLOCK='1' then
		fetch_state <= next_fetch_state;
	end if;
end process;

Fetch_Req <= '1' when 

process (fetch_state)
begin

case (fetch_state)
	when S_RESET => next_fetch_state <= S_FETCH_BYTE_ONE;
	when S_FETCH_BYTE_ONE =>
		if fetch_ack = '1' then
			next_fetch_state <= S_FETCH_BYTE_N;
		end if;
	when S_FETCH_BYTE_N =>
		if fetch_ack = '1' and Fetch_Byte_Counter = 0 then
			next_fetch_state <= S_EXECUTE;
		end if;
	when S_EXECUTE =>
		if end_execute = '1' then		--not too sure about this condition...
			next_fetch_state <= S_FETCH_BYTE_ONE;
		end if;
	when others => next_fetch_state <= S_FETCH_BYTE_ONE;
end case;
end process;


--This process decrements the byte-in counter when fetching from memory.	
process (CLOCK, RESET_n)
begin
	if RESET_n = '0' then
		Fetch_Byte_Counter <= 0;
	elsif CLOCK'event and CLOCK = '1' then
		if fetch_state = S_FETCH_BYTE_ONE then
			Fetch_Byte_Counter <= K_Instruction_Array(INST_ID, NoOfBytes);
		elsif fetch_state = S_FETCH_BYTE_N then
			Fetch_Byte_Counter <= Fetch_Byte_Counter - 1;
		end if;
	end if;
end process;

process (CLOCK, RESET_n)
begin
	if RESET_n = '0' then
		MicroCode <= (others => '0'); --need to check if this really is a good value
	elsif CLOCK'event and CLOCK='1' then
		MicroCode
end process;

end architecture rtl;