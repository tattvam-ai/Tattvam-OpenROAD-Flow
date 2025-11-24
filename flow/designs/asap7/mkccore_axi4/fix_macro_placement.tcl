# OpenROAD peripheral macro placement script for 980x980 die
# Macros placed in facing pairs to create routing channels
# Similar memory types grouped together
# Die dimensions: 980 x 980, margin: 30 units from edges

# ===== DCACHE DATA PLACEMENT (32 instances, 66.64 x 26.832) =====
# Left region - pairs facing each other with routing channel between
place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_0.mem -location {30.0 52.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_1.mem -location {150.0 52.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_2.mem -location {30.0 92.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_3.mem -location {150.0 92.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_4.mem -location {30.0 132.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_5.mem -location {150.0 132.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_6.mem -location {30.0 172.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_0_ram_single_7.mem -location {150.0 172.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_0.mem -location {30.0 222.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_1.mem -location {150.0 222.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_2.mem -location {30.0 262.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_3.mem -location {150.0 262.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_4.mem -location {30.0 302.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_5.mem -location {150.0 302.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_6.mem -location {30.0 342.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_1_ram_single_7.mem -location {150.0 342.0} -orientation R180

# Left region - pairs facing each other with routing channel between
place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_0.mem -location {30.0 380.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_1.mem -location {150.0 380.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_2.mem -location {30.0 420.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_3.mem -location {150.0 420.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_4.mem -location {30.0 460.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_5.mem -location {150.0 460.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_6.mem -location {30.0 500.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_2_ram_single_7.mem -location {150.0 500.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_0.mem -location {30.0 540.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_1.mem -location {150.0 540.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_2.mem -location {30.0 580.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_3.mem -location {150.0 580.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_4.mem -location {30.0 620.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_5.mem -location {150.0 620.0} -orientation R180

place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_6.mem -location {30.0 660.0} -orientation R180
place_macro -macro_name dmem.dcache.m_data.v_data_3_ram_single_7.mem -location {150.0 660.0} -orientation R180

# ===== DCACHE TAGS PLACEMENT (4 instances, 5.184 x 10.176) =====
# Near dcache regions, in facing pairs
place_macro -macro_name dmem.dcache.m_tag.v_tags_0_ram_single_0.mem -location {250.0 100.0} -orientation R180
place_macro -macro_name dmem.dcache.m_tag.v_tags_1_ram_single_0.mem -location {261.184 100.0} -orientation R180
place_macro -macro_name dmem.dcache.m_tag.v_tags_2_ram_single_0.mem -location {250.0 80.0} -orientation R180
place_macro -macro_name dmem.dcache.m_tag.v_tags_3_ram_single_0.mem -location {261.184 80.0} -orientation R180

# ===== ICACHE DATA PLACEMENT (64 instances, 16.565 x 14.784) =====
# Right region - icache memories in facing pairs
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_0.mem -location {880.0 350.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_1.mem -location {910.0 350.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_2.mem -location {880.0 380.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_3.mem -location {910.0 380.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_4.mem -location {880.0 410.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_5.mem -location {910.0 410.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_6.mem -location {880.0 440.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_7.mem -location {910.0 440.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_8.mem -location {880.0 470.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_9.mem -location {910.0 470.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_10.mem -location {880.0 500.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_11.mem -location {910.0 500.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_12.mem -location {880.0 530.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_13.mem -location {910.0 530.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_14.mem -location {880.0 560.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_0_ram_single_15.mem -location {910.0 560.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_0.mem -location {880.0 590.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_1.mem -location {910.0 590.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_2.mem -location {880.0 620.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_3.mem -location {910.0 620.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_4.mem -location {880.0 650.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_5.mem -location {910.0 650.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_6.mem -location {880.0 680.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_7.mem -location {910.0 680.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_8.mem -location {880.0 710.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_9.mem -location {910.0 710.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_10.mem -location {880.0 740.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_11.mem -location {910.0 740.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_12.mem -location {880.0 770.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_13.mem -location {910.0 770.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_14.mem -location {880.0 800.0} -orientation R0
place_macro -macro_name imem.icache.m_data.v_data_1_ram_single_15.mem -location {910.0 800.0} -orientation R0

# Top region - icache memories in facing pairs
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_0.mem -location {250.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_1.mem -location {280.0 920.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_2.mem -location {310.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_3.mem -location {340.0 920.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_4.mem -location {370.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_5.mem -location {400.0 920.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_6.mem -location {430.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_7.mem -location {460.0 920.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_0.mem -location {490.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_1.mem -location {520.0 920.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_2.mem -location {550.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_3.mem -location {580.0 920.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_4.mem -location {610.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_5.mem -location {640.0 920.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_6.mem -location {670.0 920.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_7.mem -location {700.0 920.0} -orientation R0



place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_8.mem -location {250.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_9.mem -location {280.0 895.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_10.mem -location {310.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_11.mem -location {340.0 895.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_12.mem -location {370.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_13.mem -location {400.0 895.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_14.mem -location {430.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_2_ram_single_15.mem -location {460.0 895.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_8.mem -location {490.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_9.mem -location {520.0 895.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_10.mem -location {550.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_11.mem -location {580.0 895.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_12.mem -location {610.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_13.mem -location {640.0 895.0} -orientation R0

place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_14.mem -location {670.0 895.0} -orientation R180
place_macro -macro_name imem.icache.m_data.v_data_3_ram_single_15.mem -location {700.0 895.0} -orientation R0

# ===== ICACHE TAGS PLACEMENT (4 instances, 5.184 x 10.176) =====
# Near icache regions, in facing pairs  
place_macro -macro_name imem.icache.m_tag.v_tags_0_ram_single_0.mem -location {775.0 850.0} -orientation R0
place_macro -macro_name imem.icache.m_tag.v_tags_1_ram_single_0.mem -location {790.0 850.0} -orientation R0
place_macro -macro_name imem.icache.m_tag.v_tags_2_ram_single_0.mem -location {775.0 830.0} -orientation R0
place_macro -macro_name imem.icache.m_tag.v_tags_3_ram_single_0.mem -location {790.0 830.0} -orientation R0
