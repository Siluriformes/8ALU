set projDir "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/planAhead"
set projName "8ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/mojo_top_0.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/reset_conditioner_1.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/multi_seven_seg_2.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/dec_digit_3.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/ALU_4.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/counter_5.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/seven_seg_6.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/decoder_7.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/adder_8.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/comparator_9.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/boolean_10.v" "C:/Users/User/Desktop/Structures/MHP/8ALU/8ALU/work/verilog/shifter_11.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "E:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "E:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
