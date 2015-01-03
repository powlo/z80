configuration Z80_tb_config of Z80_tb is
	for behav
		for INST_Z80 : Z80
			use entity Work.Z80(rtl);
		end for;
	end for;
end configuration Z80_tb_config;