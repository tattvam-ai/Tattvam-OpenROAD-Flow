export DESIGN_NICKNAME = clock_divider
export DESIGN_NAME = clk_divider
export PLATFORM    = sky130hd

export VERILOG_FILES = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/clk_divider.sv 
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc


export CORE_UTILIZATION = 45
export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100

export FASTROUTE_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/fastroute.tcl

export REMOVE_ABC_BUFFERS = 1
export HDL_FRONTEND = slang
