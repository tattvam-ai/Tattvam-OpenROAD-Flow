export DESIGN_NICKNAME = sobel_filter
export DESIGN_NAME = sobel
export PLATFORM    = sky130hd

export VERILOG_FILES = \
	$(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/sliding_window.sv \
	$(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/sobel_filter.sv
     

export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc


export CORE_UTILIZATION = 45
export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100

export FASTROUTE_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/fastroute.tcl

export REMOVE_ABC_BUFFERS = 1
export SYNTH_HDL_FRONTEND = slang
