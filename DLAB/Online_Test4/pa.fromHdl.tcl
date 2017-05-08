
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Test04 -dir "D:/Test04/planAhead_run_5" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Test04.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {LCD.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {debounce.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Test04.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Test04 $srcset
add_files [list {Test04.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
