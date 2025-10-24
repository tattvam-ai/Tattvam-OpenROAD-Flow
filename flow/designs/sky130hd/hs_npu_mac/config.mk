export DESIGN_NICKNAME = hs_npu_mac
export DESIGN_NAME = hs_npu_mm_unit
export PLATFORM = sky130hd

export VERILOG_FILES = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/hs_npu_mm_unit.sv \
	$(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/hs_npu_pkg.sv \
	$(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/hs_npu_fifo.sv \
	$(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/hs_npu_gatekeeper.sv \
	$(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/hs_npu_mac.sv \
	$(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/hs_npu_systolic.sv

export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# Adders degrade ibex setup repair
export ADDER_MAP_FILE :=

export CORE_UTILIZATION = 45
export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100

#export FASTROUTE_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/fastroute.tcl

export REMOVE_ABC_BUFFERS = 1
# export SYNTH_HIERARCHICAL = 1

export SYNTH_HDL_FRONTEND = slang
