module pix_gen(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input [11:0] pixel_plant,
   input [11:0] pixel_bullet,
   input [11:0] pixel_zombie,
   input [11:0] pixel_zombie2,   
   input [11:0] pixel_menu,
   input larger_signal1,
   input larger_signal2,
   input larger_signal3,
   input larger_signal4,
   input larger_signal5,
   //input [3:0]outrandom,
   input [3:0]zombie_rst,
   input [7:0] power,
   output [7:0] new_power,
   output [3:0] state,
   output [11:0] pixel,
   output [10:0] position0,
   output [10:0] position1,
   output [10:0] position2,
   output [10:0] position3,
   output [10:0] position4,
   output [10:0] position5,
   output [10:0] position6,
   output [10:0] position7,
   output [10:0] gpos0,
   output [10:0] gpos1,
   output [10:0] gpos2,
   output [10:0] gpos3,
   output [10:0] gpos0_1,
   output [10:0] gpos1_1,
   output [10:0] gpos2_1,
   output [10:0] gpos3_1,
   output pos0,
   output pos1,
   output pos2,
   output pos3,
   output pos4,
   output pos5,
   output pos6,
   output pos7,
   output gstart0,
   output gstart1,
   output gstart2,
   output gstart3,
   output gstart4,
   output gstart5,
   output gstart6,
   output gstart7,
   output gst0,
   output gst1,
   output gst2,
   output gst3,
   output gst4,
   output gst5,
   output gst6,
   output gst7,
   output [15:0]LED
   );
    
   reg [10:0] position0;
   reg [10:0] position1;
   reg [10:0] position2;
   reg [10:0] position3;
   reg [10:0] position4;
   reg [10:0] position5;
   reg [10:0] position6;
   reg [10:0] position7;
   reg [10:0] gpos0;
   reg [10:0] gpos1;
   reg [10:0] gpos2;
   reg [10:0] gpos3;
   reg [10:0] gpos0_1;
   reg [10:0] gpos1_1;
   reg [10:0] gpos2_1;
   reg [10:0] gpos3_1;
   reg [10:0] position_ghost;
   reg [10:0] position_ghost_2;
   reg [11:0] pixel;
   reg [3:0]state_keyboard;
   reg [3:0]state_keyboard_next;
   reg [3:0]state;
   reg [3:0]state_next;
   parameter S0=4'b0000;
   parameter S1=4'b0001;
   parameter S2=4'b0010;
   parameter S3=4'b0011;
   parameter S4=4'b0100;
   parameter S5=4'b0101;
   parameter S6=4'b0110;
   parameter S7=4'b0111;
   reg temp,temp1;
   reg pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7;
   reg pos0_n,pos1_n,pos2_n,pos3_n,pos4_n,pos5_n,pos6_n,pos7_n;
   reg [7:0]plant_now;
   reg [7:0]plant_now_next;
   reg bdisappear0,bdisappear1,bdisappear2,bdisappear3,bdisappear4,bdisappear5,bdisappear6,bdisappear7,
   bdisappear0_1,bdisappear1_1,bdisappear2_1,bdisappear3_1,bdisappear4_1,bdisappear5_1,bdisappear6_1,bdisappear7_1;
   reg r0,r1,r2,r3,r4,r5,r6,r7,gr0,gr1,gr2,gr3,gstart0,gstart1,gstart2,gstart3,gstart4,gstart5,gstart6,gstart7,gst0,gst1,gst2,gst3,gst4,gst5,gst6,gst7;
   reg [11:0]counter;
   reg [11:0]counter1;
   reg [2:0]temp_counter;
   reg [2:0]temp_counter1;
   reg plantdisappear0,plantdisappear1,plantdisappear2,plantdisappear3,plantdisappear4,plantdisappear5,plantdisappear6,plantdisappear7;
   reg [10:0]bullet_counter0;
   reg [10:0]bullet_counter1;
   reg [10:0]bullet_counter2;
   reg [10:0]bullet_counter3;
   reg [10:0]bullet_counter4;
   reg [10:0]bullet_counter5;
   reg [10:0]bullet_counter6;
   reg [10:0]bullet_counter7;
   reg bullet0,bullet1,bullet2,bullet3,bullet4,bullet5,bullet6,bullet7;
   reg [7:0] new_power;
   reg [7:0] next_new_power;
   
   	reg [25:0] num;
	wire [20:0] next_num;
   
 	assign next_num = num + 1'b1;  
	
   assign LED[1]=(gstart0==1)?1:0;
   assign LED[2]=(gstart1==1)?1:0;
   assign LED[3]=(gstart2==1)?1:0;
   assign LED[4]=(gstart3==1)?1:0;
   assign LED[5]=(gstart4==1)?1:0;
   assign LED[6]=(gstart5==1)?1:0;
   assign LED[7]=(gstart6==1'b1)?1:0;
   assign LED[8]=(gstart7==1'b1)?1:0;
   assign LED[9]=(gst0==1)?1:0;
   assign LED[10]=(gst1==1)?1:0;
   assign LED[11]=(gst2==1)?1:0;
   assign LED[12]=(gst3==1)?1:0;
   assign LED[13]=(gst4==1)?1:0;
   assign LED[14]=(gst5==1)?1:0;
   assign LED[15]=(gst6==1)?1:0;
   assign LED[0]=(gst7==1)?1:0;

   always @ (posedge clk or posedge rst) begin
      if(rst)begin
          state<=S0;
		  new_power <= 0;
       end
       else begin
           state<=state_next;
		   new_power <= next_new_power;	
       end
   end
   
   always@(posedge clk)begin
     if(rst||(state==S3))begin
        gstart0<=0;
        gstart1<=0;
        gstart2<=0;
        gstart3<=0;
		gstart4<=0;
		gstart5<=0;
		gstart6<=0;
		gstart7<=0;
        counter<=12'd0;
        temp_counter<=0;
     end
     else if(state==S2)begin
        if(zombie_rst)begin
           if(counter==12'd0) begin
              if(zombie_rst==1&&gst0!=1)begin
                 gstart0<=1; 
                 counter<=counter+12'd1;
              end           
              if(zombie_rst==2&&gst1!=1)begin
                  gstart1<=1;
                  counter<=counter+12'd1;
              end
              if(zombie_rst==3&&gst2!=1)begin
                  gstart2<=1;
                  counter<=counter+12'd1;
              end
              if(zombie_rst==4&&gst3!=1)begin
                  gstart3<=1;
                  counter<=counter+12'd1;
              end
			  if(zombie_rst==5&&gst4!=1)begin
			      gstart4<=1;
			      counter<=counter+12'd1;
	          end
			  if(zombie_rst==6&&gst5!=1)begin
			      gstart5<=1;
			      counter<=counter+12'd1;
			  end  
			  if(zombie_rst==7&&gst6!=1)begin
			      gstart6<=1;
			      counter<=counter+12'd1;
			  end
			  if(zombie_rst==8&&gst7!=1)begin
			      gstart7<=1;
			      counter<=counter+12'd1;
			  end   
           end
           else begin
              counter<=counter+12'd1;
              if(counter==12'd2800-temp_counter||(bdisappear0==1&&gstart0==1)||(bdisappear1==1&&gstart0==1)||(bdisappear0_1==1&&gstart4==1)||(bdisappear1_1==1&&gstart4==1)
			  ||(bdisappear2==1&&gstart1==1)||(bdisappear3==1&&gstart1==1)||(bdisappear2_1==1&&gstart5==1)||(bdisappear3_1==1&&gstart5==1)||
			  (bdisappear4==1&&gstart2==1)||(bdisappear5==1&&gstart2==1)||(bdisappear4_1==1&&gstart6==1)||(bdisappear5_1==1&&gstart6==1)||
			  (bdisappear6==1&&gstart3==1)||(bdisappear7==1&&gstart3==1)||(bdisappear6_1==1&&gstart7==1)||(bdisappear7_1==1&&gstart7==1))begin
                 counter<=12'd0;
                 if(gstart0==1)gstart0<=0;
                 if(gstart1==1)gstart1<=0;
                 if(gstart2==1)gstart2<=0;
                 if(gstart3==1)gstart3<=0;
				 if(gstart4==1)gstart4<=0;
				 if(gstart5==1)gstart5<=0;
				 if(gstart6==1)gstart6<=0;
				 if(gstart7==1)gstart7<=0;
                 if(temp_counter==3'd7)temp_counter<=3'd0;
                 else temp_counter<=temp_counter+3'd1;
              end
           end
          end
          
          
      end
    end 
    
   
	
	
	always@(posedge clk)begin
     if(rst||(state==S3))begin
        gst0<=0;
        gst1<=0;
        gst2<=0;
        gst3<=0;
		gst4<=0;
		gst5<=0;
		gst6<=0;
		gst7<=0;
        counter1<=12'd0;
        temp_counter1<=0;
     end
     else if(state==S2)begin
        if(zombie_rst)begin
           if(counter1==12'd1) begin
              if(zombie_rst==1&&gstart0!=1)begin
                 gst0<=1;
                 counter1<=counter1+12'd1;
              end
              if(zombie_rst==2&&gstart1!=1)begin
                 gst1<=1;
                 counter1<=counter1+12'd1;
              end
              if(zombie_rst==3&&gstart2!=1)begin
                 gst2<=1;
                 counter1<=counter1+12'd1;
              end
              if(zombie_rst==4&&gstart3!=1)begin
                 gst3<=1;
                 counter1<=counter1+12'd1;
              end
			  if(zombie_rst==5&&gstart4!=1)begin
			     gst4<=1;
			     counter1<=counter1+12'd1;
			  end
			  if(zombie_rst==6&&gstart5!=1)begin
			     gst5<=1;
			     counter1<=counter1+12'd1;
			  end
			  if(zombie_rst==7&&gstart6!=1)begin
			     gst6<=1;
			     counter1<=counter1+12'd1;
			  end
			  if(zombie_rst==8&&gstart7!=1)begin
			     gst7<=1;
                 counter1<=counter1+12'd1;
              end
           end
           else begin
              counter1<=counter1+12'd1;
              if(counter1==12'd2800-temp_counter1||(bdisappear0==1&&gst0==1)||(bdisappear1==1&&gst0==1)||(bdisappear0_1==1&&gst4==1)||(bdisappear1_1==1&&gst4==1)||
			  (bdisappear2==1&&gst1==1)||(bdisappear3==1&&gst1==1)||(bdisappear2_1==1&&gst5==1)||(bdisappear3_1==1&&gst5==1)||
			  (bdisappear4==1&&gst2==1)||(bdisappear5==1&&gst2==1)||(bdisappear4_1==1&&gst6==1)||(bdisappear5_1==1&&gst6==1)||
			  (bdisappear6==1&&gst3==1)||(bdisappear7==1&&gst3==1)||(bdisappear6_1==1&&gst7==1)||(bdisappear7_1==1&&gst7==1))begin
                 counter1<=12'd0;
                 if(gst0==1)gst0<=0;
                 if(gst1==1)gst1<=0;
                 if(gst2==1)gst2<=0;
                 if(gst3==1)gst3<=0;
				 if(gst4==1)gst4<=0;
				 if(gst5==1)gst5<=0;
				 if(gst6==1)gst6<=0;
				 if(gst7==1)gst7<=0;
                 if(temp_counter1==3'd7)temp_counter1<=3'd0;
                 else temp_counter1<=temp_counter1+3'd1;
              end
           end
          end
        
      end
    end      
   
   always @ (posedge clk or posedge rst) begin
        if(rst||(state==S3))begin
           gpos0<=0;
           gpos1<=0;
           gpos2<=0;
           gpos3<=0;
		   gpos0_1<=0;
		   gpos1_1<=0;
           gpos2_1<=0;
           gpos3_1<=0;
			num <= 0;		   
        end
        else begin 
			if (!num[2]) begin
				num <= next_num;
				   gpos0<=gpos0;
				   gpos1<=gpos1;
				   gpos2<=gpos2;
				   gpos3<=gpos3;
				   gpos0_1<=gpos0_1;
				   gpos1_1<=gpos1_1;
				   gpos2_1<=gpos2_1;
				   gpos3_1<=gpos3_1;				
			end
			else if(state==S2) begin
				num <= 0;
				
				if(gpos0<= 520&&(gstart0==1||gst0==1)) gpos0<= gpos0 + 1;
				else gpos0<=0;
				if(gpos0_1<= 520&&(gstart4==1||gst4==1)) gpos0_1<= gpos0_1 + 1;
				else gpos0_1<=0;
				
				
				
				if(gpos0<120&&gpos0_1==1&&gpos0>0)gpos0_1<=1;
				if(gpos0_1<120&&gpos0==1&&gpos0_1>0)gpos0<=1;
				
				if(gpos1<= 520&&(gstart1==1||gst1==1)) gpos1<= gpos1 + 1;
				else gpos1<=0;
				if(gpos1_1<= 520&&(gstart5==1||gst5==1)) gpos1_1<= gpos1_1 + 1;
				else gpos1_1<=0;
				
				if(gpos1<120&&gpos1_1==1&&gpos1>0)gpos1_1<=1;
				if(gpos1_1<120&&gpos1==1&&gpos1_1>0)gpos1<=1;
				
				if(gpos2<= 520&&(gstart2==1||gst2==1))gpos2<= gpos2 + 1;
				else gpos2<=0;
				if(gpos2_1<= 520&&(gstart6==1||gst6==1))gpos2_1<= gpos2_1 + 1;
				else gpos2_1<=0;
				
				if(gpos2<120&&gpos2_1==1&&gpos2>0)gpos2_1<=1;
				if(gpos2_1<120&&gpos2==1&&gpos2_1>0)gpos2<=1;
				
				if(gpos3<= 520&&(gstart3==1||gst3==1))gpos3<= gpos3 + 1;
				else gpos3<=0;
				if(gpos3_1<= 520&&(gstart7==1||gst7==1))gpos3_1<= gpos3_1 + 1;
				else gpos3_1<=0;
				
				if(gpos3<120&&gpos3_1==1&&gpos3>0)gpos3_1<=1;
				if(gpos3_1<120&&gpos3==1&&gpos3_1>0)gpos3<=1;
				
				if(bdisappear0==1||bdisappear1==1)gpos0<=0;
				if(bdisappear0_1==1||bdisappear1_1==1)gpos0_1<=0;
				if(bdisappear2==1||bdisappear3==1)gpos1<=0;
				if(bdisappear2_1==1||bdisappear3_1==1)gpos1_1<=0;
				if(bdisappear4==1||bdisappear5==1)gpos2<=0;
				if(bdisappear4_1==1||bdisappear5_1==1)gpos2_1<=0;
				if(bdisappear6==1||bdisappear7==1)gpos3<=0;
				if(bdisappear6_1==1||bdisappear7_1==1)gpos3_1<=0;
			end
		end
    end
	
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter0<=0;
	  bullet0<=0; 
	end
	else begin 
	  if(position0==0)begin
	     if(bullet_counter0<=11'd20&&bullet_counter0>=0)begin
		    bullet0<=0;
			bullet_counter0<=bullet_counter0+11'd1;
	     end
		 else begin 
		    bullet0<=1;
			bullet_counter0<=0;
		 end
	  end
	  else begin
	    bullet0<=1;
	  end
	end
  end
  
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter1<=0;
	  bullet1<=0;
	end
	else begin 
	  if(position1==0)begin
	     if(bullet_counter1<=11'd20&&bullet_counter1>=0)begin
		    bullet1<=0;
			bullet_counter1<=bullet_counter1+11'd1;		
	     end
		 else begin 
		    bullet1<=1;
			bullet_counter1<=0;		
		 end
	  end
	  else begin
	    bullet1<=1;
	  end
	end
  end
  
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter2<=0;
	  bullet2<=0;  
	end
	else begin 
	  if(position2==0)begin
	     if(bullet_counter2<=11'd20&&bullet_counter2>=0)begin
		    bullet2<=0;
			bullet_counter2<=bullet_counter2+11'd1;		
	     end
		 else begin 
		    bullet2<=1;
			bullet_counter2<=0;		
		 end
	  end
	  else begin
	    bullet2<=1;	
	  end
	end
  end
  
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter3<=0;
	  bullet3<=0;
	end
	else begin 
	  if(position3==0)begin
	     if(bullet_counter3<=11'd20&&bullet_counter3>=0)begin
		    bullet3<=0;
			bullet_counter3<=bullet_counter3+11'd1;	
	     end
		 else begin 
		    bullet3<=1;
			bullet_counter3<=0;		
		 end
	  end
	  else begin
	    bullet3<=1;	
	  end
	end
  end
  
  
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter4<=0;
	  bullet4<=0; 
	end
	else begin 
	  if(position4==0)begin
	     if(bullet_counter4<=11'd20&&bullet_counter4>=0)begin
		    bullet4<=0;
			bullet_counter4<=bullet_counter4+11'd1;			
	     end
		 else begin 
		    bullet4<=1;
			bullet_counter4<=0;			
		 end
	  end
	  else begin
	    bullet4<=1;		
	  end
	end
  end
  
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter5<=0;
	  bullet5<=0; 
	end
	else begin 
	  if(position5==0)begin
	     if(bullet_counter5<=11'd20&&bullet_counter5>=0)begin
		    bullet5<=0;
			bullet_counter5<=bullet_counter5+11'd1;				
	     end
		 else begin 
		    bullet5<=1;
			bullet_counter5<=0;			
		 end
	  end
	  else begin
	    bullet5<=1;	
	  end
	end
  end
  
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter6<=0;
	  bullet6<=0; 
	end
	else begin 
	  if(position6==0)begin
	     if(bullet_counter6<=11'd20&&bullet_counter6>=0)begin
		    bullet6<=0;
			bullet_counter6<=bullet_counter6+11'd1;			
	     end
		 else begin 
		    bullet6<=1;
			bullet_counter6<=0;			
		 end
	  end
	  else begin
	    bullet6<=1;	 		
	  end
	end
  end
  
  always @ (posedge clk or posedge rst) begin    //plant0
	if(rst||(state==S3))begin
	  bullet_counter7<=0;
	  bullet7<=0;
	end
	else begin 
	  if(position7==0)begin
	     if(bullet_counter7<=11'd20&&bullet_counter7>=0)begin
		    bullet7<=0;
			bullet_counter7<=bullet_counter7+11'd1;			
	     end
		 else begin 
		    bullet7<=1;
			bullet_counter7<=0;			
		 end
	  end
	  else begin
	    bullet7<=1;		
	  end
	end
  end
  
             
   always @ (posedge clk or posedge rst) begin
         if(rst||(state==S3))begin
             position0 <= 0;
             position1 <= 0;
             position2 <= 0;
             position3 <= 0;
             position4 <= 0;
             position5 <= 0;
             position6 <= 0;
             position7 <= 0;
          end
          else begin
             if(position0 <= 420&&pos0==1&&bullet0==1)position0<= position0 + 1;
             else position0 <= 0;
             if(position1 <= 420&&pos1==1&&bullet1==1&&((240+position1>=139+position0)||(240+position1<=101+position0)))position1<= position1 + 1;
             else position1 <= 0;
             if(position2 <= 420&&pos2==1&&bullet2==1)position2<= position2 + 1;
             else position2 <= 0;           
             if(position3 <= 420&&pos3==1&&bullet3==1&&((240+position3>=139+position2)||(240+position3<=101+position2)))position3<= position3 + 1;
             else position3 <= 0;
             if(position4 <= 420&&pos4==1&&bullet4==1)position4<= position4 + 1;
             else position4 <= 0;
             if(position5 <= 420&&pos5==1&&bullet5==1&&((240+position5>=139+position4)||(240+position5<=101+position4)))position5<= position5 + 1;
             else position5 <= 0;
             if(position6 <= 420&&pos6==1&&bullet6==1)position6<= position6 + 1;
             else position6 <= 0;
             if(position7 <= 420&&pos7==1&&bullet7==1&&((240+position7>=139+position6)||(240+position7<=101+position6)))position7<= position7 + 1; 
             else position7 <= 0;
             if(bdisappear0==1)position0 <=0;
             if(bdisappear0_1==1)position0 <=0;
             if(bdisappear1==1)position1 <=0;
             if(bdisappear1_1==1)position1 <=0;
             if(bdisappear2==1)position2 <=0;
             if(bdisappear2_1==1)position2 <=0;
             if(bdisappear3==1)position3 <=0;
             if(bdisappear3_1==1)position3 <=0;
             if(bdisappear4==1)position4 <=0;
             if(bdisappear4_1==1)position4 <=0;
             if(bdisappear5==1)position5 <=0;
             if(bdisappear5_1==1)position5 <=0;
             if(bdisappear6==1)position6 <=0;
             if(bdisappear6_1==1)position6 <=0;
             if(bdisappear7==1)position7 <=0;
             if(bdisappear7_1==1)position7 <=0;
            
          end 
    end
    
    always @ (posedge clk ) begin
      if(rst||(state==S3))begin
         state_keyboard<=S0;
         pos0<=1'b0;
         pos1<=1'b0;
         pos2<=1'b0;
         pos3<=1'b0;
         pos4<=1'b0;
         pos5<=1'b0;
         pos6<=1'b0;
         pos7<=1'b0;
      end
      else begin
        state_keyboard<=state_keyboard_next;
        pos0<=pos0_n;
        pos1<=pos1_n;
        pos2<=pos2_n;
        pos3<=pos3_n;
        pos4<=pos4_n;
        pos5<=pos5_n;
        pos6<=pos6_n;
        pos7<=pos7_n;
      end
    end
    
      
    always@(*)begin
      state_keyboard_next=state_keyboard;
      case(state_keyboard)
        S0:begin
           plant_now=8'b00000001;
           if(larger_signal1)begin//down
              state_keyboard_next=S2;
              pos0_n=pos0;
              pos1_n=pos1;
              pos2_n=pos2;
              pos3_n=pos3;
              pos4_n=pos4;
              pos5_n=pos5;
              pos6_n=pos6;
              pos7_n=pos7;
			next_new_power = power;				  
           end
           else if(larger_signal4)begin  //right
              state_keyboard_next=S1;
              pos0_n=pos0;
              pos1_n=pos1;
              pos2_n=pos2;
              pos3_n=pos3;
              pos4_n=pos4;
              pos5_n=pos5;
              pos6_n=pos6;
              pos7_n=pos7;
			next_new_power = power;				  
           end
           else if(larger_signal3&&(new_power >= 8'd10))begin//enter
              pos0_n=1'b1;
              pos1_n=pos1;
              pos2_n=pos2;
              pos3_n=pos3;
              pos4_n=pos4;
              pos5_n=pos5;
              pos6_n=pos6;
              pos7_n=pos7;
			next_new_power = power - 8'd10;
           end
           else begin
              pos0_n=pos0;
              pos1_n=pos1;
              pos2_n=pos2;
              pos3_n=pos3;
              pos4_n=pos4;
              pos5_n=pos5;
              pos6_n=pos6;
              pos7_n=pos7;
			next_new_power = power;			  
           end
         end
         S1:begin
           plant_now=8'b00000010;
           if(larger_signal1)begin//down
              state_keyboard_next=S3;
              pos1_n=pos1;
              pos0_n=pos0;
              pos2_n=pos2;
              pos3_n=pos3;
              pos4_n=pos4;
              pos5_n=pos5;
              pos6_n=pos6;
              pos7_n=pos7;
			next_new_power = power;				  
           end
           else if(larger_signal2)begin//left
              state_keyboard_next=S0;
              pos1_n=pos1;
              pos0_n=pos0;
              pos2_n=pos2;
              pos3_n=pos3;
              pos4_n=pos4;
              pos5_n=pos5;
              pos6_n=pos6;
              pos7_n=pos7;
			next_new_power = power;				  
           end
           else if(larger_signal3&&(new_power >= 8'd10))begin//enter
               pos1_n=1'b1;
               pos0_n=pos0;
               pos2_n=pos2;
               pos3_n=pos3;
               pos4_n=pos4;
               pos5_n=pos5;
               pos6_n=pos6;
               pos7_n=pos7;
			next_new_power = power - 8'd10;			   
           end
           else begin
               pos1_n=pos1;
               pos0_n=pos0;
               pos2_n=pos2;
               pos3_n=pos3;
               pos4_n=pos4;
               pos5_n=pos5;
               pos6_n=pos6;
               pos7_n=pos7;
			next_new_power = power;				   
           end
         end
		 S2:begin
           plant_now=8'b00000100;
           if(larger_signal1)begin//down
              state_keyboard_next=S4;
              pos2_n=pos2;
              pos0_n=pos0;
              pos1_n=pos1;
              pos3_n=pos3;
              pos4_n=pos4;
              pos5_n=pos5;
              pos6_n=pos6;
              pos7_n=pos7;
			next_new_power = power;			
		   end else if(larger_signal4)begin  //right
		      state_keyboard_next=S3;  
		      pos2_n=pos2;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end else if(larger_signal5)begin//up
		      state_keyboard_next=S0;
		      pos2_n=pos2;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end
		   else if(larger_signal3&&(new_power >= 8'd10))begin//enter
		      pos2_n=1'b1;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
		      state_keyboard_next=state_keyboard;
			next_new_power = power - 8'd10;			  
		   end
		   else begin  
			  state_keyboard_next=state_keyboard;
			  pos2_n=pos2;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos3_n=pos3;
			  pos4_n=pos4;
			  pos5_n=pos5;
			  pos6_n=pos6;
			  pos7_n=pos7;
			next_new_power = power;				  
		   end
		  end
		  S3:begin
		    plant_now=8'b00001000;
			if(larger_signal1)begin//down
			  state_keyboard_next=S5;
			  pos3_n=pos3;
			  pos2_n=pos2;
			  pos1_n=pos1;
			  pos4_n=pos4;
			  pos5_n=pos5;
			  pos6_n=pos6;
			  pos7_n=pos7;
			  pos0_n=pos0;
			next_new_power = power;				  
			end else if(larger_signal2)begin//left
		      state_keyboard_next=S2;
		      pos3_n=pos3;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end else if(larger_signal5)begin//up
		      state_keyboard_next=S1;
		      pos3_n=pos3;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end
		   else if(larger_signal3&&(new_power >= 8'd10))begin//enter
		      pos3_n=1'b1;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
		      state_keyboard_next=state_keyboard;
			next_new_power = power - 8'd10;			  
		   end
		   else begin  
			  state_keyboard_next=state_keyboard;
			  pos3_n=pos3;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos2_n=pos2;
			  pos3_n=pos3;
			  pos5_n=pos5;
			  pos6_n=pos6;
			  pos7_n=pos7;
			next_new_power = power;				  
		   end
		  end
		  S4:begin
		    plant_now=8'b00010000;
			if(larger_signal1)begin//down
			  state_keyboard_next=S6;
			  pos4_n=pos4;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos2_n=pos2;
			  pos3_n=pos3;
			  pos5_n=pos5;
			  pos6_n=pos6;
			  pos7_n=pos7;
			next_new_power = power;				  
			end else if(larger_signal4)begin  //right
		      state_keyboard_next=S5;
		      pos4_n=pos4;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end else if(larger_signal5)begin//up
		      state_keyboard_next=S2;
		      pos4_n=pos4;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos6_n=pos6;
		      pos5_n=pos5;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end
		   else if(larger_signal3&&(new_power >= 8'd10))begin//enter
		      pos4_n=1'b1;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      pos7_n=pos7;
		      state_keyboard_next=state_keyboard;
			next_new_power = power - 8'd10;			  
		   end
		   else begin  
			  state_keyboard_next=state_keyboard;
			  pos4_n=pos4;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos2_n=pos2;
			  pos3_n=pos3;
			  pos5_n=pos5;
			  pos6_n=pos6;
			  pos7_n=pos7;
			next_new_power = power;				  
		   end
		  end
		  S5:begin
		    plant_now=8'b00100000;
			if(larger_signal1)begin//down
			  state_keyboard_next=S7;
			  pos5_n=pos5;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos2_n=pos2;
			  pos3_n=pos3;
			  pos4_n=pos4;
			  pos6_n=pos6;
			  pos7_n=pos7;
			next_new_power = power;				  
			end else if(larger_signal2)begin//left
		      state_keyboard_next=S4;
		      pos5_n=pos5;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos6_n=pos6;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end else if(larger_signal5)begin//up
		      state_keyboard_next=S3;
		      pos5_n=pos5;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos6_n=pos6;
		      pos7_n=pos7;
			next_new_power = power;				  
		   end
		   else if(larger_signal3&&(new_power >= 8'd10))begin//enter
		      pos5_n=1'b1;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos6_n=pos6;
		      pos7_n=pos7;
		      state_keyboard_next=state_keyboard;
			next_new_power = power - 8'd10;			  
		   end
		   else begin  
			  state_keyboard_next=state_keyboard;
			  pos5_n=pos5;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos2_n=pos2;
			  pos3_n=pos3;
			  pos4_n=pos4;
			  pos6_n=pos6;
			  pos7_n=pos7;
			next_new_power = power;				  
		   end
		  end
		  S6:begin
		    plant_now=8'b01000000;
			if(larger_signal4)begin  //right
		      state_keyboard_next=S7;
		      pos6_n=pos6;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos7_n=pos7;
			next_new_power = power;				  
		    end else if(larger_signal5)begin//up
		      state_keyboard_next=S4;
		      pos6_n=pos6;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos7_n=pos7;
			next_new_power = power;				  
		    end
		    else if(larger_signal3&&(new_power >= 8'd10))begin//enter
		      pos6_n=1'b1;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos7_n=pos7;
		      state_keyboard_next=state_keyboard;
			next_new_power = power - 8'd10;			  
		   end
		   else begin  
			  state_keyboard_next=state_keyboard;
			  pos6_n=pos6;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos2_n=pos2;
			  pos3_n=pos3;
			  pos4_n=pos4;
			  pos5_n=pos5;
			  pos7_n=pos7;
			next_new_power = power;				  
		   end
		  end
		  S7:begin
		    plant_now=8'b10000000;
			if(larger_signal2)begin//left
		      state_keyboard_next=S6;
		      pos7_n=pos7;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
			next_new_power = power;			  
		    end else if(larger_signal5)begin//up
		      state_keyboard_next=S5;
		      pos7_n=pos7;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
			next_new_power = power;				  
		    end
		    else if(larger_signal3&&(new_power >= 8'd10))begin//enter
		      pos7_n=1'b1;
		      pos0_n=pos0;
		      pos1_n=pos1;
		      pos2_n=pos2;
		      pos3_n=pos3;
		      pos4_n=pos4;
		      pos5_n=pos5;
		      pos6_n=pos6;
		      state_keyboard_next=state_keyboard;
			next_new_power = power - 8'd10;			  
		   end
		   else begin  
			  state_keyboard_next=state_keyboard;
			  pos7_n=pos7;
			  pos0_n=pos0;
			  pos1_n=pos1;
			  pos2_n=pos2;
			  pos3_n=pos3;
			  pos4_n=pos4;
			  pos5_n=pos5;
			  pos6_n=pos6;
			next_new_power = power;				  
		   end
		  end
			
       endcase
                 
   end
      
   
   
   always @ (posedge clk or posedge rst) begin
     if(rst||(state==S3))begin
         bdisappear0<=0;
         bdisappear1<=0;
         bdisappear2<=0;
         bdisappear3<=0;
         bdisappear4<=0;
         bdisappear5<=0;
         bdisappear6<=0;
         bdisappear7<=0;
		 bdisappear0_1<=0;
		 bdisappear1_1<=0;
		 bdisappear2_1<=0;
		 bdisappear3_1<=0;
		 bdisappear4_1<=0;
		 bdisappear5_1<=0;
		 bdisappear6_1<=0;
		 bdisappear7_1<=0;
     end
     else begin   
         if(position0==0)bdisappear0<=0;
         else if(520-gpos0==120+position0||520-gpos0+1==120+position0||520-gpos0==120+position0+1)bdisappear0<=1;
		 if(position0==0)bdisappear0_1<=0;
         else if(520-gpos0_1==120+position0||520-gpos0_1+1==120+position0||520-gpos0_1==120+position0+1)bdisappear0_1<=1;
		 
         if(position1==0)bdisappear1<=0;
         else if(520-gpos0==240+position1||520-gpos0+1==240+position1||520-gpos0==240+position1+1)bdisappear1<=1;
		 if(position1==0)bdisappear1_1<=0;
         else if(520-gpos0_1==240+position1||520-gpos0_1+1==240+position1||520-gpos0_1==240+position1+1)bdisappear1_1<=1;
        
		 if(position2==0)bdisappear2<=0;
         else if(520-gpos1==120+position2||520-gpos1+1==120+position2||520-gpos1==120+position2+1)bdisappear2<=1;
		 if(position2==0)bdisappear2_1<=0;
         else if(520-gpos1_1==120+position2||520-gpos1_1+1==120+position2||520-gpos1_1==120+position2+1)bdisappear2_1<=1;
         
         if(position3==0)bdisappear3<=0;
         else if(520-gpos1==240+position3||520-gpos1+1==240+position3||520-gpos1==240+position3+1)bdisappear3<=1;
		 if(position3==0)bdisappear3_1<=0;
         else if(520-gpos1_1==240+position3||520-gpos1_1+1==240+position3||520-gpos1_1==240+position3+1)bdisappear3_1<=1;
		 
         if(position4==0)bdisappear4<=0;
         else if(520-gpos2==120+position4||520-gpos2+1==120+position4||520-gpos2==120+position4+1)bdisappear4<=1;
		 if(position4==0)bdisappear4_1<=0;
         else if(520-gpos2_1==120+position4||520-gpos2_1+1==120+position4||520-gpos2_1==120+position4+1)bdisappear4_1<=1;
		 
         if(position5==0)bdisappear5<=0;
		 else if(520-gpos2==240+position5||520-gpos2+1==240+position5||520-gpos2==240+position5+1)bdisappear5<=1;
		 if(position5==0)bdisappear5_1<=0;
		 else if(520-gpos2_1==240+position5||520-gpos2_1+1==240+position5||520-gpos2_1==240+position5+1)bdisappear5_1<=1;
		 
         if(position6==0)bdisappear6<=0;
         else if(520-gpos3==120+position6||520-gpos3+1==120+position6||520-gpos3==120+position6+1)bdisappear6<=1;
		 if(position6==0)bdisappear6_1<=0;
         else if(520-gpos3_1==120+position6||520-gpos3_1+1==120+position6||520-gpos3_1==120+position6+1)bdisappear6_1<=1;
         
		 if(position7==0)bdisappear7<=0;
         else if(520-gpos3==240+position7||520-gpos3+1==240+position7||520-gpos3==240+position7+1)bdisappear7<=1;
		 if(position7==0)bdisappear7_1<=0;
         else if(520-gpos3_1==240+position7||520-gpos3_1+1==240+position7||520-gpos3_1==240+position7+1)bdisappear7_1<=1;
      end
   end
   
   always@ (posedge clk or posedge rst) begin
      if(rst||(state==S3))begin 
	     plantdisappear0<=0;
		 plantdisappear1<=0;
		 plantdisappear2<=0;
		 plantdisappear3<=0;
		 plantdisappear4<=0;
		 plantdisappear5<=0;
		 plantdisappear6<=0;
		 plantdisappear7<=0;
	  end
	  else begin  
	    if(520-gpos0==239||520-gpos0_1==239)plantdisappear1<=1;
        if(520-gpos1==239||520-gpos1_1==239)plantdisappear3<=1;
		if(520-gpos2==239||520-gpos2_1==239)plantdisappear5<=1;
		if(520-gpos3==239||520-gpos3_1==239)plantdisappear7<=1;
		if(520-gpos0==119||520-gpos0_1==119)plantdisappear0<=1;
		if(520-gpos1==119||520-gpos1_1==119)plantdisappear2<=1;
		if(520-gpos2==119||520-gpos2_1==119)plantdisappear4<=1;
		if(520-gpos3==119||520-gpos3_1==119)plantdisappear6<=1;
      end
	end
      
   always @ (*) begin
      case(state)
         S0:begin
//state control
			if (larger_signal3) state_next = S2;
			else state_next = S0;
//pixel select
		    pixel = 12'h000;		
			if ((h_cnt>=190)&&(h_cnt<=217)&&(v_cnt>=46)&&(v_cnt<=86))		//P
				pixel = pixel_menu;		
			if ((h_cnt>=250)&&(h_cnt<=277)&&(v_cnt>=46)&&(v_cnt<=86))		//L	
				pixel = pixel_menu;
			if ((h_cnt>=310)&&(h_cnt<=336)&&(v_cnt>=46)&&(v_cnt<=86))		//A
				pixel = pixel_menu;	
			if ((h_cnt>=370)&&(h_cnt<=397)&&(v_cnt>=46)&&(v_cnt<=86))		//N
				pixel = pixel_menu;		
			if ((h_cnt>=430)&&(h_cnt<=457)&&(v_cnt>=46)&&(v_cnt<=86))		//T
				pixel = pixel_menu;			

			if ((h_cnt>=285)&&(h_cnt<=312)&&(v_cnt>=123)&&(v_cnt<=163))		//V
				pixel = pixel_menu;					
			if ((h_cnt>=335)&&(h_cnt<=362)&&(v_cnt>=123)&&(v_cnt<=163))		//S
				pixel = pixel_menu;	

			if ((h_cnt>=160)&&(h_cnt<=187)&&(v_cnt>=194)&&(v_cnt<=234))		//Z
				pixel = pixel_menu;					
			if ((h_cnt>=217)&&(h_cnt<=244)&&(v_cnt>=194)&&(v_cnt<=234))		//O
				pixel = pixel_menu;	
			if ((h_cnt>=274)&&(h_cnt<=301)&&(v_cnt>=194)&&(v_cnt<=234))		//M
				pixel = pixel_menu;	
			if ((h_cnt>=331)&&(h_cnt<=358)&&(v_cnt>=194)&&(v_cnt<=234))		//B
				pixel = pixel_menu;	
			if ((h_cnt>=388)&&(h_cnt<=415)&&(v_cnt>=194)&&(v_cnt<=234))		//I
				pixel = pixel_menu;	
			if ((h_cnt>=445)&&(h_cnt<=472)&&(v_cnt>=194)&&(v_cnt<=234))		//E
				pixel = pixel_menu;			

			if ((h_cnt>=190)&&(h_cnt<=217)&&(v_cnt>=284)&&(v_cnt<=324))		//S
				pixel = 12'hfff - pixel_menu;	
			if ((h_cnt>=250)&&(h_cnt<=277)&&(v_cnt>=284)&&(v_cnt<=324))		//T
				pixel = 12'hfff - pixel_menu;	
			if ((h_cnt>=310)&&(h_cnt<=336)&&(v_cnt>=284)&&(v_cnt<=324))		//A
				pixel = 12'hfff - pixel_menu;	
			if ((h_cnt>=370)&&(h_cnt<=397)&&(v_cnt>=284)&&(v_cnt<=324))		//R
				pixel = 12'hfff - pixel_menu;				
			if ((h_cnt>=430)&&(h_cnt<=457)&&(v_cnt>=284)&&(v_cnt<=324))		//T
				pixel = 12'hfff - pixel_menu;		

			
			end
		S1:begin
//state control
			if (larger_signal5) state_next = S0;
			else if (larger_signal3) state_next = S3;
			else state_next = S1;
//pixel select		
		    pixel = 12'h000;		
			if ((h_cnt>=190)&&(h_cnt<=217)&&(v_cnt>=46)&&(v_cnt<=86))		//P
				pixel = pixel_menu;		
			if ((h_cnt>=250)&&(h_cnt<=277)&&(v_cnt>=46)&&(v_cnt<=86))		//L	
				pixel = pixel_menu;
			if ((h_cnt>=310)&&(h_cnt<=336)&&(v_cnt>=46)&&(v_cnt<=86))		//A
				pixel = pixel_menu;	
			if ((h_cnt>=370)&&(h_cnt<=397)&&(v_cnt>=46)&&(v_cnt<=86))		//N
				pixel = pixel_menu;		
			if ((h_cnt>=430)&&(h_cnt<=457)&&(v_cnt>=46)&&(v_cnt<=86))		//T
				pixel = pixel_menu;			

			if ((h_cnt>=285)&&(h_cnt<=312)&&(v_cnt>=123)&&(v_cnt<=163))		//V
				pixel = pixel_menu;					
			if ((h_cnt>=335)&&(h_cnt<=362)&&(v_cnt>=123)&&(v_cnt<=163))		//S
				pixel = pixel_menu;	

			if ((h_cnt>=160)&&(h_cnt<=187)&&(v_cnt>=194)&&(v_cnt<=234))		//Z
				pixel = pixel_menu;					
			if ((h_cnt>=217)&&(h_cnt<=244)&&(v_cnt>=194)&&(v_cnt<=234))		//O
				pixel = pixel_menu;	
			if ((h_cnt>=274)&&(h_cnt<=301)&&(v_cnt>=194)&&(v_cnt<=234))		//M
				pixel = pixel_menu;	
			if ((h_cnt>=331)&&(h_cnt<=358)&&(v_cnt>=194)&&(v_cnt<=234))		//B
				pixel = pixel_menu;	
			if ((h_cnt>=388)&&(h_cnt<=415)&&(v_cnt>=194)&&(v_cnt<=234))		//I
				pixel = pixel_menu;	
			if ((h_cnt>=445)&&(h_cnt<=472)&&(v_cnt>=194)&&(v_cnt<=234))		//E
				pixel = pixel_menu;			

			if ((h_cnt>=190)&&(h_cnt<=217)&&(v_cnt>=284)&&(v_cnt<=324))		//S
				pixel = pixel_menu;	
			if ((h_cnt>=250)&&(h_cnt<=277)&&(v_cnt>=284)&&(v_cnt<=324))		//T
				pixel = pixel_menu;
			if ((h_cnt>=310)&&(h_cnt<=336)&&(v_cnt>=284)&&(v_cnt<=324))		//A
				pixel = pixel_menu;
			if ((h_cnt>=370)&&(h_cnt<=397)&&(v_cnt>=284)&&(v_cnt<=324))		//R
				pixel = pixel_menu;				
			if ((h_cnt>=430)&&(h_cnt<=457)&&(v_cnt>=284)&&(v_cnt<=324))		//T
				pixel = pixel_menu;	

			if ((h_cnt>=126)&&(h_cnt<=153)&&(v_cnt>=354)&&(v_cnt<=394))		//I
				pixel = 12'hfff - pixel_menu;	
			if ((h_cnt>=167)&&(h_cnt<=194)&&(v_cnt>=354)&&(v_cnt<=394))		//N
				pixel = 12'hfff - pixel_menu;		
			if ((h_cnt>=208)&&(h_cnt<=235)&&(v_cnt>=354)&&(v_cnt<=394))		//T
				pixel = 12'hfff - pixel_menu;		
			if ((h_cnt>=249)&&(h_cnt<=276)&&(v_cnt>=354)&&(v_cnt<=394))		//R
				pixel = 12'hfff - pixel_menu;		
			if ((h_cnt>=290)&&(h_cnt<=317)&&(v_cnt>=354)&&(v_cnt<=394))		//O
				pixel = 12'hfff - pixel_menu;		
			if ((h_cnt>=331)&&(h_cnt<=358)&&(v_cnt>=354)&&(v_cnt<=394))		//D
				pixel = 12'hfff - pixel_menu;		
			if ((h_cnt>=372)&&(h_cnt<=399)&&(v_cnt>=354)&&(v_cnt<=394))		//U
				pixel = 12'hfff - pixel_menu;	
			if ((h_cnt>=413)&&(h_cnt<=440)&&(v_cnt>=354)&&(v_cnt<=394))		//C
				pixel = 12'hfff - pixel_menu;		
			if ((h_cnt>=454)&&(h_cnt<=481)&&(v_cnt>=354)&&(v_cnt<=394))		//E
				pixel = 12'hfff - pixel_menu;	
			end
		 
		 S2:begin//game
		    state_next = S2;
            pixel = 12'h000;
				
   		    if (((h_cnt <=119)&&(h_cnt >=0)&&(v_cnt <=119)&&(v_cnt >=0))&&(pixel_plant != 0)&&(pos0==1'b1)&&(plantdisappear0==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
		    if(((h_cnt >=120)&&(h_cnt <=239)&&(v_cnt <=119)&&(v_cnt >=0))&&(pixel_plant != 0)&&(pos1==1'b1)&&(plantdisappear1==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
			if(((h_cnt <=119)&&(h_cnt >=0)&&(v_cnt >= 120)&&(v_cnt <=239))&&(pixel_plant != 0)&&(pos2==1'b1)&&(plantdisappear2==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
			if(((h_cnt >=120)&&(h_cnt <=239)&&(v_cnt >= 120)&&(v_cnt <=239))&&(pixel_plant != 0)&&(pos3==1'b1)&&(plantdisappear3==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
			if(((h_cnt <=119)&&(h_cnt >=0)&&(v_cnt >= 240)&&(v_cnt <= 359))&&(pixel_plant != 0)&&(pos4==1'b1)&&(plantdisappear4==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
			if(((h_cnt >=120)&&(h_cnt <=239)&&(v_cnt >= 240)&&(v_cnt <=359))&&(pixel_plant != 0)&&(pos5==1'b1)&&(plantdisappear5==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
			if(((h_cnt <=119)&&(h_cnt >=0)&&(v_cnt >= 360)&&(v_cnt <=479))&&(pixel_plant != 0)&&(pos6==1'b1)&&(plantdisappear6==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
			if(((h_cnt >=120)&&(h_cnt <=239)&&(v_cnt >= 360)&&(v_cnt <=479))&&(pixel_plant != 0)&&(pos7==1'b1)&&(plantdisappear7==0)&&(pixel_plant!=0))
			   pixel = pixel_plant;
			   	   
			if ((h_cnt>=522-gpos0)&&(h_cnt<=639-gpos0)&&(v_cnt>=0)&&(v_cnt<=119)&&bdisappear0==0&&bdisappear1==0&&(gstart0==1||gst0==1)&&(pixel_zombie!=0))begin	
                pixel =  pixel_zombie;
            end
			if ((h_cnt>=522-gpos0_1)&&(h_cnt<=639-gpos0_1)&&(v_cnt>=0)&&(v_cnt<=119)&&bdisappear0_1==0&&bdisappear1_1==0&&(gstart4==1||gst4==1))begin//a0_2
                if (pixel_zombie2!=12'h000)
					pixel =  pixel_zombie2;
            end
           
		   if ((h_cnt>=522-gpos1)&&(h_cnt<=639-gpos1)&&(v_cnt>=120)&&(v_cnt<=239)&&bdisappear2==0&&bdisappear3==0&&(gstart1==1||gst1==1)&&(pixel_zombie!=0))
                pixel =  pixel_zombie;
		   if ((h_cnt>=522-gpos1_1)&&(h_cnt<=639-gpos1_1)&&(v_cnt>=120)&&(v_cnt<=239)&&bdisappear2_1==0&&bdisappear3_1==0&&(gstart5==1||gst5==1))//a1_2
                if (pixel_zombie2!=12'h000)
					pixel =  pixel_zombie2;
           
		   if ((h_cnt>=522-gpos2)&&(h_cnt<=639-gpos2)&&(v_cnt>=240)&&(v_cnt<=359)&&bdisappear4==0&&bdisappear5==0&&(gstart2==1||gst2==1)&&(pixel_zombie!=0) )   
                pixel =  pixel_zombie;
		   if ((h_cnt>=522-gpos2_1)&&(h_cnt<=639-gpos2_1)&&(v_cnt>=240)&&(v_cnt<=359)&&bdisappear4_1==0&&bdisappear5_1==0&&(gstart6==1||gst6==1) )  // a2_2
                if (pixel_zombie2!=12'h000)
					pixel =  pixel_zombie2;
           
		   if ((h_cnt>=522-gpos3)&&(h_cnt<=639-gpos3)&&(v_cnt>=360)&&(v_cnt<=479)&&bdisappear6==0&&bdisappear7==0&&(gstart3==1||gst3==1)&&(pixel_zombie!=0))
                 pixel =  pixel_zombie;
		   if ((h_cnt>=522-gpos3_1)&&(h_cnt<=639-gpos3_1)&&(v_cnt>=360)&&(v_cnt<=479)&&bdisappear6_1==0&&bdisappear7_1==0&&(gstart7==1||gst7==1))//a3_2
                if (pixel_zombie2!=12'h000)
					pixel =  pixel_zombie2;
          
           if ((h_cnt == 121)||(h_cnt == 242)||(v_cnt == 120)||(v_cnt == 240)||(v_cnt == 360))
                 pixel = 12'hfff;
            
           if ((h_cnt>=120+position0)&&(h_cnt<=139+position0)&&(v_cnt>=10)&&(v_cnt<=29)&&pos0==1&&bdisappear0==0&&bdisappear0_1==0&&(pixel_bullet!=0)&&(plantdisappear0==0))
                 pixel =  pixel_bullet;
                 
            if ((h_cnt>=120+position2)&&(h_cnt<=139+position2)&&(v_cnt>=130)&&(v_cnt<=149)&&pos2==1&&bdisappear2==0&&bdisappear2_1==0&&(pixel_bullet!=0)&&(plantdisappear2==0))
               pixel =  pixel_bullet;
            if ((h_cnt>=120+position4)&&(h_cnt<=139+position4)&&(v_cnt>=250)&&(v_cnt<=269)&&pos4==1&&bdisappear4==0&&bdisappear4_1==0&&(pixel_bullet!=0)&&(plantdisappear4==0))
               pixel =  pixel_bullet;
            if ((h_cnt>=120+position6)&&(h_cnt<=139+position6)&&(v_cnt>=370)&&(v_cnt<=389)&&pos6==1&&bdisappear6==0&&bdisappear6_1==0&&(pixel_bullet!=0)&&(plantdisappear6==0))
               pixel =  pixel_bullet;
            
            if ((h_cnt>=240+position1)&&(h_cnt<=259+position1)&&(v_cnt>=10)&&(v_cnt<=29)&&pos1==1&&bdisappear1==0&&bdisappear1_1==0&&(pixel_bullet!=0)&&(plantdisappear1==0))
              pixel =  pixel_bullet;
            if ((h_cnt>=240+position3)&&(h_cnt<=259+position3)&&(v_cnt>=130)&&(v_cnt<=149)&&pos3==1&&bdisappear3==0&&bdisappear3_1==0&&(pixel_bullet!=0)&&(plantdisappear3==0))
              pixel =  pixel_bullet;
            if ((h_cnt>=240+position5)&&(h_cnt<=259+position5)&&(v_cnt>=250)&&(v_cnt<=269)&&pos5==1&&bdisappear5==0&&bdisappear5_1==0&&(pixel_bullet!=0)&&(plantdisappear5==0))
			  pixel =  pixel_bullet;
			if ((h_cnt>=240+position7)&&(h_cnt<=259+position7)&&(v_cnt>=370)&&(v_cnt<=389)&&pos7==1&&bdisappear7==0&&bdisappear7_1==0&&(pixel_bullet!=0)&&(plantdisappear7==0))
			   pixel =  pixel_bullet;
			   
			//frame11			
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>=0)&&(v_cnt<3)&&(plant_now[0]==1'b1))
			  pixel = 12'hf00;
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>116)&&(v_cnt<=119)&&(plant_now[0]==1'b1))
			  pixel = 12'hf00;
		    if (((v_cnt>=0)&&(v_cnt<39)||(v_cnt>80)&&(v_cnt<=119))&&(h_cnt>=0)&&(h_cnt<3)&&(plant_now[0]==1'b1))
			  pixel = 12'hf00;
		    if (((v_cnt>=0)&&(v_cnt<39)||(v_cnt>80)&&(v_cnt<=119))&&(h_cnt>116)&&(h_cnt<=119)&&(plant_now[0]==1'b1))
			  pixel = 12'hf00;	
            //frame12
		    if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>=0)&&(v_cnt<3)&&(plant_now[1]==1'b1))
			  pixel = 12'hf00;
	        if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>116)&&(v_cnt<=119)&&(plant_now[1]==1'b1))
			  pixel = 12'hf00;
		    if (((v_cnt>=0)&&(v_cnt<39)||(v_cnt>80)&&(v_cnt<=119))&&(h_cnt>=120)&&(h_cnt<123)&&(plant_now[1]==1'b1))
			  pixel = 12'hf00;
		    if (((v_cnt>=0)&&(v_cnt<39)||(v_cnt>80)&&(v_cnt<=119))&&(h_cnt>236)&&(h_cnt<=239)&&(plant_now[1]==1'b1))
			  pixel = 12'hf00;	
            //frame21
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>=120)&&(v_cnt<123)&&(plant_now[2]==1))
			  pixel = 12'hf00;
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>236)&&(v_cnt<=239)&&(plant_now[2]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=120)&&(v_cnt<159)||(v_cnt>200)&&(v_cnt<=239))&&(h_cnt>=0)&&(h_cnt<3)&&(plant_now[2]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=120)&&(v_cnt<159)||(v_cnt>200)&&(v_cnt<=239))&&(h_cnt>116)&&(h_cnt<=119)&&(plant_now[2]==1))
		 	  pixel = 12'hf00;	
           //frame22
		    if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>=120)&&(v_cnt<123)&&(plant_now[3]==1))
			  pixel = 12'hf00;
		    if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>236)&&(v_cnt<=239)&&(plant_now[3]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=120)&&(v_cnt<159)||(v_cnt>200)&&(v_cnt<=239))&&(h_cnt>=120)&&(h_cnt<123)&&(plant_now[3]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=120)&&(v_cnt<159)||(v_cnt>200)&&(v_cnt<=239))&&(h_cnt>236)&&(h_cnt<=239)&&(plant_now[3]==1))
			  pixel = 12'hf00;			  
			//frame31
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>=240)&&(v_cnt<243)&&(plant_now[4]==1))
			  pixel = 12'hf00;
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>356)&&(v_cnt<=359)&&(plant_now[4]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=240)&&(v_cnt<279)||(v_cnt>320)&&(v_cnt<=359))&&(h_cnt>=0)&&(h_cnt<3)&&(plant_now[4]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=240)&&(v_cnt<279)||(v_cnt>320)&&(v_cnt<=359))&&(h_cnt>116)&&(h_cnt<=119)&&(plant_now[4]==1))
			  pixel = 12'hf00;	
			//frame32
		    if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>=240)&&(v_cnt<243)&&(plant_now[5]==1))
			  pixel = 12'hf00;
		    if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>356)&&(v_cnt<=359)&&(plant_now[5]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=240)&&(v_cnt<279)||(v_cnt>320)&&(v_cnt<=359))&&(h_cnt>=120)&&(h_cnt<123)&&(plant_now[5]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=240)&&(v_cnt<279)||(v_cnt>320)&&(v_cnt<=359))&&(h_cnt>236)&&(h_cnt<=239)&&(plant_now[5]==1))
			  pixel = 12'hf00;
			//frame41
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>=360)&&(v_cnt<363)&&(plant_now[6]==1))
			  pixel = 12'hf00;
		    if (((h_cnt>=0)&&(h_cnt<39)||(h_cnt>80)&&(h_cnt<=119))&&(v_cnt>476)&&(v_cnt<=479)&&(plant_now[6]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=360)&&(v_cnt<399)||(v_cnt>440)&&(v_cnt<=479))&&(h_cnt>=0)&&(h_cnt<3)&&(plant_now[6]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=360)&&(v_cnt<399)||(v_cnt>440)&&(v_cnt<=479))&&(h_cnt>116)&&(h_cnt<=119)&&(plant_now[6]==1))
			  pixel = 12'hf00;		
			//frame42
		    if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>=360)&&(v_cnt<363)&&(plant_now[7]==1))
			  pixel = 12'hf00;
		    if (((h_cnt>=120)&&(h_cnt<159)||(h_cnt>200)&&(h_cnt<=239))&&(v_cnt>476)&&(v_cnt<=479)&&(plant_now[7]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=360)&&(v_cnt<399)||(v_cnt>440)&&(v_cnt<=479))&&(h_cnt>=120)&&(h_cnt<123)&&(plant_now[7]==1))
			  pixel = 12'hf00;
		    if (((v_cnt>=360)&&(v_cnt<399)||(v_cnt>440)&&(v_cnt<=479))&&(h_cnt>236)&&(h_cnt<=239)&&(plant_now[7]==1))
			  pixel = 12'hf00;
			
			if ((gpos0==520)||(gpos1==520)||(gpos2==520)||(gpos3==520)||(gpos0_1==520)||(gpos1_1==520)||(gpos2_1==520)||(gpos3_1==520))
				state_next = S3;
		end
		S3: begin
//state control
			if (larger_signal3) state_next = S0;
			else state_next = S3;
//pixel select			
		    pixel = 12'h000;			
			if ((h_cnt>=109)&&(h_cnt<=166)&&(v_cnt>=122)&&(v_cnt<=202))		//G
				pixel = pixel_menu;	
			if ((h_cnt>=206)&&(h_cnt<=263)&&(v_cnt>=122)&&(v_cnt<=202))		//A
				pixel = pixel_menu;	
			if ((h_cnt>=303)&&(h_cnt<=360)&&(v_cnt>=122)&&(v_cnt<=202))		//M
				pixel = pixel_menu;	
			if ((h_cnt>=400)&&(h_cnt<=457)&&(v_cnt>=122)&&(v_cnt<=202))		//E
				pixel = pixel_menu;	
					
			if ((h_cnt>=180)&&(h_cnt<=237)&&(v_cnt>=242)&&(v_cnt<=322))		//O
				pixel = pixel_menu;	
			if ((h_cnt>=277)&&(h_cnt<=334)&&(v_cnt>=242)&&(v_cnt<=322))		//V
				pixel = pixel_menu;	
			if ((h_cnt>=374)&&(h_cnt<=431)&&(v_cnt>=242)&&(v_cnt<=322))		//E
				pixel = pixel_menu;	
			if ((h_cnt>=471)&&(h_cnt<=528)&&(v_cnt>=242)&&(v_cnt<=322))		//R
				pixel = pixel_menu;	
			end
      endcase
   end
endmodule

