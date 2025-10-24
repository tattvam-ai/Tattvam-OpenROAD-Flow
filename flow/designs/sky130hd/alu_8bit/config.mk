export DESIGN_NICKNAME = alu_8bit
export DESIGN_NAME = alu_8bit
export PLATFORM    = sky130hd

export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.v))
export VERILOG_INCLUDE_DIRS = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/include
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export CORE_UTILIZATION = 50
export PLACE_DENSITY_LB_ADDON = 0.15
export TNS_END_PERCENT = 100

export FASTROUTE_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/fastroute.tcl

export REMOVE_ABC_BUFFERS = 1
# export SYNTH_HDL_FRONTEND = slang
# workaround for density growing to 0.91 from adjustments on TD/RD iterations
# export GPL_ROUTABILITY_DRIVEN = 0

