
# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0sp1 232 win32 2015.04.22.18:15:35

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="lcd_display"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/13.0sp1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/Flash/
mkdir -p ./libraries/External_Clocks/
mkdir -p ./libraries/sysid/
mkdir -p ./libraries/CPU/
mkdir -p ./libraries/Alpha_Blending/
mkdir -p ./libraries/CPU_fpoint/
mkdir -p ./libraries/VGA_Dual_Clock_FIFO/
mkdir -p ./libraries/VGA_Pixel_Scaler/
mkdir -p ./libraries/VGA_Pixel_RGB_Resampler/
mkdir -p ./libraries/VGA_Controller/
mkdir -p ./libraries/VGA_Char_Buffer/
mkdir -p ./libraries/VGA_Pixel_Buffer/
mkdir -p ./libraries/SRAM/
mkdir -p ./libraries/PS2_Port/
mkdir -p ./libraries/Char_LCD_16x2/
mkdir -p ./libraries/Audio/
mkdir -p ./libraries/AV_Config/
mkdir -p ./libraries/Serial_Port/
mkdir -p ./libraries/Expansion_JP5/
mkdir -p ./libraries/Pushbuttons/
mkdir -p ./libraries/Slider_Switches/
mkdir -p ./libraries/HEX7_HEX4/
mkdir -p ./libraries/HEX3_HEX0/
mkdir -p ./libraries/Green_LEDs/
mkdir -p ./libraries/Red_LEDs/
mkdir -p ./libraries/SDRAM/
mkdir -p ./libraries/Interval_Timer/
mkdir -p ./libraries/JTAG_UART/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneive_ver/
mkdir -p ./libraries/altera/
mkdir -p ./libraries/lpm/
mkdir -p ./libraries/sgate/
mkdir -p ./libraries/altera_mf/
mkdir -p ./libraries/altera_lnsim/
mkdir -p ./libraries/cycloneive/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_ic_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_ic_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_ic_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_b.mif ./
  cp -f $QSYS_SIMDIR/submodules/altera_up_video_char_mode_rom_128.mif ./
  cp -f $QSYS_SIMDIR/submodules/altera_up_video_fb_color_rom.mif ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"              -work altera_ver      
  ncvlog      "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                       -work lpm_ver         
  ncvlog      "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                          -work sgate_ver       
  ncvlog      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver   
  ncvlog -sv  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim_ver
  ncvlog      "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"               -work cycloneive_ver  
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera          
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera          
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera          
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera          
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera          
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera          
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm             
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm             
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate           
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate           
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf       
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf       
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim    
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.vhd"             -work cycloneive      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_components.vhd"        -work cycloneive      
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_IP_Core_Avalon_Interface.vhd"                                      -work Flash                   -cdslib ./cds_libs/Flash.cds.lib                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_Controller.vhd"                                                    -work Flash                   -cdslib ./cds_libs/Flash.cds.lib                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_IP_Core_Standalone.vhd"                                            -work Flash                   -cdslib ./cds_libs/Flash.cds.lib                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_User_Interface.vhd"                                                -work Flash                   -cdslib ./cds_libs/Flash.cds.lib                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_External_Clocks.vhd"                                                          -work External_Clocks         -cdslib ./cds_libs/External_Clocks.cds.lib        
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_sysid.vho"                                                                    -work sysid                   -cdslib ./cds_libs/sysid.cds.lib                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU.vho"                                                                      -work CPU                     -cdslib ./cds_libs/CPU.cds.lib                    
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU_jtag_debug_module_sysclk.vhd"                                             -work CPU                     -cdslib ./cds_libs/CPU.cds.lib                    
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU_jtag_debug_module_tck.vhd"                                                -work CPU                     -cdslib ./cds_libs/CPU.cds.lib                    
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU_jtag_debug_module_wrapper.vhd"                                            -work CPU                     -cdslib ./cds_libs/CPU.cds.lib                    
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU_mult_cell.vhd"                                                            -work CPU                     -cdslib ./cds_libs/CPU.cds.lib                    
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU_oci_test_bench.vhd"                                                       -work CPU                     -cdslib ./cds_libs/CPU.cds.lib                    
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU_test_bench.vhd"                                                           -work CPU                     -cdslib ./cds_libs/CPU.cds.lib                    
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_video_alpha_blender_normal.v"                                                   -work Alpha_Blending          -cdslib ./cds_libs/Alpha_Blending.cds.lib         
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_video_alpha_blender_simple.v"                                                   -work Alpha_Blending          -cdslib ./cds_libs/Alpha_Blending.cds.lib         
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Alpha_Blending.vhd"                                                           -work Alpha_Blending          -cdslib ./cds_libs/Alpha_Blending.cds.lib         
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_CPU_fpoint.vho"                                                               -work CPU_fpoint              -cdslib ./cds_libs/CPU_fpoint.cds.lib             
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_VGA_Dual_Clock_FIFO.vhd"                                                      -work VGA_Dual_Clock_FIFO     -cdslib ./cds_libs/VGA_Dual_Clock_FIFO.cds.lib    
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_video_scaler_shrink.v"                                                          -work VGA_Pixel_Scaler        -cdslib ./cds_libs/VGA_Pixel_Scaler.cds.lib       
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_video_scaler_multiply_width.v"                                                  -work VGA_Pixel_Scaler        -cdslib ./cds_libs/VGA_Pixel_Scaler.cds.lib       
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_video_scaler_multiply_height.v"                                                 -work VGA_Pixel_Scaler        -cdslib ./cds_libs/VGA_Pixel_Scaler.cds.lib       
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_VGA_Pixel_Scaler.vhd"                                                         -work VGA_Pixel_Scaler        -cdslib ./cds_libs/VGA_Pixel_Scaler.cds.lib       
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_VGA_Pixel_RGB_Resampler.vhd"                                                  -work VGA_Pixel_RGB_Resampler -cdslib ./cds_libs/VGA_Pixel_RGB_Resampler.cds.lib
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_avalon_video_vga_timing.v"                                                      -work VGA_Controller          -cdslib ./cds_libs/VGA_Controller.cds.lib         
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_VGA_Controller.vhd"                                                           -work VGA_Controller          -cdslib ./cds_libs/VGA_Controller.cds.lib         
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_video_128_character_rom.v"                                                      -work VGA_Char_Buffer         -cdslib ./cds_libs/VGA_Char_Buffer.cds.lib        
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_video_fb_color_rom.v"                                                           -work VGA_Char_Buffer         -cdslib ./cds_libs/VGA_Char_Buffer.cds.lib        
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_VGA_Char_Buffer.vhd"                                                          -work VGA_Char_Buffer         -cdslib ./cds_libs/VGA_Char_Buffer.cds.lib        
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_VGA_Pixel_Buffer.vhd"                                                         -work VGA_Pixel_Buffer        -cdslib ./cds_libs/VGA_Pixel_Buffer.cds.lib       
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_SRAM.vhd"                                                                     -work SRAM                    -cdslib ./cds_libs/SRAM.cds.lib                   
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_ps2.v"                                                                          -work PS2_Port                -cdslib ./cds_libs/PS2_Port.cds.lib               
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_ps2_command_out.v"                                                              -work PS2_Port                -cdslib ./cds_libs/PS2_Port.cds.lib               
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_ps2_data_in.v"                                                                  -work PS2_Port                -cdslib ./cds_libs/PS2_Port.cds.lib               
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_PS2_Port.vhd"                                                                 -work PS2_Port                -cdslib ./cds_libs/PS2_Port.cds.lib               
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_character_lcd_communication.v"                                                  -work Char_LCD_16x2           -cdslib ./cds_libs/Char_LCD_16x2.cds.lib          
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_character_lcd_initialization.v"                                                 -work Char_LCD_16x2           -cdslib ./cds_libs/Char_LCD_16x2.cds.lib          
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Char_LCD_16x2.vhd"                                                            -work Char_LCD_16x2           -cdslib ./cds_libs/Char_LCD_16x2.cds.lib          
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_audio_bit_counter.v"                                                            -work Audio                   -cdslib ./cds_libs/Audio.cds.lib                  
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_audio_in_deserializer.v"                                                        -work Audio                   -cdslib ./cds_libs/Audio.cds.lib                  
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_audio_out_serializer.v"                                                         -work Audio                   -cdslib ./cds_libs/Audio.cds.lib                  
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_clock_edge.v"                                                                   -work Audio                   -cdslib ./cds_libs/Audio.cds.lib                  
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_sync_fifo.v"                                                                    -work Audio                   -cdslib ./cds_libs/Audio.cds.lib                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Audio.vhd"                                                                    -work Audio                   -cdslib ./cds_libs/Audio.cds.lib                  
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_serial_bus_controller.v"                                              -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_slow_clock_generator.v"                                                         -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init.v"                                                          -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_dc2.v"                                                      -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_d5m.v"                                                      -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_lcm.v"                                                      -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ltm.v"                                                      -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de2_35.v"                                                -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_adv7181.v"                                               -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de2_70.v"                                                -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de2_115.v"                                               -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_audio.v"                                                 -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_adv7180.v"                                               -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_AV_Config.vhd"                                                                -work AV_Config               -cdslib ./cds_libs/AV_Config.cds.lib              
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_rs232_counters.v"                                                               -work Serial_Port             -cdslib ./cds_libs/Serial_Port.cds.lib            
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_rs232_in_deserializer.v"                                                        -work Serial_Port             -cdslib ./cds_libs/Serial_Port.cds.lib            
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_rs232_out_serializer.v"                                                         -work Serial_Port             -cdslib ./cds_libs/Serial_Port.cds.lib            
  ncvlog      "$QSYS_SIMDIR/submodules/altera_up_sync_fifo.v"                                                                    -work Serial_Port             -cdslib ./cds_libs/Serial_Port.cds.lib            
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Serial_Port.vhd"                                                              -work Serial_Port             -cdslib ./cds_libs/Serial_Port.cds.lib            
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Expansion_JP5.vhd"                                                            -work Expansion_JP5           -cdslib ./cds_libs/Expansion_JP5.cds.lib          
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Pushbuttons.vhd"                                                              -work Pushbuttons             -cdslib ./cds_libs/Pushbuttons.cds.lib            
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Slider_Switches.vhd"                                                          -work Slider_Switches         -cdslib ./cds_libs/Slider_Switches.cds.lib        
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_HEX7_HEX4.vhd"                                                                -work HEX7_HEX4               -cdslib ./cds_libs/HEX7_HEX4.cds.lib              
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_HEX3_HEX0.vhd"                                                                -work HEX3_HEX0               -cdslib ./cds_libs/HEX3_HEX0.cds.lib              
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Green_LEDs.vhd"                                                               -work Green_LEDs              -cdslib ./cds_libs/Green_LEDs.cds.lib             
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Red_LEDs.vhd"                                                                 -work Red_LEDs                -cdslib ./cds_libs/Red_LEDs.cds.lib               
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_SDRAM.vhd"                                                                    -work SDRAM                   -cdslib ./cds_libs/SDRAM.cds.lib                  
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_Interval_Timer.vhd"                                                           -work Interval_Timer          -cdslib ./cds_libs/Interval_Timer.cds.lib         
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/lcd_display_JTAG_UART.vhd"                                                                -work JTAG_UART               -cdslib ./cds_libs/JTAG_UART.cds.lib              
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display.vhd"                                                                                                                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_width_adapter.vhd"                                                                                                                                                       
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_width_adapter_001.vhd"                                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_width_adapter_003.vhd"                                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_width_adapter_004.vhd"                                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_burst_adapter.vhd"                                                                                                                                                       
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_burst_adapter_001.vhd"                                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_rst_controller.vhd"                                                                                                                                                      
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_rst_controller_002.vhd"                                                                                                                                                  
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_rst_controller_003.vhd"                                                                                                                                                  
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent.vhd"                                                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_char_lcd_16x2_avalon_lcd_slave_translator_avalon_universal_slave_0_agent.vhd"                                                                                            
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_sram_avalon_sram_slave_translator_avalon_universal_slave_0_agent.vhd"                                                                                                    
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_cpu_instruction_master_translator.vhd"                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_cpu_data_master_translator.vhd"                                                                                                                                          
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_vga_pixel_buffer_avalon_pixel_dma_master_translator.vhd"                                                                                                                 
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_video_in_dma_controller_avalon_dma_master_translator.vhd"                                                                                                                
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_cpu_jtag_debug_module_translator.vhd"                                                                                                                                    
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_sdram_s1_translator.vhd"                                                                                                                                                 
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_flash_flash_data_translator.vhd"                                                                                                                                         
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_jtag_uart_avalon_jtag_slave_translator.vhd"                                                                                                                              
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_interval_timer_s1_translator.vhd"                                                                                                                                        
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_sysid_control_slave_translator.vhd"                                                                                                                                      
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_red_leds_avalon_parallel_port_slave_translator.vhd"                                                                                                                      
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_serial_port_avalon_rs232_slave_translator.vhd"                                                                                                                           
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_char_lcd_16x2_avalon_lcd_slave_translator.vhd"                                                                                                                           
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_ps2_port_avalon_ps2_slave_translator.vhd"                                                                                                                                
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_sram_avalon_sram_slave_translator.vhd"                                                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_vga_char_buffer_avalon_char_buffer_slave_translator.vhd"                                                                                                                 
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_av_config_avalon_av_config_slave_translator.vhd"                                                                                                                         
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_vga_pixel_buffer_avalon_control_slave_translator.vhd"                                                                                                                    
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_audio_avalon_audio_slave_translator.vhd"                                                                                                                                 
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_flash_flash_erase_control_translator.vhd"                                                                                                                                
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_sd_card_avalon_sdcard_slave_translator.vhd"                                                                                                                              
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_usb_avalon_usb_slave_translator.vhd"                                                                                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_cpu_instruction_master_translator_avalon_universal_master_0_agent.vhd"                                                                                                   
  ncvhdl -v93 "$QSYS_SIMDIR/lcd_display_vga_pixel_buffer_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent.vhd"                                                                                 
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen -relax $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi