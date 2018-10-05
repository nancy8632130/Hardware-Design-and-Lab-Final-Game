

module seven_segment_transform (SEG, digit);
	output [6:0] SEG;
	input [3:0] digit;
	
	reg [6:0] SEG;
	
	always @(*) begin
		case(digit)
			4'd0: SEG = 7'b0000001;
			4'd1: SEG = 7'b1001111;
			4'd2: SEG = 7'b0010010;
			4'd3: SEG = 7'b0000110;
			4'd4: SEG = 7'b1001100;
			4'd5: SEG = 7'b0100100;
			4'd6: SEG = 7'b0100000;
			4'd7: SEG = 7'b0001111;
			4'd8: SEG = 7'b0000000;
			4'd9: SEG = 7'b0000100;	
		endcase
	end
	
endmodule
