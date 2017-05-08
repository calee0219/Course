#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================

#set search_path {list . /cad/EDA/synopsys/synthesis/2008.09-sp2/libraries/syn \
#						/cad/EDA/synopsys/synthesis/2008.09-sp2/dw/sim_ver \
 #                       /cad/CBDLIB/CBDK_IC_Contest_v2.1/SynopsysDC/db

	#			../01_RTL .. .}
	
set search_path {list . /RAID/EDA/synopsys/synthesis/2010.03-sp5/libraries/syn \
						/RAID/EDA/synopsys/synthesis/2010.03-sp5/dw/sim_ver \
                        /RAID/LIB/CBDK_IC_Contest_v2.1/SynopsysDC/db  \

				../01_RTL .. .}
                   
set link_library {* slow.db dw_foundation.sldb}
set synthetic_library {standard.sldb dw_foundation.sldb}
set target_library {slow.db}

#======================================================
#  Global Parameters
#======================================================
set DESIGN "CONVCOR"
set CLK_period 10.0

set hdlin_ff_always_sync_set_reset true
#======================================================
#  Read RTL Code
#======================================================
read_verilog -rtl $DESIGN\.v
current_design $DESIGN

#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CLK_period clk

#set_ideal_net clk

set_input_delay [expr $CLK_period*0.5] -clock clk [all_inputs]
set_output_delay [expr $CLK_period*0.5] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n

set_load 0.05 [all_outputs]

#======================================================
#  Optimization
#======================================================
#uniquify
check_design
set_fix_multiple_port_nets -all -buffer_constants
#set_fix_hold [all_clocks]
compile_ultra

#======================================================
#  Output Reports 
#======================================================


#======================================================
#  Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
change_names -hierarchy -rules name_rule

#======================================================
#  Output Results
#======================================================
set verilogout_higher_designs_first true
write -format verilog -output Netlist/$DESIGN\_SYN.v -hierarchy
write_sdf -version 2.1 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf

#======================================================
#  Finish and Quit
#======================================================


exit
