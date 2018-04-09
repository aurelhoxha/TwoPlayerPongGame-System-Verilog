## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports basysClk]							
	set_property IOSTANDARD LVCMOS33 [get_ports basysClk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports basysClk]
 
 
set_property PACKAGE_PIN V17 [get_ports {start}]					
        set_property IOSTANDARD LVCMOS33 [get_ports {start}]
#set_property PACKAGE_PIN V16 [get_ports {rows[1]}]                    
 #       set_property IOSTANDARD LVCMOS33 [get_ports {rows[1]}]
  # set_property PACKAGE_PIN W16 [get_ports {start}]                    
        #set_property IOSTANDARD LVCMOS33 [get_ports {start}]
#set_property PACKAGE_PIN W17 [get_ports {columns[0]}]                    
 #       set_property IOSTANDARD LVCMOS33 [get_ports {columns[0]}]
#set_property PACKAGE_PIN W15 [get_ports {columns[1]}]                    
 #        set_property IOSTANDARD LVCMOS33 [get_ports {columns[1]}]
#        set_property PACKAGE_PIN U18 [get_ports start]						
#             set_property IOSTANDARD LVCMOS33 [get_ports start]
         #    set_property PACKAGE_PIN T1 [get_ports {start}]                    
          #           set_property IOSTANDARD LVCMOS33 [get_ports {start}]
#set_property PACKAGE_PIN U18 [get_ports start]						
    #         set_property IOSTANDARD LVCMOS33 [get_ports start]
## Switches
 set_property PACKAGE_PIN A14 [get_ports {rowsOut[0]}]  	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[0]}] 
##Sch name = JB2 
set_property PACKAGE_PIN A16 [get_ports {rowsOut[1]}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[1]}] 
##Sch name = JB3 
set_property PACKAGE_PIN B15 [get_ports {rowsOut[2]}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[2]}] 
set_property PACKAGE_PIN B16 [get_ports {rowsOut[3]}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[3]}] 
##Sch name = JB7 
set_property PACKAGE_PIN A15 [get_ports {rowsOut[4]}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[4]}] 
##Sch name = JB8 
set_property PACKAGE_PIN A17 [get_ports {rowsOut[5]}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[5]}] 
##Sch name = JB9 
set_property PACKAGE_PIN C15 [get_ports {rowsOut[6]}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[6]}] 
##Sch name = JB10  
set_property PACKAGE_PIN C16 [get_ports {rowsOut[7]}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {rowsOut[7]}] 
 #Buttons 
    set_property PACKAGE_PIN T17 [get_ports buttonRight2]                           
         set_property IOSTANDARD LVCMOS33 [get_ports buttonRight2] 
    set_property PACKAGE_PIN U17 [get_ports buttonLeft2]                           
         set_property IOSTANDARD LVCMOS33 [get_ports buttonLeft2] 
         
    set_property PACKAGE_PIN T18 [get_ports buttonRight1]                           
         set_property IOSTANDARD LVCMOS33 [get_ports buttonRight1] 
    set_property PACKAGE_PIN W19 [get_ports buttonLeft1]                           
         set_property IOSTANDARD LVCMOS33 [get_ports buttonLeft1]
         
    set_property PACKAGE_PIN U18 [get_ports reset]                           
                  set_property IOSTANDARD LVCMOS33 [get_ports reset]  
##Pmod Header JC 
##Sch name = JC1 
set_property PACKAGE_PIN K17 [get_ports {ds}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {ds}] 
##Sch name = JC2 
set_property PACKAGE_PIN M18 [get_ports {oe}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {oe}] 
##Sch name = JC3 
set_property PACKAGE_PIN N17 [get_ports {stcp}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {stcp}] 
##Sch name = JC4 
set_property PACKAGE_PIN P18 [get_ports {shcp}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {shcp}] 
##Sch name = JC7 
set_property PACKAGE_PIN L17 [get_ports {mr}]                      
    set_property IOSTANDARD LVCMOS33 [get_ports {mr}] 
##Sch name = JC8


#7 segment display 
     set_property PACKAGE_PIN W7 [get_ports {a}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {a}] 
     set_property PACKAGE_PIN W6 [get_ports {q}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {q}] 
     set_property PACKAGE_PIN U8 [get_ports {c}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {c}] 
     set_property PACKAGE_PIN V8 [get_ports {d}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {d}] 
     set_property PACKAGE_PIN U5 [get_ports {e}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {e}] 
     set_property PACKAGE_PIN V5 [get_ports {f}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {f}] 
     set_property PACKAGE_PIN U7 [get_ports {g}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {g}] 
     set_property PACKAGE_PIN V7 [get_ports dp]                       
          set_property IOSTANDARD LVCMOS33 [get_ports dp] 
     set_property PACKAGE_PIN U2 [get_ports {an[0]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}] 
     set_property PACKAGE_PIN U4 [get_ports {an[1]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}] 
     set_property PACKAGE_PIN V4 [get_ports {an[2]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}] 
     set_property PACKAGE_PIN W4 [get_ports {an[3]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]