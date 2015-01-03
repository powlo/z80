--File architecture for the ALU Core
--
--and associated logic.
--logic
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--For the ADDER we need to build it from the bottom up.
    architecture rtl of ALU_core is
   
      signal ALU_Result  : std_logic_vector (7 downto 0);
      signal C           : std_logic_vector (7 downto 0);
      signal ADD_Result  : std_logic_vector (7 downto 0);
      signal And_Result  : std_logic_vector (7 downto 0);
      signal Or_Result   : std_logic_vector (7 downto 0);
      signal Xor_Result  : std_logic_vector (7 downto 0);
      signal RLC_Result  : std_logic_vector (7 downto 0);
      signal RL_Result   : std_logic_vector (7 downto 0);
      signal RRC_Result  : std_logic_vector (7 downto 0);
      signal RR_Result   : std_logic_vector (7 downto 0);
      signal SLA_Result  : std_logic_vector (7 downto 0);
      signal SRA_Result  : std_logic_vector (7 downto 0);
      signal SRL_Result  : std_logic_vector (7 downto 0);
      signal SLL_Result  : std_logic_vector (7 downto 0);
      signal LBLB_Result : std_logic_vector (7 downto 0);
      signal HBHB_Result : std_logic_vector (7 downto 0);
      signal LBHB_Result : std_logic_vector (7 downto 0);
      signal HBLB_Result : std_logic_vector (7 downto 0);
      signal ADD_Carry   : std_logic_vector (7 downto 0);
      signal Op1_l       : std_logic_vector (3 downto 0);
      signal Op1_h       : std_logic_vector (3 downto 0);
      signal DAA_l       : std_logic_vector (3 downto 0);
      signal DAA_h       : std_logic_vector (3 downto 0);
   
      signal Op1_l_alpha : std_logic;
      signal Op1_h_alpha : std_logic;
          
      signal True_Cin   : std_logic;
   
      signal S_Out      : std_logic;
      signal Z_Out      : std_logic;
      signal H_Out      : std_logic;
      signal PV_Out     : std_logic;
      signal N_Out      : std_logic;
      signal C_Out      : std_logic;
   
      signal S_In       : std_logic;
      signal Z_In       : std_logic;
      signal H_In       : std_logic;
      signal PV_In      : std_logic;
      signal N_In       : std_logic;
      signal C_In       : std_logic;
      signal EC_In      : std_logic;
   
      signal Arith_Carry      : std_logic;
      signal Arith_HalfCarry  : std_logic;
   
      signal notused1         : std_logic;
      signal notused2         : std_logic;
   
   begin
   
      EC_In <= '0' when (ESCAPE = DD) or (ESCAPE = FD) 
               or (ESCAPE = DDCB) or (ESCAPE = FDCB) else '1';
      
      True_Cin   <= C_In when   
         COMMAND = ADDC or 
         COMMAND = SUBC else '0';
   
   --Code to generate the value to add in case of DAA command
      Op1_l  <= Op1(3 downto 0);
      Op1_h <= Op1(7 downto 4);
   
      Op1_l_alpha <= '1' when Op1_l = X"A" or Op1_l = X"B" or
            Op1_l = X"C" or Op1_l = X"D" or Op1_l = X"E" or
            Op1_l = X"F" else '0';
            
      Op1_h_alpha <= '1' when Op1_h = X"A" or Op1_h = X"B" or
            Op1_h = X"C" or Op1_h = X"D" or Op1_h = X"E" or
            Op1_h = X"F" else '0';           
      
      DAA_l <= X"6" when Op1_l_alpha = '1' or H_In = '1' else X"0";
      
      DAA_h <= X"6" when Op1_h_alpha = '1' or 
                        (Op1_l_alpha = '1' and Op1_h = X"9") or 
                        C_In = '1' else X"0";
   
      DAA <= DAA_h & DAA_l;
   
   --When we are performing a subtract, we keep the
   --same addition logic, just invert the A register
   --available to carry logic.
      
       process (COMMAND, OP1)
      begin
         case COMMAND is
            when SUB | SUBC =>
               C <= not OP1;
            when others =>
               C <= OP1;
         end case;
      end process;
   
   Gen_Add_Result: 
      for i in 7 downto 0 generate
      Gen_First_Result: 
         if i = 0 generate
             process (True_Cin, OP1(i), OP2(i))
            begin
               if True_Cin = '0' then
                  ADD_Result(0) <= OP1(0) xor OP2(0);
               else
                  ADD_Result(0) <= OP1(0) xnor OP2(0);
               end if;
            end process;
         end generate Gen_First_Result;
      Gen_Other_Results: 
         if i /= 0 generate
             process (ADD_Carry(i-1), OP1(i), OP2(i))
            begin
               if ADD_Carry(i-1) = '0' then
                  ADD_Result(i) <= OP1(i) xor OP2(i);
               else
                  ADD_Result(i) <= OP1(i) xnor OP2(i);
               end if;
            end process;
         end generate Gen_Other_Results;
      end generate Gen_Add_Result;
   
   Gen_ADD_Carry: 
      for i in 7 downto 0 generate
      Gen_First_Carry: 
         if i = 0 generate
             process (True_Cin, C(i), OP2(i))
            begin
               if True_Cin = '0' then
                  ADD_Carry(0) <= C(0) and OP2(0);
               else
                  ADD_Carry(0) <= C(0) or OP2(0);
               end if;
            end process;
         end generate Gen_First_Carry;
      Gen_Other_Carries: 
         if i /= 0 generate
             process (ADD_Carry(i-1), C(i), OP2(i))
            begin
               if ADD_Carry(i-1) = '0' then
                  ADD_Carry(i) <= C(i) and OP2(i);
               else
                  ADD_Carry(i) <= C(i) or OP2(i);
               end if;
            end process;
         end generate Gen_Other_Carries;
      end generate Gen_ADD_Carry;
   
      And_Result  <= OP1 AND OP2;
      Or_Result   <= OP1 OR OP2;
      Xor_Result  <= OP1 XOR OP2;
      RLC_Result  <= OP2(6 downto 0) & OP2(7);
      RL_Result   <= OP2(6 downto 0) & C_In;
      RRC_Result  <= OP2(0) & OP2(7 downto 1);
      RR_Result   <= C_In & OP2(7 downto 1);
      SLA_Result  <= OP2(6 downto 0) & '0';
      SRA_Result  <= OP2(7) & OP2(7 downto 1);
      SRL_Result  <= '0' & OP2(7 downto 1);
      SLL_Result  <= OP2(6 downto 0) & '1';
      LBLB_Result <= OP1(3 downto 0) & OP2(3 downto 0);
      HBHB_Result <= OP1(7 downto 4) & OP2(7 downto 4);
      HBLB_Result <= OP1(7 downto 4) & OP2(3 downto 0);
      LBHB_Result <= OP1(3 downto 0) & OP2(7 downto 4);
   
       process (COMMAND, OP2, ADD_Result,And_Result,Or_Result,Xor_Result,
                RLC_Result,RL_Result,RRC_Result,RR_Result,SLA_Result,SRA_Result,
                SLL_Result,SRL_Result, LBLB_Result, HBHB_Result, HBLB_Result, LBHB_Result )
      begin
         case (COMMAND) is
            when ADD | ADDC | SUB | SUBC
                        => ALU_Result <= ADD_Result;
            when ANDD   => ALU_Result <= And_Result;
            when ORR    => ALU_Result <= Or_Result;
            when XORR   => ALU_Result <= Xor_Result;
            when RLC    => ALU_Result <= RLC_Result;
            when RL     => ALU_Result <= RL_Result;
            when RRC    => ALU_Result <= RRC_Result;
            when RR     => ALU_Result <= RR_Result;
            when SLAA   => ALU_Result <= SLA_Result;
            when SRAA   => ALU_Result <= SRA_Result;
            when SRLL   => ALU_Result <= SRL_Result;
            when SLLL   => ALU_Result <= SLL_Result;
            when LBLB   => ALU_Result <= LBLB_Result;
            when HBHB   => ALU_Result <= HBHB_Result;
            when LBHB   => ALU_Result <= LBHB_Result;
            when HBLB   => ALU_Result <= HBLB_Result;
            when IFF|PV_BC => ALU_Result <= OP2;
            when others    => ALU_Result <= (others => '0');
         end case;
      end process;
   
   --Now sort out the flag register.
   
      Arith_Carry <= ADD_Carry(7);
      Arith_HalfCarry <= ADD_Carry(3);
   
   --Control Carry (C) Flag
       process (COMMAND, OP2, Arith_Carry, C_In)
      begin
         case COMMAND is
            when  ADD | ADDC | SUB | SUBC
                     => C_Out <= Arith_Carry;
            when RL | RLC | SLAA
                     => C_Out <= OP2(7);
            when RR | RRC | SRLL | SRAA
                     => C_Out <= OP2(0);
            when others => C_Out <= '0';
         end case;
      end process;
   
   --Control Half Carry (H) Flag   
       process (COMMAND, Arith_HalfCarry)
      begin
         case (COMMAND) is 
            when ADD | ADDC | SUB | SUBC
                      => H_Out <= Arith_HalfCarry;
            when ANDD => H_Out <= '1';
            when others => H_Out <= '0';
         end case;
      end process;
   
   --Control negative operator (N) Flag   
       process (COMMAND)
      begin
         case (COMMAND) is 
            when SUB | SUBC
                     => N_Out <= '1';
            when others => N_Out <= '0';
         end case;
      end process;
   
   --Control Zero result (Z) Flag   
      Z_Out <= not Or_bits(ALU_Result);
   
   --Control Parity / oVerflow (PV) Flag   
       process (COMMAND,ADD_Carry,ALU_Result,IFF2,BC_NZ)
      begin
         case (COMMAND) is 
            when ADD | ADDC | SUB | SUBC  
                  => PV_Out <= ADD_Carry(7) xor ADD_Carry(6);
            when IFF => PV_Out <= IFF2;
            when PV_BC  => PV_Out <= BC_NZ;
            when others => PV_Out <= not Xor_bits(ALU_Result);
         end case;
      end process;
   
   --Control Result Sign (S) Flag      
      S_Out <= ALU_Result(7);
      
   --Test instructions
       process (COMMAND,Z_In,C_In,PV_In,S_In,N_In,EC_In)
      begin
         case (COMMAND) is
            when TST_NZ	=> CONDITION <= not Z_In;
            when TST_Z  => CONDITION <= Z_In;
            when TST_NC => CONDITION <= not C_In;
            when TST_C  => CONDITION <= C_In;
            when TST_PO	=> CONDITION <= not PV_In;
            when TST_PE => CONDITION <= PV_In;
            when TST_P  => CONDITION <= not S_In;
            when TST_M  => CONDITION <= S_In;
            when TST_N  => CONDITION <= N_In;
            when TST_EC => CONDITION <= EC_In;
            when others => CONDITION <= '1';
         end case;
      end process;
   
   
      (S_In, Z_In, notused1, H_In, notused2, PV_In, N_In, C_In) <= FIN;
      FOUT <= (S_Out, Z_Out, '0', H_Out, '0', PV_Out, N_Out, C_Out);
   
      RESULT <= ALU_Result;
   
   end architecture rtl;
