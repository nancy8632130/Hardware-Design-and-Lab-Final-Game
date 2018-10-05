module mem_addr_gen(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input [10:0] position0,
   input [10:0] position1,
   input [10:0] position2,
   input [10:0] position3,
   input [10:0] position4,
   input [10:0] position5,
   input [10:0] position6,
   input [10:0] position7,
   input [10:0]gpos0,
   input [10:0]gpos1,
   input [10:0]gpos2,
   input [10:0]gpos3,
   input [10:0] gpos0_1,
   input [10:0] gpos1_1,
   input [10:0] gpos2_1,
   input [10:0] gpos3_1,
   input pos0,
   input pos1,
   input pos2,
   input pos3,
   input pos4,
   input pos5,
   input pos6,
   input pos7,
   input gstart0,
   input gstart1,
   input gstart2,
   input gstart3,
   input gstart4,
   input gstart5,
   input gstart6,
   input gstart7,
   input gst0,
   input gst1,
   input gst2,
   input gst3,
   input gst4,
   input gst5,
   input gst6,
   input gst7,
   output [16:0] pixel_addr1, //plant
   output [16:0] pixel_addr2, //bullet
   output [16:0] pixel_addr3 , //zombie
   output [16:0] pixel_addr4 //zombie
   );
    
	reg [16:0] pixel_addr1;	//plant
	reg [16:0] pixel_addr2;	//bullet
	reg [16:0] pixel_addr3;	//zombie
    reg [16:0] pixel_addr4;	//zombie
