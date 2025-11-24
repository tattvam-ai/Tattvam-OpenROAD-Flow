export DESIGN_NAME=mkccore_axi4
export DESIGN_NICKNAME=mkccore_axi4
export PLATFORM=asap7


export VERILOG_FILES=$(sort $(wildcard $(DESIGN_HOME)/src/mkccore_axi4/*.v)) \
                     $(DESIGN_HOME)/$(PLATFORM)/mkccore_axi4/shakti_macros.v

export SDC_FILE=$(DESIGN_HOME)/$(PLATFORM)/mkccore_axi4/constraint.sdc


export DIE_AREA    = 0 0 1000 1000
export CORE_AREA   = 20 20 980 980

# Macro Config
export RTLMP_MAX_INST=30000
export RTLMP_MIN_INST=10000
export RTLMP_MAX_MACRO=4
export RTLMP_MIN_MACRO=2
# export RTLMP_AREA_WEIGHT=0.6    # Slightly more area focus for macros
# export PLACE_DENSITY          = 0.50
# export ROUTING_LAYER_ADJUSTMENT=0.2

export CELL_PAD_IN_SITES_GLOBAL_PLACEMENT  = 2
export IO_PLACER_H = M2 M4
export IO_PLACER_V = M3 M5
export PLACE_PINS_ARGS = -min_distance 0.432

export ADDITIONAL_LEFS = $(sort $(wildcard $(DESIGN_HOME)/$(PLATFORM)/mkccore_axi4/lef/*.lef))
export ADDITIONAL_LIBS = $(sort $(wildcard $(DESIGN_HOME)/$(PLATFORM)/mkccore_axi4/lib/*.lib))
export MACRO_PLACEMENT_TCL = $(DESIGN_HOME)/$(PLATFORM)/mkccore_axi4/fix_macro_placement.tcl

export ROUTING_LAYER_ADJUSTMENT = 0.2
export RTLMP_MAX_LEVEL = 2    # Don't go too deep

export GPL_ROUTABILITY_DRIVEN = 1
export GPL_TIMING_DRIVEN = 0

export SYNTH_KEEP_MODULES = \
	module_fn_base_alu \
	mkfpu \
	module_fn_decode \
	module_fn_compare \
	module_fn_bypass \
	module_fn_bru \
	module_fn_logic 	

export PLACE_DENSITY_LB_ADDON = 0.2
#export SYNTH_HDL_FRONTEND = slang
