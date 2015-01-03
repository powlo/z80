
--For the addressbus, we need to add the ability to 
--index from the databus too. Can probably just do
--an enable to the databus, and then an adder onto the
--addresssbus, to form an addressbus 'plus'

--Need to add Ipage to list of inputs to mux...

--Need to reorganise the Special Purpose Register block
--so that BC,DE, HL are NOT inputs, since they are just 
--flushed right back out.

architecture rtl of AddressControl is

begin

process (CONTROL,BC_REG,DE_REG,HL_REG,PC_REG,SP_REG,IX_REG,IY_REG,TT_REG)
begin
	case CONTROL is
	when BC => ADDRESS <= BC_REG;
	when DE => ADDRESS <= DE_REG;
	when HL => ADDRESS <= HL_REG;
	when PC => ADDRESS <= PC_REG;
	when SP => ADDRESS <= SP_REG;
	when IX => ADDRESS <= IX_REG;
	when IY => ADDRESS <= IY_REG;
	when TT => ADDRESS <= TT_REG;
	when others   => ADDRESS <= (others => '0');
	end case;
end process;

REFRESH_ADDRESS <= IPAGE_REG & REFRESH_REG;

end rtl;