//   assign pixel_addr1 = ((h_cnt)+120*(v_cnt)) % 14400;
//   assign pixel_addr2 = ((h_cnt - 20 - position)+ 50*(v_cnt)) % 2500;
//   assign pixel_addr3 = ((h_cnt + 80 )+120*(v_cnt)) % 14400;   


   
   always @(*) begin
		if ((h_cnt>=0)&&(h_cnt<=119)&&(v_cnt>=0)&&(v_cnt<=119))		//a11 plant
			pixel_addr1 = (h_cnt-0)+120*(v_cnt-0);
		if ((h_cnt>=120)&&(h_cnt<=239)&&(v_cnt>=0)&&(v_cnt<=119))		//a12 plant
			pixel_addr1 = (h_cnt-120)+120*(v_cnt-0);
		if ((h_cnt>=0)&&(h_cnt<=119)&&(v_cnt>=120)&&(v_cnt<=239))		//a21 plant
			pixel_addr1 = (h_cnt-0)+120*(v_cnt-120);
		if ((h_cnt>=120)&&(h_cnt<=239)&&(v_cnt>=120)&&(v_cnt<=239))	//a22 plant
			pixel_addr1 = (h_cnt-120)+120*(v_cnt-120);
		if ((h_cnt>=0)&&(h_cnt<=119)&&(v_cnt>=240)&&(v_cnt<=359))		//a31 plant
			pixel_addr1 = (h_cnt-0)+120*(v_cnt-240);
		if ((h_cnt>=120)&&(h_cnt<=239)&&(v_cnt>=240)&&(v_cnt<=359))	//a32 plant
			pixel_addr1 = (h_cnt-120)+120*(v_cnt-240);
		if ((h_cnt>=0)&&(h_cnt<=119)&&(v_cnt>=360)&&(v_cnt<=479))		//a41 plant
			pixel_addr1 = (h_cnt-0)+120*(v_cnt-360);
		if ((h_cnt>=120)&&(h_cnt<=239)&&(v_cnt>=360)&&(v_cnt<=479))	//a42 plant
			pixel_addr1 = (h_cnt-120)+120*(v_cnt-360);
			
		if ((h_cnt>=120+position0)&&(h_cnt<=139+position0)&&(v_cnt>=10)&&(v_cnt<=29)&&pos0==1)	//a1 bullet
			pixel_addr2 = (h_cnt-117-position0)+20*(v_cnt-10);
		if ((h_cnt>=120+position2)&&(h_cnt<=139+position2)&&(v_cnt>=130)&&(v_cnt<=149)&&pos2==1)	//a2 bullet
			pixel_addr2 = (h_cnt-117-position2)+20*(v_cnt-130);
		if ((h_cnt>=120+position4)&&(h_cnt<=139+position4)&&(v_cnt>=250)&&(v_cnt<=269)&&pos4==1)	//a3 bullet
			pixel_addr2 = (h_cnt-117-position4)+20*(v_cnt-250);
		if ((h_cnt>=120+position6)&&(h_cnt<=139+position6)&&(v_cnt>=370)&&(v_cnt<=389)&&pos6==1)	//a4 bullet
			pixel_addr2 = (h_cnt-117-position6)+20*(v_cnt-370);			
			
	    if ((h_cnt>=240+position1)&&(h_cnt<=259+position1)&&(v_cnt>=10)&&(v_cnt<=29)&&pos1==1)	//a1 bullet
		    pixel_addr2 = (h_cnt-237-position1)+20*(v_cnt-10);
		if ((h_cnt>=240+position3)&&(h_cnt<=259+position3)&&(v_cnt>=130)&&(v_cnt<=149)&&pos3==1)	//a1 bullet
			pixel_addr2 = (h_cnt-237-position3)+20*(v_cnt-130);
	    if ((h_cnt>=240+position5)&&(h_cnt<=259+position5)&&(v_cnt>=250)&&(v_cnt<=269)&&pos5==1)	//a1 bullet
		    pixel_addr2 = (h_cnt-237-position5)+20*(v_cnt-250);
		if ((h_cnt>=240+position7)&&(h_cnt<=259+position7)&&(v_cnt>=370)&&(v_cnt<=389)&&pos7==1)	//a1 bullet
		    pixel_addr2 = (h_cnt-237-position7)+20*(v_cnt-370);
		
		if ((h_cnt>=520-gpos0)&&(h_cnt<=639-gpos0)&&(v_cnt>=0)&&(v_cnt<=119)&&(gstart0==1||gst0==1))		//a1 zombie
			pixel_addr3 = (h_cnt-520+gpos0)+120*(v_cnt-0);
		if ((h_cnt>=520-gpos1)&&(h_cnt<=639-gpos1)&&(v_cnt>=120)&&(v_cnt<=239)&&(gstart1==1||gst1==1))		//a2 zombie
			pixel_addr3 = (h_cnt-520+gpos1)+120*(v_cnt-120);
		if ((h_cnt>=520-gpos2)&&(h_cnt<=639-gpos2)&&(v_cnt>=240)&&(v_cnt<=359)&&(gstart2==1||gst2==1))		//a3 zombie
			pixel_addr3 = (h_cnt-520+gpos2)+120*(v_cnt-240);
		if ((h_cnt>=520-gpos3)&&(h_cnt<=639-gpos3)&&(v_cnt>=360)&&(v_cnt<=479)&&(gstart3==1||gst3==1))		//a4 zombie
			pixel_addr3 = (h_cnt-520+gpos3)+120*(v_cnt-360);	
			
	    if ((h_cnt>=520-gpos0_1)&&(h_cnt<=639-gpos0_1)&&(v_cnt>=0)&&(v_cnt<=119)&&(gstart4==1||gst4==1))		//a1 zombie
			pixel_addr4 = (h_cnt-520+gpos0_1)+120*(v_cnt-0);
		if ((h_cnt>=520-gpos1_1)&&(h_cnt<=639-gpos1_1)&&(v_cnt>=120)&&(v_cnt<=239)&&(gstart5==1||gst5==1))		//a2 zombie
			pixel_addr4 = (h_cnt-520+gpos1_1)+120*(v_cnt-120);
		if ((h_cnt>=520-gpos2_1)&&(h_cnt<=639-gpos2_1)&&(v_cnt>=240)&&(v_cnt<=359)&&(gstart6==1||gst6==1))		//a3 zombie
			pixel_addr4 = (h_cnt-520+gpos2_1)+120*(v_cnt-240);
		if ((h_cnt>=520-gpos3_1)&&(h_cnt<=639-gpos3_1)&&(v_cnt>=360)&&(v_cnt<=479)&&(gstart7==1||gst7==1))		//a4 zombie
			pixel_addr4 = (h_cnt-520+gpos3_1)+120*(v_cnt-360);	
	
		//if ((h_cnt>=300-position)&&(h_cnt<=419-position)&&(v_cnt>=0)&&(v_cnt<=119))		//a1 second zombie
		//	pixel_addr3 = (h_cnt-300+position)+120*(v_cnt-0);			
			
   end
   

endmodule

