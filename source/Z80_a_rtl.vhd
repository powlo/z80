--This is the architecture for the Z80 processor.

    architecture rtl of Z80 is
   
      component gp_core is
         port (
         
         CLK	   	: IN 	std_logic;
         RESET_n  	: IN 	std_logic;
         
         DATAIN   	: IN 	std_logic_vector (7 downto 0);
         DATAOUT  	: OUT std_logic_vector (7 downto 0);
         READ	   	: IN  T_REGISTER_SELECT;	
         WRITE		   : IN  T_REGISTER_SELECT;
         ESCAPE_CODE	: IN 	T_ESCAPE;
         ALU      	: IN 	T_ALU_INSTRUCTION;
         BC_NZ      	: OUT std_logic;
         BC		   	: OUT std_logic_vector (15 downto 0);
         DE		   	: OUT std_logic_vector (15 downto 0);
         HL		   	: OUT std_logic_vector (15 downto 0)
         );
      
      end component gp_core;
   
      component sp_core is
         port (
         
         CLK		: IN 	std_logic;
         RESET_n	: IN 	std_logic;
         
         DATAIN				: IN 	std_logic_vector (7 downto 0);
         DATAOUT				: OUT std_logic_vector (7 downto 0);
         READ					: IN  T_REGISTER_SELECT;		
         WRITE					: IN  T_REGISTER_SELECT;	
         ESCAPE_CODE	      : IN 	T_ESCAPE;
         ALU   				: IN 	T_ALU_INSTRUCTION;	
         IPAGE_REG			: OUT std_logic_vector (7 downto 0);
         REFRESH_REG			: OUT std_logic_vector (7 downto 0);
         PC						: OUT std_logic_vector (15 downto 0);
         SP						: OUT std_logic_vector (15 downto 0);
         IX						: OUT std_logic_vector (15 downto 0);
         IY						: OUT std_logic_vector (15 downto 0);
         TT						: OUT std_logic_vector (15 downto 0)
         );
      
      end component sp_core;
   
      component control is
         port (
         CLK         : IN   std_logic;
         RESET_n     : IN   std_logic;
         DATAIN      : IN   std_logic_vector (K_DATA_WIDTH-1 downto 0);
         DATAOUT     : OUT  std_logic_vector (K_DATA_WIDTH-1 downto 0);
         READ        : OUT  T_REGISTER_SELECT;
         WRITE       : OUT  T_REGISTER_SELECT;
         ESCAPE_CODE : OUT  T_ESCAPE;
         CONDITION   : IN   std_logic;
         CORE_TYPE   : OUT  T_ACCESS;
         CORE_ACK    : IN   std_logic;
         INT_n       : IN   std_logic;
         NMI_n       : IN   std_logic;
         HALT_n      : OUT  std_logic;
         IFF2        : OUT  std_logic;
         FLAG        : OUT  T_REGISTER_SELECT;
         MASK        : OUT  std_logic_vector (7 downto 0);
         ALU         : OUT  T_ALU_INSTRUCTION;
         ALU_GATE    : OUT  T_ALU_INSTRUCTION;
         ADDRESSMUX  : OUT  T_ADDRESS
         );
      end component control;
   
      component AddressControl is
         port (
         
         CONTROL				: IN 	T_ADDRESS;
         BC_REG				: IN std_logic_vector (15 downto 0);
         DE_REG				: IN std_logic_vector (15 downto 0);
         HL_REG				: IN std_logic_vector (15 downto 0);
         PC_REG				: IN std_logic_vector (15 downto 0);
         SP_REG				: IN std_logic_vector (15 downto 0);
         IX_REG				: IN std_logic_vector (15 downto 0);
         IY_REG				: IN std_logic_vector (15 downto 0);
         TT_REG				: IN std_logic_vector (15 downto 0);
         IPAGE_REG			: IN std_logic_vector (7 downto 0);
         REFRESH_REG			: IN std_logic_vector (7 downto 0);
         ADDRESS				: OUT std_logic_vector (15 downto 0);
         REFRESH_ADDRESS	: OUT std_logic_vector (15 downto 0)
         );
      
      end component AddressControl;
   
      component ALU is
      
         port (
         
         CLK       : IN  std_logic;
         RESET_n   : IN  std_logic;
         
         IFF2      : IN  std_logic;
         BC_NZ     : IN  std_logic;
         ESCAPE    : IN  T_ESCAPE;
         COMMAND   : IN  T_ALU_INSTRUCTION;
         READ      : IN  T_REGISTER_SELECT;
         WRITE     : IN  T_REGISTER_SELECT;
         FLAG      : IN  T_REGISTER_SELECT;
         MASK      : IN  std_logic_vector (7 downto 0);
         DATAIN    : IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
         CONDITION : OUT std_logic;
         DATAOUT   : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
         );
      
      end component ALU;
   
      component memory_interface is
         port (
         CLK					: IN		std_logic;
         RESET_n				: IN 		std_logic;
         CORE_TYPE			: IN 		T_ACCESS;
         CORE_RD				: IN 		T_REGISTER_SELECT;	
         CORE_WR				: IN		T_REGISTER_SELECT;	
         CORE_ACK				: OUT 	std_logic;	
         CORE_ADDRESS 		: IN 		std_logic_vector (15 downto 0);
         CORE_DATAIN			: IN  	std_logic_vector (7 downto 0);
         CORE_DATAOUT		: OUT 	std_logic_vector (7 downto 0);
         REFRESH_ADDRESS	: IN 		std_logic_vector (15 downto 0);
         M1_n					: OUT 	std_logic;
         IOREQ_n				: OUT 	std_logic;
         MREQ_n				: OUT 	std_logic;
         RD_n					: OUT 	std_logic;
         WR_n					: OUT 	std_logic;
         Wait_n				: IN   	std_logic;
         BUSREQ_n				: IN 		std_logic;
         BUSACK_n				: OUT 	std_logic;
         RFSH_n				: OUT 	std_logic;
         ADDRESS				: OUT		std_logic_vector (15 downto 0);
         DATA					: INOUT	std_logic_vector (7 downto 0)
         );
      end component memory_interface;
   
      signal ALU_Control	: T_ALU_INSTRUCTION;
      signal ALU_Gate      : T_ALU_INSTRUCTION;
      signal AddressMux		: T_ADDRESS;
   
      signal BC_Reg        : std_logic_vector (15 downto 0);
      signal DE_Reg        : std_logic_vector (15 downto 0);
      signal HL_Reg        : std_logic_vector (15 downto 0);
      signal PC_Reg        : std_logic_vector (15 downto 0);
      signal SP_Reg        : std_logic_vector (15 downto 0);
      signal IX_Reg        : std_logic_vector (15 downto 0);
      signal IY_Reg        : std_logic_vector (15 downto 0);
      signal TT_Reg        : std_logic_vector (15 downto 0);
      signal Ipage_Reg     : std_logic_vector (7 downto 0);
      signal Refresh_Reg	: std_logic_vector (7 downto 0);
   
      signal Condition     : std_logic;
      signal IFF2_sig      : std_logic;
      signal BC_NZ         : std_logic;
      signal Flag_Target   : T_REGISTER_SELECT;
      signal Flag_Mask     : std_logic_vector (7 downto 0);
      signal Escape_Code   : T_ESCAPE;
   
      signal Control_Read	: T_REGISTER_SELECT;
      signal Control_Write	: T_REGISTER_SELECT;
   
      signal DataBus             : std_logic_vector (7 downto 0);
      signal DataBusOut_Control	: std_logic_vector (7 downto 0);
      signal DataBusOut_GP 		: std_logic_vector (7 downto 0);
      signal DataBusOut_SP 		: std_logic_vector (7 downto 0);
      signal DataBusOut_ALU 	   : std_logic_vector (7 downto 0);
      signal DataBusOut_MI			: std_logic_vector (7 downto 0);
   
      signal Core_Type 			   : T_ACCESS;
      signal Core_Ack            : std_logic;
      signal Core_Address 		   : std_logic_vector (15 downto 0);
      signal Refresh_Address	   : std_logic_vector (15 downto 0);
   
   begin
   
      INST_Control: control 
            port map (
            CLK         => CLK,
            RESET_n     => RESET_n,
            DATAIN      => DataBus,
            DATAOUT     => DataBusOut_Control,
            READ        => Control_Read,
            WRITE       => Control_Write,
            ESCAPE_CODE	=> Escape_Code,
            CONDITION	=> Condition,
            CORE_TYPE   => Core_Type,
            CORE_ACK    => Core_Ack,
            INT_n       => INT_n,
            NMI_n       => NMI_n,
            HALT_n      => HALT_n,
            IFF2        => IFF2_sig,
            FLAG        => Flag_Target,
            MASK        => Flag_Mask,
            ALU         => ALU_Control,
            ALU_GATE    => ALU_Gate,
            ADDRESSMUX  => AddressMux
            );
   
      INST_general_purpose_core : gp_core 
            port map (
            
            CLK         => CLK,
            RESET_n     => RESET_n,
            
            DATAIN      => DataBus,
            DATAOUT     => DataBusOut_GP,
            READ        => Control_Read,
            WRITE       => Control_Write,
            ESCAPE_CODE => Escape_Code,
            BC_NZ       => BC_NZ,
            ALU         => ALU_Gate,
            BC          => BC_reg,
            DE          => DE_reg,
            HL          => HL_reg
            );
   
      INST_special_purpose_core : sp_core 
            port map (
            
            CLK         => CLK,
            RESET_n     => RESET_n,
            
            DATAIN      => DataBus,
            DATAOUT     => DataBusOut_SP,
            READ        => Control_Read,
            WRITE       => Control_Write,
            ESCAPE_CODE => Escape_Code,
            ALU         => ALU_Gate,
            IPAGE_REG   => Ipage_reg,
            REFRESH_REG => Refresh_reg,
            PC          => PC_reg,
            SP          => SP_reg,
            IX          => IX_reg,
            IY          => IY_reg,
            TT          => TT_reg
            );
   
      INST_ALU: ALU
            port map (
            
            CLK       => CLK,
            RESET_n   => RESET_n,
            DATAIN    => DataBus,
            DATAOUT   => DataBusOut_ALU,
            IFF2      => IFF2_sig,
            ESCAPE    => Escape_Code,
            BC_NZ     => BC_NZ,
            READ      => Control_Read,
            WRITE     => Control_Write,
            FLAG      => Flag_Target,
            MASK      => Flag_Mask,
            CONDITION => Condition,
            COMMAND   => ALU_Control
            
            );
   
      INST_Address_Control : AddressControl
            port map (
            
            CONTROL			     	=> AddressMux,
            BC_REG				      => BC_Reg,
            DE_REG				      => DE_Reg,
            HL_REG				      => HL_Reg,
            PC_REG				      => PC_Reg,
            SP_REG				      => SP_Reg,
            IX_REG				      => IX_Reg,
            IY_REG				      => IY_Reg,
            TT_REG				      => TT_Reg,
            IPAGE_REG			    => Ipage_Reg,
            REFRESH_REG			  => Refresh_Reg,
            ADDRESS				     => Core_Address,
            REFRESH_ADDRESS	=> Refresh_Address
            );
   
      INST_Mem_Interface : memory_interface
            port map (
            CLK					=> CLK,
            RESET_n				=> RESET_n,
            CORE_TYPE			=> Core_Type,
            CORE_RD				=> Control_Read,
            CORE_WR				=> Control_Write,
            CORE_ACK				=> Core_Ack,
            CORE_ADDRESS 		=> Core_Address,
            CORE_DATAIN 		=> DataBus,
            CORE_DATAOUT		=> DataBusOut_MI,
            REFRESH_ADDRESS	=> Refresh_Address,
            M1_n					=> M1_n,
            MREQ_n				=> MREQ_n,
            IOREQ_n				=> IOREQ_n,
            RD_n					=> RD_n,
            WR_n					=> WR_n,
            Wait_n				=> WAIT_n,
            BUSREQ_n				=> BUSREQ_n,
            BUSACK_n				=> BUSACK_n,
            RFSH_n				=> RFSH_n,
            ADDRESS				=> ADDRESS,
            DATA					=> DATA
            );
   
      DataBus <= 	DataBusOut_Control or
         DataBusOut_GP or
         DataBusOut_SP or
         DataBusOut_MI or
         DataBusOut_ALU;
   
   end architecture rtl;

