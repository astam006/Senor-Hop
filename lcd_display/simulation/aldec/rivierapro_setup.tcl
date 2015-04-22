
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
# Auto-generated simulation script

# ----------------------------------------
# Initialize the variable
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
} 

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "lcd_display"
} 

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
} 

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/13.0sp1/quartus/"
} 

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_ic_tag_ram.dat ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_ic_tag_ram.hex ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_ic_tag_ram.mif ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/submodules/lcd_display_CPU_rf_ram_b.mif ./
  file copy -force $QSYS_SIMDIR/submodules/altera_up_video_char_mode_rom_128.mif ./
  file copy -force $QSYS_SIMDIR/submodules/altera_up_video_fb_color_rom.mif ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                  ./libraries/altera_ver      
vmap       altera_ver       ./libraries/altera_ver      
ensure_lib                  ./libraries/lpm_ver         
vmap       lpm_ver          ./libraries/lpm_ver         
ensure_lib                  ./libraries/sgate_ver       
vmap       sgate_ver        ./libraries/sgate_ver       
ensure_lib                  ./libraries/altera_mf_ver   
vmap       altera_mf_ver    ./libraries/altera_mf_ver   
ensure_lib                  ./libraries/altera_lnsim_ver
vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver
ensure_lib                  ./libraries/cycloneive_ver  
vmap       cycloneive_ver   ./libraries/cycloneive_ver  
ensure_lib                  ./libraries/altera          
vmap       altera           ./libraries/altera          
ensure_lib                  ./libraries/lpm             
vmap       lpm              ./libraries/lpm             
ensure_lib                  ./libraries/sgate           
vmap       sgate            ./libraries/sgate           
ensure_lib                  ./libraries/altera_mf       
vmap       altera_mf        ./libraries/altera_mf       
ensure_lib                  ./libraries/altera_lnsim    
vmap       altera_lnsim     ./libraries/altera_lnsim    
ensure_lib                  ./libraries/cycloneive      
vmap       cycloneive       ./libraries/cycloneive      
ensure_lib                         ./libraries/Flash                  
vmap       Flash                   ./libraries/Flash                  
ensure_lib                         ./libraries/External_Clocks        
vmap       External_Clocks         ./libraries/External_Clocks        
ensure_lib                         ./libraries/sysid                  
vmap       sysid                   ./libraries/sysid                  
ensure_lib                         ./libraries/CPU                    
vmap       CPU                     ./libraries/CPU                    
ensure_lib                         ./libraries/Alpha_Blending         
vmap       Alpha_Blending          ./libraries/Alpha_Blending         
ensure_lib                         ./libraries/CPU_fpoint             
vmap       CPU_fpoint              ./libraries/CPU_fpoint             
ensure_lib                         ./libraries/VGA_Dual_Clock_FIFO    
vmap       VGA_Dual_Clock_FIFO     ./libraries/VGA_Dual_Clock_FIFO    
ensure_lib                         ./libraries/VGA_Pixel_Scaler       
vmap       VGA_Pixel_Scaler        ./libraries/VGA_Pixel_Scaler       
ensure_lib                         ./libraries/VGA_Pixel_RGB_Resampler
vmap       VGA_Pixel_RGB_Resampler ./libraries/VGA_Pixel_RGB_Resampler
ensure_lib                         ./libraries/VGA_Controller         
vmap       VGA_Controller          ./libraries/VGA_Controller         
ensure_lib                         ./libraries/VGA_Char_Buffer        
vmap       VGA_Char_Buffer         ./libraries/VGA_Char_Buffer        
ensure_lib                         ./libraries/VGA_Pixel_Buffer       
vmap       VGA_Pixel_Buffer        ./libraries/VGA_Pixel_Buffer       
ensure_lib                         ./libraries/SRAM                   
vmap       SRAM                    ./libraries/SRAM                   
ensure_lib                         ./libraries/PS2_Port               
vmap       PS2_Port                ./libraries/PS2_Port               
ensure_lib                         ./libraries/Char_LCD_16x2          
vmap       Char_LCD_16x2           ./libraries/Char_LCD_16x2          
ensure_lib                         ./libraries/Audio                  
vmap       Audio                   ./libraries/Audio                  
ensure_lib                         ./libraries/AV_Config              
vmap       AV_Config               ./libraries/AV_Config              
ensure_lib                         ./libraries/Serial_Port            
vmap       Serial_Port             ./libraries/Serial_Port            
ensure_lib                         ./libraries/Expansion_JP5          
vmap       Expansion_JP5           ./libraries/Expansion_JP5          
ensure_lib                         ./libraries/Pushbuttons            
vmap       Pushbuttons             ./libraries/Pushbuttons            
ensure_lib                         ./libraries/Slider_Switches        
vmap       Slider_Switches         ./libraries/Slider_Switches        
ensure_lib                         ./libraries/HEX7_HEX4              
vmap       HEX7_HEX4               ./libraries/HEX7_HEX4              
ensure_lib                         ./libraries/HEX3_HEX0              
vmap       HEX3_HEX0               ./libraries/HEX3_HEX0              
ensure_lib                         ./libraries/Green_LEDs             
vmap       Green_LEDs              ./libraries/Green_LEDs             
ensure_lib                         ./libraries/Red_LEDs               
vmap       Red_LEDs                ./libraries/Red_LEDs               
ensure_lib                         ./libraries/SDRAM                  
vmap       SDRAM                   ./libraries/SDRAM                  
ensure_lib                         ./libraries/Interval_Timer         
vmap       Interval_Timer          ./libraries/Interval_Timer         
ensure_lib                         ./libraries/JTAG_UART              
vmap       JTAG_UART               ./libraries/JTAG_UART              

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  vlog +define+SKIP_KEYWORDS_PRAGMA "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"              -work altera_ver      
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                       -work lpm_ver         
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                          -work sgate_ver       
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver   
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim_ver
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"               -work cycloneive_ver  
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera          
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera          
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera          
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera          
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera          
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera          
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm             
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm             
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate           
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate           
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf       
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf       
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim    
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.vhd"             -work cycloneive      
  vcom                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_components.vhd"        -work cycloneive      
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vcom "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_IP_Core_Avalon_Interface.vhd"                                      -work Flash                  
  vcom "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_Controller.vhd"                                                    -work Flash                  
  vcom "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_IP_Core_Standalone.vhd"                                            -work Flash                  
  vcom "$QSYS_SIMDIR/submodules/Altera_UP_Flash_Memory_User_Interface.vhd"                                                -work Flash                  
  vcom "$QSYS_SIMDIR/submodules/lcd_display_External_Clocks.vhd"                                                          -work External_Clocks        
  vcom "$QSYS_SIMDIR/submodules/lcd_display_sysid.vho"                                                                    -work sysid                  
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU.vho"                                                                      -work CPU                    
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU_jtag_debug_module_sysclk.vhd"                                             -work CPU                    
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU_jtag_debug_module_tck.vhd"                                                -work CPU                    
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU_jtag_debug_module_wrapper.vhd"                                            -work CPU                    
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU_mult_cell.vhd"                                                            -work CPU                    
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU_oci_test_bench.vhd"                                                       -work CPU                    
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU_test_bench.vhd"                                                           -work CPU                    
  vlog "$QSYS_SIMDIR/submodules/altera_up_video_alpha_blender_normal.v"                                                   -work Alpha_Blending         
  vlog "$QSYS_SIMDIR/submodules/altera_up_video_alpha_blender_simple.v"                                                   -work Alpha_Blending         
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Alpha_Blending.vhd"                                                           -work Alpha_Blending         
  vcom "$QSYS_SIMDIR/submodules/lcd_display_CPU_fpoint.vho"                                                               -work CPU_fpoint             
  vcom "$QSYS_SIMDIR/submodules/lcd_display_VGA_Dual_Clock_FIFO.vhd"                                                      -work VGA_Dual_Clock_FIFO    
  vlog "$QSYS_SIMDIR/submodules/altera_up_video_scaler_shrink.v"                                                          -work VGA_Pixel_Scaler       
  vlog "$QSYS_SIMDIR/submodules/altera_up_video_scaler_multiply_width.v"                                                  -work VGA_Pixel_Scaler       
  vlog "$QSYS_SIMDIR/submodules/altera_up_video_scaler_multiply_height.v"                                                 -work VGA_Pixel_Scaler       
  vcom "$QSYS_SIMDIR/submodules/lcd_display_VGA_Pixel_Scaler.vhd"                                                         -work VGA_Pixel_Scaler       
  vcom "$QSYS_SIMDIR/submodules/lcd_display_VGA_Pixel_RGB_Resampler.vhd"                                                  -work VGA_Pixel_RGB_Resampler
  vlog "$QSYS_SIMDIR/submodules/altera_up_avalon_video_vga_timing.v"                                                      -work VGA_Controller         
  vcom "$QSYS_SIMDIR/submodules/lcd_display_VGA_Controller.vhd"                                                           -work VGA_Controller         
  vlog "$QSYS_SIMDIR/submodules/altera_up_video_128_character_rom.v"                                                      -work VGA_Char_Buffer        
  vlog "$QSYS_SIMDIR/submodules/altera_up_video_fb_color_rom.v"                                                           -work VGA_Char_Buffer        
  vcom "$QSYS_SIMDIR/submodules/lcd_display_VGA_Char_Buffer.vhd"                                                          -work VGA_Char_Buffer        
  vcom "$QSYS_SIMDIR/submodules/lcd_display_VGA_Pixel_Buffer.vhd"                                                         -work VGA_Pixel_Buffer       
  vcom "$QSYS_SIMDIR/submodules/lcd_display_SRAM.vhd"                                                                     -work SRAM                   
  vlog "$QSYS_SIMDIR/submodules/altera_up_ps2.v"                                                                          -work PS2_Port               
  vlog "$QSYS_SIMDIR/submodules/altera_up_ps2_command_out.v"                                                              -work PS2_Port               
  vlog "$QSYS_SIMDIR/submodules/altera_up_ps2_data_in.v"                                                                  -work PS2_Port               
  vcom "$QSYS_SIMDIR/submodules/lcd_display_PS2_Port.vhd"                                                                 -work PS2_Port               
  vlog "$QSYS_SIMDIR/submodules/altera_up_character_lcd_communication.v"                                                  -work Char_LCD_16x2          
  vlog "$QSYS_SIMDIR/submodules/altera_up_character_lcd_initialization.v"                                                 -work Char_LCD_16x2          
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Char_LCD_16x2.vhd"                                                            -work Char_LCD_16x2          
  vlog "$QSYS_SIMDIR/submodules/altera_up_audio_bit_counter.v"                                                            -work Audio                  
  vlog "$QSYS_SIMDIR/submodules/altera_up_audio_in_deserializer.v"                                                        -work Audio                  
  vlog "$QSYS_SIMDIR/submodules/altera_up_audio_out_serializer.v"                                                         -work Audio                  
  vlog "$QSYS_SIMDIR/submodules/altera_up_clock_edge.v"                                                                   -work Audio                  
  vlog "$QSYS_SIMDIR/submodules/altera_up_sync_fifo.v"                                                                    -work Audio                  
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Audio.vhd"                                                                    -work Audio                  
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_serial_bus_controller.v"                                              -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_slow_clock_generator.v"                                                         -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init.v"                                                          -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_dc2.v"                                                      -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_d5m.v"                                                      -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_lcm.v"                                                      -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ltm.v"                                                      -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de2_35.v"                                                -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_adv7181.v"                                               -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de2_70.v"                                                -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de2_115.v"                                               -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_audio.v"                                                 -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_adv7180.v"                                               -work AV_Config              
  vcom "$QSYS_SIMDIR/submodules/lcd_display_AV_Config.vhd"                                                                -work AV_Config              
  vlog "$QSYS_SIMDIR/submodules/altera_up_rs232_counters.v"                                                               -work Serial_Port            
  vlog "$QSYS_SIMDIR/submodules/altera_up_rs232_in_deserializer.v"                                                        -work Serial_Port            
  vlog "$QSYS_SIMDIR/submodules/altera_up_rs232_out_serializer.v"                                                         -work Serial_Port            
  vlog "$QSYS_SIMDIR/submodules/altera_up_sync_fifo.v"                                                                    -work Serial_Port            
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Serial_Port.vhd"                                                              -work Serial_Port            
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Expansion_JP5.vhd"                                                            -work Expansion_JP5          
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Pushbuttons.vhd"                                                              -work Pushbuttons            
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Slider_Switches.vhd"                                                          -work Slider_Switches        
  vcom "$QSYS_SIMDIR/submodules/lcd_display_HEX7_HEX4.vhd"                                                                -work HEX7_HEX4              
  vcom "$QSYS_SIMDIR/submodules/lcd_display_HEX3_HEX0.vhd"                                                                -work HEX3_HEX0              
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Green_LEDs.vhd"                                                               -work Green_LEDs             
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Red_LEDs.vhd"                                                                 -work Red_LEDs               
  vcom "$QSYS_SIMDIR/submodules/lcd_display_SDRAM.vhd"                                                                    -work SDRAM                  
  vcom "$QSYS_SIMDIR/submodules/lcd_display_Interval_Timer.vhd"                                                           -work Interval_Timer         
  vcom "$QSYS_SIMDIR/submodules/lcd_display_JTAG_UART.vhd"                                                                -work JTAG_UART              
  vcom "$QSYS_SIMDIR/lcd_display.vhd"                                                                                                                  
  vcom "$QSYS_SIMDIR/lcd_display_width_adapter.vhd"                                                                                                    
  vcom "$QSYS_SIMDIR/lcd_display_width_adapter_001.vhd"                                                                                                
  vcom "$QSYS_SIMDIR/lcd_display_width_adapter_003.vhd"                                                                                                
  vcom "$QSYS_SIMDIR/lcd_display_width_adapter_004.vhd"                                                                                                
  vcom "$QSYS_SIMDIR/lcd_display_burst_adapter.vhd"                                                                                                    
  vcom "$QSYS_SIMDIR/lcd_display_burst_adapter_001.vhd"                                                                                                
  vcom "$QSYS_SIMDIR/lcd_display_rst_controller.vhd"                                                                                                   
  vcom "$QSYS_SIMDIR/lcd_display_rst_controller_002.vhd"                                                                                               
  vcom "$QSYS_SIMDIR/lcd_display_rst_controller_003.vhd"                                                                                               
  vcom "$QSYS_SIMDIR/lcd_display_cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent.vhd"                                                  
  vcom "$QSYS_SIMDIR/lcd_display_char_lcd_16x2_avalon_lcd_slave_translator_avalon_universal_slave_0_agent.vhd"                                         
  vcom "$QSYS_SIMDIR/lcd_display_sram_avalon_sram_slave_translator_avalon_universal_slave_0_agent.vhd"                                                 
  vcom "$QSYS_SIMDIR/lcd_display_cpu_instruction_master_translator.vhd"                                                                                
  vcom "$QSYS_SIMDIR/lcd_display_cpu_data_master_translator.vhd"                                                                                       
  vcom "$QSYS_SIMDIR/lcd_display_vga_pixel_buffer_avalon_pixel_dma_master_translator.vhd"                                                              
  vcom "$QSYS_SIMDIR/lcd_display_video_in_dma_controller_avalon_dma_master_translator.vhd"                                                             
  vcom "$QSYS_SIMDIR/lcd_display_cpu_jtag_debug_module_translator.vhd"                                                                                 
  vcom "$QSYS_SIMDIR/lcd_display_sdram_s1_translator.vhd"                                                                                              
  vcom "$QSYS_SIMDIR/lcd_display_flash_flash_data_translator.vhd"                                                                                      
  vcom "$QSYS_SIMDIR/lcd_display_jtag_uart_avalon_jtag_slave_translator.vhd"                                                                           
  vcom "$QSYS_SIMDIR/lcd_display_interval_timer_s1_translator.vhd"                                                                                     
  vcom "$QSYS_SIMDIR/lcd_display_sysid_control_slave_translator.vhd"                                                                                   
  vcom "$QSYS_SIMDIR/lcd_display_red_leds_avalon_parallel_port_slave_translator.vhd"                                                                   
  vcom "$QSYS_SIMDIR/lcd_display_serial_port_avalon_rs232_slave_translator.vhd"                                                                        
  vcom "$QSYS_SIMDIR/lcd_display_char_lcd_16x2_avalon_lcd_slave_translator.vhd"                                                                        
  vcom "$QSYS_SIMDIR/lcd_display_ps2_port_avalon_ps2_slave_translator.vhd"                                                                             
  vcom "$QSYS_SIMDIR/lcd_display_sram_avalon_sram_slave_translator.vhd"                                                                                
  vcom "$QSYS_SIMDIR/lcd_display_vga_char_buffer_avalon_char_buffer_slave_translator.vhd"                                                              
  vcom "$QSYS_SIMDIR/lcd_display_av_config_avalon_av_config_slave_translator.vhd"                                                                      
  vcom "$QSYS_SIMDIR/lcd_display_vga_pixel_buffer_avalon_control_slave_translator.vhd"                                                                 
  vcom "$QSYS_SIMDIR/lcd_display_audio_avalon_audio_slave_translator.vhd"                                                                              
  vcom "$QSYS_SIMDIR/lcd_display_flash_flash_erase_control_translator.vhd"                                                                             
  vcom "$QSYS_SIMDIR/lcd_display_sd_card_avalon_sdcard_slave_translator.vhd"                                                                           
  vcom "$QSYS_SIMDIR/lcd_display_usb_avalon_usb_slave_translator.vhd"                                                                                  
  vcom "$QSYS_SIMDIR/lcd_display_cpu_instruction_master_translator_avalon_universal_master_0_agent.vhd"                                                
  vcom "$QSYS_SIMDIR/lcd_display_vga_pixel_buffer_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent.vhd"                              
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  vsim +access +r  -t ps -L work -L Flash -L External_Clocks -L sysid -L CPU -L Alpha_Blending -L CPU_fpoint -L VGA_Dual_Clock_FIFO -L VGA_Pixel_Scaler -L VGA_Pixel_RGB_Resampler -L VGA_Controller -L VGA_Char_Buffer -L VGA_Pixel_Buffer -L SRAM -L PS2_Port -L Char_LCD_16x2 -L Audio -L AV_Config -L Serial_Port -L Expansion_JP5 -L Pushbuttons -L Slider_Switches -L HEX7_HEX4 -L HEX3_HEX0 -L Green_LEDs -L Red_LEDs -L SDRAM -L Interval_Timer -L JTAG_UART -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  vsim -dbg -O2 +access +r -t ps -L work -L Flash -L External_Clocks -L sysid -L CPU -L Alpha_Blending -L CPU_fpoint -L VGA_Dual_Clock_FIFO -L VGA_Pixel_Scaler -L VGA_Pixel_RGB_Resampler -L VGA_Controller -L VGA_Char_Buffer -L VGA_Pixel_Buffer -L SRAM -L PS2_Port -L Char_LCD_16x2 -L Audio -L AV_Config -L Serial_Port -L Expansion_JP5 -L Pushbuttons -L Slider_Switches -L HEX7_HEX4 -L HEX3_HEX0 -L Green_LEDs -L Red_LEDs -L SDRAM -L Interval_Timer -L JTAG_UART -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
