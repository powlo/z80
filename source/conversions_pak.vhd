--This package contains some conversions required 
--during testbenching.
library IEEE;
use IEEE.std_logic_1164.all;

package CONVERSIONS is

function lower_case(c : character) return character;

function CharToSLV (C : in character) return std_logic_vector;

function StringToSLV ( S : in string) return std_logic_vector;

function CharToInteger ( c : in character) return integer;

function StringToInteger ( S : in string) return integer;

end package CONVERSIONS;

package body CONVERSIONS is

	function lower_case(c : character) return character is

	begin

		if c >= 'A' and c <= 'Z' then
			return character'val(character'pos(c) + 32);
		else return c;
		end if;
	end;


function CharToSLV (C : in character) return std_logic_vector is

begin

	case (lower_case(C)) is
		when '0' => return "0000";
		when '1' => return "0001";
		when '2' => return "0010";
		when '3' => return "0011";
		when '4' => return "0100";
		when '5' => return "0101";
		when '6' => return "0110";
		when '7' => return "0111";
		when '8' => return "1000";
		when '9' => return "1001";
		when 'a' => return "1010";
		when 'b' => return "1011";
		when 'c' => return "1100";
		when 'd' => return "1101";
		when 'e' => return "1110";
		when 'f' => return "1111";
		when others => return "UUUU";
		end case;
end function CharToSLV;

function CharToInteger (C : in character) return Integer is

begin

	case (lower_case(C)) is
		when '0' => return 0;
		when '1' => return 1;
		when '2' => return 2;
		when '3' => return 3;
		when '4' => return 4;
		when '5' => return 5;
		when '6' => return 6;
		when '7' => return 7;
		when '8' => return 8;
		when '9' => return 9;
      when 'a' => return 10;
      when 'b' => return 11;
      when 'c' => return 12;
      when 'd' => return 13;
      when 'e' => return 14;
      when 'f' => return 15;
		when others => return 0;
		end case;
end function CharToInteger;

function StringToSLV (S : in string) return std_logic_vector is
--This function converts a HEX string to a Std Logic vector

variable vector : std_logic_vector((((S'high-S'low+1)*4)-1) downto 0);

begin

	for i in S'reverse_range loop
		vector((((S'high-i+1)*4)-1) downto ((S'high-i)*4)) := CharToSLV(S(i));
	end loop;

	return vector;
end function StringToSLV;

function StringToInteger (S : in string) return Integer is
--This function converts a HEX string into an integer.

variable ThisInt : Integer := 0;

begin

	for i in S'range loop
      ThisInt := ThisInt*16 + CharToInteger(S(i));
	end loop;

	return ThisInt;
end function StringToInteger;

end package body CONVERSIONS;

