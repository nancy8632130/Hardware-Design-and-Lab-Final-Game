module top(
   input clk,
   input rst,
   inout wire PS2_DATA,
   inout wire PS2_CLK,
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync,
   output [6:0] SEG,
   output [3:0] AN,  
   output [15:0]LED,
   output pmod_1,
   output pmod_2,
   output pmod_4   
    );

    wire [11:0] data;
    wire clk_17;
    wire clk_22;
    wire clk_27;
	wire clk_16;
    wire clk_20;
    wire clk_25MHz;
    wire [10:0] position;
    wire [10:0] position_ghost;
    wire [16:0] pixel_addr_plant;
    wire [16:0] pixel_addr_bullet;
    wire [16:0] pixel_addr_zombie;
    wire [16:0] pixel_addr_zombie2;		
    wire [16:0]pixel_addr_menu;
    wire [11:0] pixel;	
    wire [11:0] pixel_plant;
	wire [11:0] pixel_menu;
    wire [11:0] pixel_bullet;
    wire [11:0] pixel_zombie;	
    wire [11:0] pixel_zombie2;	
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
	wire [7:0] power;
	wire [7:0] new_power;
	wire [3:0] digit;	
    wire [15:0]led;
    wire  key_return_D;
    wire  key_return_L;
    wire  key_return_E;
    wire  key_return_R;
    wire  key_return_U;
    wire  larger_signal_D;
    wire  larger_signal_L;
    wire  larger_signal_E;
    wire  larger_signal_R;
    wire  larger_signal_U;
    wire db_rst;
    wire db_start;
    wire [10:0] position0;
    wire [10:0] position1;
    wire [10:0] position2;
    wire [10:0] position3;
    wire [10:0] position4;
    wire [10:0] position5;
    wire [10:0] position6;
    wire [10:0] position7;
    wire [10:0] gpos0;
    wire [10:0] gpos1;
    wire [10:0] gpos2;
    wire [10:0] gpos3;
	wire [10:0] gpos0_1;
    wire [10:0] gpos1_1;
    wire [10:0] gpos2_1;
    wire [10:0] gpos3_1;
    wire [3:0] zombie_rst;
    wire [3:0]outrandom;
    wire pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7;
	wire gstart0,gstart1,gstart2,gstart3,gstart4,gstart5,gstart6,gstart7,gst0,gst1,gst2,gst3,gst4,gst5,gst6,gst7;
    wire [3:0] state;
    wire pmod_2,pmod_1,pmod_4;	
    
     assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
     debounce db2(db_rst,reset,clk_16);
     debounce db3(db_start,start,clk_16);

     clock_divisor clk_wiz_0_inst(
        .clk(clk),
        .clk27(clk_27),
        .clk17(clk_17),
        .clk22(clk_22),
        .clk16(clk_16),
        .clk20(clk_20),
        .clk1(clk_25MHz)
      );
    
    SampleDisplay keyboard(
        .key_return_D(key_return_D),
        .key_return_L(key_return_L),
        .key_return_E(key_return_E),
        .key_return_R(key_return_R),
        .key_return_U(key_return_U),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)
        );
        
    CreateLargePulse #(.PULSE_SIZE(20)) c1 (
             .large_pulse(larger_signal_D),
             .small_pulse(key_return_D),
             .rst(db_rst),
             .clk(clk)
        );
        
    CreateLargePulse #(.PULSE_SIZE(20)) c2(
              .large_pulse(larger_signal_L),
              .small_pulse(key_return_L),
              .rst(db_rst),
              .clk(clk)
          );
                
     CreateLargePulse #(.PULSE_SIZE(20)) c3(
              .large_pulse(larger_signal_E),
              .small_pulse(key_return_E),
              .rst(db_rst),
              .clk(clk)
           );
     CreateLargePulse #(.PULSE_SIZE(20)) c4(
              .large_pulse(larger_signal_R),
              .small_pulse(key_return_R),
              .rst(db_rst),
              .clk(clk)
             );
             
      CreateLargePulse #(.PULSE_SIZE(20)) c5(
             .large_pulse(larger_signal_U),
             .small_pulse(key_return_U),
             .rst(db_rst),
             .clk(clk)
          );
          
   power_counter power_counter(
	.clk(clk_17), 
	.rst(rst),
	.power(power),
	.state(state),
	.new_power(new_power)
	);
	
	seven_segment_display seven_segment_display(
	.digit(digit), 
	.AN(AN), 
	.clk(clk_17), 
	.power(new_power)
	);

	seven_segment_transform seven_segment_transform(
	.SEG(SEG), 
	.digit(digit)
	);
    
    LFSR ran(outrandom,clk_17, rst);
	
	pix_gen pix_gen_inst(
    .clk(clk_20),
    .rst(rst),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt),	
	.pixel_plant(pixel_plant),
	.pixel_bullet(pixel_bullet),
	.pixel_zombie(pixel_zombie),
	.pixel_zombie2(pixel_zombie2),	
	.pixel_menu(pixel_menu),
	.larger_signal1(larger_signal_D),
	.larger_signal2(larger_signal_L),
	.larger_signal3(larger_signal_E),
	.larger_signal4(larger_signal_R),
	.larger_signal5(larger_signal_U),
	.zombie_rst(outrandom),
	.power(power),
    .new_power(new_power),	
	.state(state),
	.pixel(pixel),
	.position0(position0),
	.position1(position1),
	.position2(position2),
	.position3(position3),
	.position4(position4),
	.position5(position5),
	.position6(position6),
	.position7(position7),
	.gpos0(gpos0),
	.gpos1(gpos1),
	.gpos2(gpos2),
	.gpos3(gpos3),
	.gpos0_1(gpos0_1),
	.gpos1_1(gpos1_1),
	.gpos2_1(gpos2_1),
	.gpos3_1(gpos3_1),
	.pos0(pos0),
	.pos1(pos1),
	.pos2(pos2),
	.pos3(pos3),
	.pos4(pos4),
	.pos5(pos5),
	.pos6(pos6),
	.pos7(pos7),
	.gstart0(gstart0),
	.gstart1(gstart1),
	.gstart2(gstart2),
	.gstart3(gstart3),
	.gstart4(gstart4),
	.gstart5(gstart5),
	.gstart6(gstart6),
	.gstart7(gstart7),
	.gst0(gst0),
    .gst1(gst1),
	.gst2(gst2),
	.gst3(gst3),
	.gst4(gst4),
	.gst5(gst5),
	.gst6(gst6),
	.gst7(gst7),
	.LED(led)
    );
    
    assign LED[0]=(led[0]==1)?1:0;
    assign LED[1]=(led[1]==1)?1:0;
    assign LED[2]=(led[2]==1)?1:0;
    assign LED[3]=(led[3]==1)?1:0;
    assign LED[4]=(led[4]==1)?1:0;
    assign LED[5]=(led[5]==1)?1:0;
    
    assign LED[6]=(led[6]==1)?1:0;
    assign LED[7]=(led[7]==1)?1:0;
    assign LED[8]=(led[8]==1)?1:0;
    assign LED[9]=(led[9]==1)?1:0;
    assign LED[10]=(led[10]==1)?1:0;
    assign LED[11]=(led[11]==1)?1:0;
    assign LED[12]=(led[12]==1)?1:0;
    assign LED[13]=(led[13]==1)?1:0;
    assign LED[14]=(led[14]==1)?1:0;
    assign LED[15]=(led[15]==1)?1:0;
    
    mem_addr_gen  mem_addr_gen_inst(
    .clk(clk_22),
    .rst(rst),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt),
	.position0(position0),
	.position1(position1),
	.position2(position2),
	.position3(position3),
	.position4(position4),
	.position5(position5),
	.position6(position6),
	.position7(position7),
	.gpos0(gpos0),
	.gpos1(gpos1),
	.gpos2(gpos2),
	.gpos3(gpos3),
	.gpos0_1(gpos0_1),
	.gpos1_1(gpos1_1),
	.gpos2_1(gpos2_1),
	.gpos3_1(gpos3_1),
	.pos0(pos0),
	.pos1(pos1),
	.pos2(pos2),
	.pos3(pos3),
	.pos4(pos4),
	.pos5(pos5),
	.pos6(pos6),
	.pos7(pos7),
	.gstart0(gstart0),
	.gstart1(gstart1),
	.gstart2(gstart2),
	.gstart3(gstart3),
	.gstart4(gstart4),
	.gstart5(gstart5),
	.gstart6(gstart6),
	.gstart7(gstart7),
	.gst0(gst0),
    .gst1(gst1),
	.gst2(gst2),
	.gst3(gst3),
	.gst4(gst4),
	.gst5(gst5),
	.gst6(gst6),
	.gst7(gst7),
    .pixel_addr1(pixel_addr_plant) ,
    .pixel_addr2(pixel_addr_bullet) ,
    .pixel_addr3(pixel_addr_zombie) ,
    .pixel_addr4(pixel_addr_zombie2)
    );
     
	 
	mem_addr_gen_menu mem_addr_gen_menu(
    .clk(clk_22),
    .rst(rst),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt),
	.state(state),
    .pixel_addr_menu(pixel_addr_menu)
    );
 
    blk_mem_gen_0 blk_mem_gen_0_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_plant),
      .dina(data[11:0]),
      .douta(pixel_plant)
    ); 
	
	blk_mem_gen_1 blk_mem_gen_1_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_bullet),
      .dina(data[11:0]),
      .douta(pixel_bullet)
    ); 
	
    blk_mem_gen_2 blk_mem_gen_2_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_zombie),
      .dina(data[11:0]),
      .douta(pixel_zombie)
    ); 	
    
    blk_mem_gen_3 blk_mem_gen_3_inst(
          .clka(clk_25MHz),
          .wea(0),
          .addra(pixel_addr_menu),
          .dina(data[11:0]),
          .douta(pixel_menu)
        );  
		
    blk_mem_gen_4 blk_mem_gen_4_inst(
          .clka(clk_25MHz),
          .wea(0),
          .addra(pixel_addr_zombie2),
          .dina(data[11:0]),
          .douta(pixel_zombie2)
        ); 		

    vga_controller   vga_inst(
      .pclk(clk_25MHz),
      .reset(rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );

    music musicstart(
        .clk(clk),
        .reset(rst),
        .pmod_1(pmod_1),
        .pmod_2(pmod_2),
        .pmod_4(pmod_4)
    );
 

endmodule



