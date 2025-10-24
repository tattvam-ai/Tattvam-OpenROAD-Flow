export DESIGN_NICKNAME = pipelined_multiplier
export DESIGN_NAME = pipeline
export PLATFORM    = sky130hd

export VERILOG_FILES = \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/half_adder.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/rca_1b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/rca_4b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/rca_4b1.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/rca8b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/rca16b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/rca32b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/rca64.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/vdcmul_2b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/vdcmul_4b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/vdcmul_8b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/vdcmul_16b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/vdcmul_32b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/src/vdcmul_64b.v \
    $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/pipeline.v

export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc


export CORE_UTILIZATION = 45
export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100

export FASTROUTE_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/fastroute.tcl

export REMOVE_ABC_BUFFERS = 1
