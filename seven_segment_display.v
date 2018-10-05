

module seven_segment_display (digit, AN, clk, power);
	output [3:0] digit;
	output [3:0] AN;
	input clk;
	input [7:0] power;
	
	reg [1:0] counter;
	reg [1:0] next_counter;
	reg [6:0] SEG;
	reg [3:0] AN;
	reg [3:0] digit;
		
	always @(posedge clk) begin
		counter <= next_counter;
	end
	
	always @(*) begin
		next_counter = counter + 1;			
		case (counter)
			2'd0:	begin 
						AN = 4'b1110;
						digit = power%(4'd10);
					end
			2'd1:	begin
						AN = 4'b1101;
						digit = (power/(4'd10))%(4'd10);		
					end
			2'd2:	begin
						AN = 4'b1011;
						digit = ((power/(4'd10))/(4'd10))%(4'd10);
					end
			2'd3:	begin
						AN = 4'b0111;
						digit = 0;
					end				
		endcase	
	end
	
endmodule
