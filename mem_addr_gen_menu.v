module mem_addr_gen_menu(
   input clk,
   input rst,   
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input [3:0] state,
   output [16:0] pixel_addr_menu //menu
   );
    
	reg [16:0] pixel_addr_menu;
   parameter S0=4'b0000;
   parameter S1=4'b0001;
   parameter S2=4'b0010;
   parameter S3=4'b0011;
   parameter S4=4'b0100;
   parameter S5=4'b0101;
   parameter S6=4'b0110;
   parameter S7=4'b0111;

   always @(*) begin
	case(state)
		S0: begin
				if ((h_cnt>=187)&&(h_cnt<=217)&&(v_cnt>=46)&&(v_cnt<=86))		//P
					pixel_addr_menu = (h_cnt-187+65)+426*(v_cnt-46+57);
				if ((h_cnt>=247)&&(h_cnt<=277)&&(v_cnt>=46)&&(v_cnt<=86))		//L
					pixel_addr_menu = (h_cnt-247+362)+426*(v_cnt-46+0);
				if ((h_cnt>=306)&&(h_cnt<=336)&&(v_cnt>=46)&&(v_cnt<=86))		//A
					pixel_addr_menu = (h_cnt-306+0)+426*(v_cnt-46+0);	
				if ((h_cnt>=367)&&(h_cnt<=397)&&(v_cnt>=46)&&(v_cnt<=86))		//N
					pixel_addr_menu = (h_cnt-367+0)+426*(v_cnt-46+57);				
				if ((h_cnt>=427)&&(h_cnt<=457)&&(v_cnt>=46)&&(v_cnt<=86))		//T
					pixel_addr_menu = (h_cnt-427+197)+426*(v_cnt-46+57);	
					
				if ((h_cnt>=282)&&(h_cnt<=312)&&(v_cnt>=123)&&(v_cnt<=163))		//V
					pixel_addr_menu = (h_cnt-282+263)+426*(v_cnt-123+57);					
				if ((h_cnt>=332)&&(h_cnt<=362)&&(v_cnt>=123)&&(v_cnt<=163))		//S
					pixel_addr_menu = (h_cnt-332+164)+426*(v_cnt-123+57);				
				
				if ((h_cnt>=157)&&(h_cnt<=187)&&(v_cnt>=194)&&(v_cnt<=234))		//Z
					pixel_addr_menu = (h_cnt-157+395)+426*(v_cnt-194+57);
				if ((h_cnt>=214)&&(h_cnt<=244)&&(v_cnt>=194)&&(v_cnt<=234))		//O
					pixel_addr_menu = (h_cnt-214+32)+426*(v_cnt-194+57);
				if ((h_cnt>=271)&&(h_cnt<=301)&&(v_cnt>=194)&&(v_cnt<=234))		//M
					pixel_addr_menu = (h_cnt-271+395)+426*(v_cnt-194+0);
				if ((h_cnt>=328)&&(h_cnt<=358)&&(v_cnt>=194)&&(v_cnt<=234))		//B
					pixel_addr_menu = (h_cnt-328+32)+426*(v_cnt-194+0);	
				if ((h_cnt>=385)&&(h_cnt<=415)&&(v_cnt>=194)&&(v_cnt<=234))		//I
					pixel_addr_menu = (h_cnt-385+263)+426*(v_cnt-194+0);
				if ((h_cnt>=442)&&(h_cnt<=472)&&(v_cnt>=194)&&(v_cnt<=234))		//E
					pixel_addr_menu = (h_cnt-442+131)+426*(v_cnt-194+0);
					
				if ((h_cnt>=187)&&(h_cnt<=217)&&(v_cnt>=284)&&(v_cnt<=324))		//S
					pixel_addr_menu = (h_cnt-187+164)+426*(v_cnt-284+57);
				if ((h_cnt>=247)&&(h_cnt<=277)&&(v_cnt>=284)&&(v_cnt<=324))		//T
					pixel_addr_menu = (h_cnt-247+197)+426*(v_cnt-284+57);
				if ((h_cnt>=306)&&(h_cnt<=336)&&(v_cnt>=284)&&(v_cnt<=324))		//A
					pixel_addr_menu = (h_cnt-306+0)+426*(v_cnt-284+0);
				if ((h_cnt>=367)&&(h_cnt<=397)&&(v_cnt>=284)&&(v_cnt<=324))		//R
					pixel_addr_menu = (h_cnt-367+131)+426*(v_cnt-284+57);				
				if ((h_cnt>=427)&&(h_cnt<=457)&&(v_cnt>=284)&&(v_cnt<=324))		//T
					pixel_addr_menu = (h_cnt-427+197)+426*(v_cnt-284+57);				
					
				if ((h_cnt>=123)&&(h_cnt<=153)&&(v_cnt>=354)&&(v_cnt<=394))		//I
					pixel_addr_menu = (h_cnt-123+263)+426*(v_cnt-354+0);
				if ((h_cnt>=164)&&(h_cnt<=194)&&(v_cnt>=354)&&(v_cnt<=394))		//N
					pixel_addr_menu = (h_cnt-164+0)+426*(v_cnt-354+57);	
				if ((h_cnt>=205)&&(h_cnt<=235)&&(v_cnt>=354)&&(v_cnt<=394))		//T
					pixel_addr_menu = (h_cnt-205+197)+426*(v_cnt-354+57);
				if ((h_cnt>=246)&&(h_cnt<=276)&&(v_cnt>=354)&&(v_cnt<=394))		//R
					pixel_addr_menu = (h_cnt-246+131)+426*(v_cnt-354+57);
				if ((h_cnt>=287)&&(h_cnt<=317)&&(v_cnt>=354)&&(v_cnt<=394))		//O
					pixel_addr_menu = (h_cnt-287+32)+426*(v_cnt-354+57);
				if ((h_cnt>=328)&&(h_cnt<=358)&&(v_cnt>=354)&&(v_cnt<=394))		//D
					pixel_addr_menu = (h_cnt-328+98)+426*(v_cnt-354+0);			
				if ((h_cnt>=369)&&(h_cnt<=399)&&(v_cnt>=354)&&(v_cnt<=394))		//U
					pixel_addr_menu = (h_cnt-369+230)+426*(v_cnt-354+57);
				if ((h_cnt>=410)&&(h_cnt<=440)&&(v_cnt>=354)&&(v_cnt<=394))		//C
					pixel_addr_menu = (h_cnt-410+65)+426*(v_cnt-354+0);		
				if ((h_cnt>=451)&&(h_cnt<=481)&&(v_cnt>=354)&&(v_cnt<=394))		//E
					pixel_addr_menu = (h_cnt-451+131)+426*(v_cnt-354+0);				
			end
		S1: begin
				if ((h_cnt>=187)&&(h_cnt<=217)&&(v_cnt>=46)&&(v_cnt<=86))		//P
					pixel_addr_menu = (h_cnt-187+65)+426*(v_cnt-46+57);
				if ((h_cnt>=247)&&(h_cnt<=277)&&(v_cnt>=46)&&(v_cnt<=86))		//L
					pixel_addr_menu = (h_cnt-247+362)+426*(v_cnt-46+0);
				if ((h_cnt>=306)&&(h_cnt<=336)&&(v_cnt>=46)&&(v_cnt<=86))		//A
					pixel_addr_menu = (h_cnt-306+0)+426*(v_cnt-46+0);	
				if ((h_cnt>=367)&&(h_cnt<=397)&&(v_cnt>=46)&&(v_cnt<=86))		//N
					pixel_addr_menu = (h_cnt-367+0)+426*(v_cnt-46+57);				
				if ((h_cnt>=427)&&(h_cnt<=457)&&(v_cnt>=46)&&(v_cnt<=86))		//T
					pixel_addr_menu = (h_cnt-427+197)+426*(v_cnt-46+57);	
					
				if ((h_cnt>=282)&&(h_cnt<=312)&&(v_cnt>=123)&&(v_cnt<=163))		//V
					pixel_addr_menu = (h_cnt-282+263)+426*(v_cnt-123+57);					
				if ((h_cnt>=332)&&(h_cnt<=362)&&(v_cnt>=123)&&(v_cnt<=163))		//S
					pixel_addr_menu = (h_cnt-332+164)+426*(v_cnt-123+57);				
				
				if ((h_cnt>=157)&&(h_cnt<=187)&&(v_cnt>=194)&&(v_cnt<=234))		//Z
					pixel_addr_menu = (h_cnt-157+395)+426*(v_cnt-194+57);
				if ((h_cnt>=214)&&(h_cnt<=244)&&(v_cnt>=194)&&(v_cnt<=234))		//O
					pixel_addr_menu = (h_cnt-214+32)+426*(v_cnt-194+57);
				if ((h_cnt>=271)&&(h_cnt<=301)&&(v_cnt>=194)&&(v_cnt<=234))		//M
					pixel_addr_menu = (h_cnt-271+395)+426*(v_cnt-194+0);
				if ((h_cnt>=328)&&(h_cnt<=358)&&(v_cnt>=194)&&(v_cnt<=234))		//B
					pixel_addr_menu = (h_cnt-328+32)+426*(v_cnt-194+0);	
				if ((h_cnt>=385)&&(h_cnt<=415)&&(v_cnt>=194)&&(v_cnt<=234))		//I
					pixel_addr_menu = (h_cnt-385+263)+426*(v_cnt-194+0);
				if ((h_cnt>=442)&&(h_cnt<=472)&&(v_cnt>=194)&&(v_cnt<=234))		//E
					pixel_addr_menu = (h_cnt-442+131)+426*(v_cnt-194+0);
					
				if ((h_cnt>=187)&&(h_cnt<=217)&&(v_cnt>=284)&&(v_cnt<=324))		//S
					pixel_addr_menu = (h_cnt-187+164)+426*(v_cnt-284+57);
				if ((h_cnt>=247)&&(h_cnt<=277)&&(v_cnt>=284)&&(v_cnt<=324))		//T
					pixel_addr_menu = (h_cnt-247+197)+426*(v_cnt-284+57);
				if ((h_cnt>=306)&&(h_cnt<=336)&&(v_cnt>=284)&&(v_cnt<=324))		//A
					pixel_addr_menu = (h_cnt-306+0)+426*(v_cnt-284+0);
				if ((h_cnt>=367)&&(h_cnt<=397)&&(v_cnt>=284)&&(v_cnt<=324))		//R
					pixel_addr_menu = (h_cnt-367+131)+426*(v_cnt-284+57);				
				if ((h_cnt>=427)&&(h_cnt<=457)&&(v_cnt>=284)&&(v_cnt<=324))		//T
					pixel_addr_menu = (h_cnt-427+197)+426*(v_cnt-284+57);				
					
				if ((h_cnt>=123)&&(h_cnt<=153)&&(v_cnt>=354)&&(v_cnt<=394))		//I
					pixel_addr_menu = (h_cnt-123+263)+426*(v_cnt-354+0);
				if ((h_cnt>=164)&&(h_cnt<=194)&&(v_cnt>=354)&&(v_cnt<=394))		//N
					pixel_addr_menu = (h_cnt-164+0)+426*(v_cnt-354+57);	
				if ((h_cnt>=205)&&(h_cnt<=235)&&(v_cnt>=354)&&(v_cnt<=394))		//T
					pixel_addr_menu = (h_cnt-205+197)+426*(v_cnt-354+57);
				if ((h_cnt>=246)&&(h_cnt<=276)&&(v_cnt>=354)&&(v_cnt<=394))		//R
					pixel_addr_menu = (h_cnt-246+131)+426*(v_cnt-354+57);
				if ((h_cnt>=287)&&(h_cnt<=317)&&(v_cnt>=354)&&(v_cnt<=394))		//O
					pixel_addr_menu = (h_cnt-287+32)+426*(v_cnt-354+57);
				if ((h_cnt>=328)&&(h_cnt<=358)&&(v_cnt>=354)&&(v_cnt<=394))		//D
					pixel_addr_menu = (h_cnt-328+98)+426*(v_cnt-354+0);			
				if ((h_cnt>=369)&&(h_cnt<=399)&&(v_cnt>=354)&&(v_cnt<=394))		//U
					pixel_addr_menu = (h_cnt-369+230)+426*(v_cnt-354+57);
				if ((h_cnt>=410)&&(h_cnt<=440)&&(v_cnt>=354)&&(v_cnt<=394))		//C
					pixel_addr_menu = (h_cnt-410+65)+426*(v_cnt-354+0);		
				if ((h_cnt>=451)&&(h_cnt<=481)&&(v_cnt>=354)&&(v_cnt<=394))		//E
					pixel_addr_menu = (h_cnt-451+131)+426*(v_cnt-354+0);				
			end			
		S3: begin
				if ((h_cnt>=106)&&(h_cnt<=166)&&(v_cnt>=122)&&(v_cnt<=202))		//G
					pixel_addr_menu = ((h_cnt-106)>>1)+197+426*((v_cnt-122)>>1+0);
				if ((h_cnt>=203)&&(h_cnt<=263)&&(v_cnt>=122)&&(v_cnt<=202))		//A
					pixel_addr_menu = ((h_cnt-203)>>1)+0+426*((v_cnt-122)>>1+0);
				if ((h_cnt>=300)&&(h_cnt<=360)&&(v_cnt>=122)&&(v_cnt<=202))		//M
					pixel_addr_menu = ((h_cnt-300)>>1)+395+426*((v_cnt-122)>>1+0);
				if ((h_cnt>=397)&&(h_cnt<=457)&&(v_cnt>=122)&&(v_cnt<=202))		//E
					pixel_addr_menu = ((h_cnt-397)>>1)+131+426*((v_cnt-122)>>1+0);
					
				if ((h_cnt>=177)&&(h_cnt<=237)&&(v_cnt>=242)&&(v_cnt<=322))		//O
					pixel_addr_menu = ((h_cnt-177)>>1)+32+426*(((v_cnt-242)>>1)+57);	
				if ((h_cnt>=274)&&(h_cnt<=334)&&(v_cnt>=242)&&(v_cnt<=322))		//V
					pixel_addr_menu = ((h_cnt-274)>>1)+263+426*(((v_cnt-242)>>1)+57);	
				if ((h_cnt>=371)&&(h_cnt<=431)&&(v_cnt>=242)&&(v_cnt<=322))		//E
					pixel_addr_menu = ((h_cnt-371)>>1)+131+426*(((v_cnt-242)>>1)+0);	
				if ((h_cnt>=468)&&(h_cnt<=528)&&(v_cnt>=242)&&(v_cnt<=322))		//R
					pixel_addr_menu = ((h_cnt-468)>>1)+131+426*(((v_cnt-242)>>1)+57);
			end
   endcase
   end
endmodule
