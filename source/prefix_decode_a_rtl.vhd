--this is the block which decodes prefix opcodes
--DD,CB,ED,FD

    architecture rtl of prefix_decode is
   
      signal Escape_Code_Int : T_ESCAPE;
   
   begin
   
       process (CLK, RESET_n)
      begin
         if RESET_n = '0' then
            Escape_Code_Int <= NONE;
         elsif CLK'event and CLK='1' then
            if INSTRUCTION = ESC_DD then
               Escape_Code_int <= DD;
            elsif INSTRUCTION = ESC_ED then
               Escape_Code_int <= ED;
            elsif INSTRUCTION = ESC_FD then
               Escape_Code_int <= FD;
            elsif INSTRUCTION = ESC_CB then
               if Escape_Code_int = DD then
                  Escape_Code_int <= DDCB;
               elsif Escape_Code_int = FD then
                  Escape_Code_int <= FDCB;
               else Escape_Code_int <= CB;
               end if;
            elsif INSTRUCTION = FETCH or
                  INSTRUCTION = LD_bIXdb_H5 or 
                  INSTRUCTION = LD_bIXdb_L5 or
                  INSTRUCTION = LD_H_bIXdb5 or 
                  INSTRUCTION = LD_L_bIXdb5 then 
               Escape_Code_int <= NONE;
            end if;
         end if;
      end process;
   
      ESCAPE_CODE <= Escape_Code_Int;
     	   
   end architecture rtl;