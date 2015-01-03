--This package contains some conversions required 
--during testbenching.
library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.NUMERIC_STD.ALL;
   use IEEE.STD_LOGIC_arith.ALL;
   use IEEE.STD_LOGIC_unsigned.ALL;
   use IEEE.STD_LOGIC_TEXTIO.ALL;

library STD;
   use STD.TEXTIO.ALL;
	
library WORK;
   use WORK.CONVERSIONS.ALL;

    package TB_FUNCTIONS is
   
      type T_RAM_64K is array (0 to 2**16-1) of std_logic_vector(7 downto 0);
      type T_RAM_256 is array (0 to 2**8-1) of std_logic_vector(7 downto 0);

      type IntelRecord is record 
            Marker    : character;
            ByteCount : Integer range 0 to 255;
            Address   : string (1 to 4);
            RType     : string (1 to 2);
            Data      : string (1 to 510);
            Checksum  : string (1 to 2);
         end record;
            
       procedure READ (L: inout LINE; VALUE : out IntelRecord; GOOD : out boolean);
       procedure READ (L: inout LINE; VALUE : out IntelRecord);

       impure function load_memory_ddt(
	       constant file_name	: in string;
	       constant debug 		: in boolean ) return T_RAM_64K;
   
       impure function load_memory_intel(
	       constant file_name	: in string;
	       constant debug 		: in boolean ) return T_RAM_64K;

       impure function load_memory_motorola(
	       constant file_name	: in string;
	       constant debug 		: in boolean ) return T_RAM_64K;
       
   end package TB_FUNCTIONS;

    package body TB_FUNCTIONS is
   
        procedure READ (L: inout LINE; VALUE : out IntelRecord; GOOD : out boolean) is

        variable   ByteCountString : string(1 to 2);
        variable   RTypeString     : string(1 to 2);
        variable   AddressString   : string(1 to 4);
        variable   DataString      : string(1 to 510);
        variable   CheckSumString  : string(1 to 2);
        variable   ByteCountInt  		: Integer range 0 to 255;
        variable   Total           : std_logic_vector (7 downto 0) := (others => '0');
        
        begin           
            READ (L, VALUE.Marker);
            READ (L, ByteCountString);
            ByteCountInt := StringToInteger(ByteCountString);
            READ (L, AddressString);
            READ (L, RTypeString);
            if ByteCountString /= "00" then               --protect against zero value.
               READ (L, DataString(1 to 2*ByteCountInt));
            else
               DataString(1 to 2) := "00";
            end if;
            READ (L, ChecksumString);
            
            
            Total := StringToSLV (ByteCountString) + StringToSLV (AddressString(1 to 2)) +
                     StringToSLV (AddressString(3 to 4)) + StringToSLV (RTypeString);

            if ByteCountString /= "00" then
               for i in 1 to StringToInteger (ByteCountString) loop
                  Total := Total + StringToSLV (DataString((i*2)-1 to i*2));
               end loop;
            end if;
            Total := Total + StringToSLV (ChecksumString);
            
            if Total = X"00" then
               GOOD := TRUE;
            else GOOD := FALSE;
            end if;
                                 
            VALUE.ByteCount := ByteCountInt;
            VALUE.RType     := RTypeString;
            VALUE.Address   := AddressString;
            VALUE.Data      := DataString;
            VALUE.Checksum  := CheckSumString;
            
      end procedure READ;

        procedure READ (L: inout LINE; VALUE : out IntelRecord) is

        variable   Good : boolean;
        
        begin           
            READ (L, VALUE, Good);
      	assert Good
	    report "Checksum validation failed for Intel record!"
	    severity error;
      end procedure READ;

       impure function load_memory_ddt(
			constant file_name	: in string;
			constant debug 		: in boolean ) return T_RAM_64K is
      
         file F_Ram_file : Text open READ_MODE is file_name;
         variable ThisLine : Line;
      
         variable StringAddress	: string(1 to 4);
         variable StringData 		: string(1 to 2);
      
         variable HexAddress	: std_logic_vector(15 downto 0);
         variable HexData		: std_logic_vector(7 downto 0);
      
         variable ThisChar : character;
         variable V_RAM_64K : T_RAM_64K := (others => (others => 'U'));
      
      
      begin
      
         while not ENDFILE(F_Ram_file) loop
            READLINE ( F_Ram_file, ThisLine);
         --if the line contains S... then we set the address
            READ (ThisLine, ThisChar);
         --assuming READ works like a chomp...
            if ThisChar = '.' then					--'.' is an end of file marker
               assert (not debug) report "End of file reached.";
               exit;
            elsif ThisChar = 'S' then					--'S' indicates an address
               assert (not debug) report "The S character was detected";
               READ (ThisLine, StringAddress);
               assert (not debug) report "Address read was " & StringAddress severity note;
               HexAddress := StringToSLV(StringAddress);
            else
               StringData(1) := ThisChar;
               READ (ThisLine, ThisChar);
               StringData(2) := ThisChar;
            
               assert (not debug) report "Data read was " & StringData severity note;
               HexData := StringToSLV(StringData);
            
               V_RAM_64K(conv_integer(HexAddress)) := HexData;
            
            --Some debug stuff since we cant probe with Xilinx tool...
               if debug then
                  WRITE (ThisLine, STRING'("Writing "));
                  WRITE (ThisLine, HexData);
                  WRITE (ThisLine, STRING'(" to address "));
                  WRITE (ThisLine, HexAddress);
                  WRITELINE (OUTPUT, ThisLine);
               end if;
            --end debug code
            
               HexAddress := Conv_Std_Logic_Vector(conv_integer(HexAddress)+1,16); 	--hows that going to work then?
            end if;
         	
         end loop;
      
         return V_RAM_64K;
      
      end function load_memory_ddt;

      impure function load_memory_intel(
			constant file_name	: in string;
			constant debug 		: in boolean ) return T_RAM_64K is
      
         file F_Ram_file : Text open READ_MODE is file_name;
         variable RamFileLine : Line;
         variable DebugLine   : Line;
      
         variable Address	: Integer;
         variable Data  		: std_logic_vector(7 downto 0);
      
         variable ByteCountInt   : Integer;
         
         variable V_RAM_64K : T_RAM_64K := (others => (others => 'U'));
      
         variable V_IntelRecord : Intelrecord;
         
      begin
          
         while not ENDFILE(F_Ram_file) loop
            READLINE ( F_Ram_file, RamFileLine);   --get a line from the file
            READ (RamFileLine, V_IntelRecord);     --Convert the line into an Intel record

            if V_IntelRecord.Marker /= ':' then				--':' is present on all lines of an intel file
               assert (not debug) report "Error non-intel file format!"
               severity error;
               exit;
            end if;

            case (V_IntelRecord.RType) is
            when "01" =>
               assert (not debug) report "Termination record reached"
               severity note;
               exit;

            when "00" =>
               for i in 1 to V_IntelRecord.ByteCount loop
                  Address := StringToInteger(V_IntelRecord.Address)+(i-1);
                  Data    := StringToSLV(V_IntelRecord.Data((i*2)-1 to i*2));
                  V_RAM_64K(Address) := Data;
         
                  if debug then                              --Some usful debug messages
                     WRITE (DebugLine, STRING'("Writing "));
                     WRITE (DebugLine, Data);
                     WRITE (DebugLine, STRING'(" to address "));
                     WRITE (DebugLine, Conv_Std_Logic_Vector(Address,16));
                     WRITELINE (OUTPUT, DebugLine);
                  end if;                                    --end debug code
               end loop;

            when others =>
               assert (not debug) report "Unsupported type detected!";

            end case;                                        --on TypeString
         	
         end loop;                                           --on END_FILE(F_Ram_file)
      
         return V_RAM_64K;
      
      end function load_memory_intel;

     impure function load_memory_motorola(
			constant file_name	: in string;
			constant debug 		: in boolean ) return T_RAM_64K is

         variable V_RAM_64K : T_RAM_64K := (others => (others => 'U'));
			
			 begin
			     return V_RAM_64K;
			     
         end function load_memory_motorola;
   
   end package body TB_FUNCTIONS;

