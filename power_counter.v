

module power_counter (power, rst, clk, state, new_power);
	output [7:0] power;
	input rst;
	input clk;
	input [3:0] state;
	input [7:0] new_power;
	
	reg [7:0] power;
	reg [25:0] num;
	wire [20:0] next_num;
	
	
	always @(posedge clk) begin
	  if (rst) begin
		num <= 0;
		power <= 0;	
		end
	  else
		if (!num[6]) begin
			num <= next_num;
			if (state == 4'b0010) 
				power <= new_power;
			else
				power <= 0;		
		end				
		else begin
			num <= 0;
			if (state == 4'b0010) 
				power <= new_power + 1;
			else
				power <= 0;		
		end
	end
	
	
	assign next_num = num + 1'b1;


endmodule

