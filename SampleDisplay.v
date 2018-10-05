module SampleDisplay(
	output  reg key_return_D,
	output  reg key_return_L,
	output  reg key_return_E,
	output  reg key_return_R,
	output  reg key_return_U,
	inout  wire PS2_DATA,
    inout  wire PS2_CLK,
	input wire rst,
	input wire clk
	);
	
	wire [8:0] KEY_CODES [0:4] = {
		9'b0_0111_0010, // right_2 => 72 //down
		9'b0_0110_1011, // right_4 => 6B //left
		9'b0_0111_0011, // right_5 => 73 //enter
		9'b0_0111_0100, // right_6 => 74 //right
		9'b0_0111_0101 // right_8 => 75 //up
	};
	reg  key_return_D;
	reg  key_return_L;
	reg  key_return_E;
	reg  key_return_R;
	reg  key_return_U;
	reg [3:0] key_num;
	reg [9:0] last_key;
	wire shift_down;
	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;
	/*SevenSegment seven_seg (
		.display(display),
		.digit(digit),
		.nums(nums),
		.rst(rst),
		.clk(clk)
	);*/	
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);
	always @ (posedge clk, posedge rst) begin
		if (rst) begin
		  key_return_D<=1'b0;
          key_return_L<=1'b0;
          key_return_E<=1'b0;
          key_return_R<=1'b0;
          key_return_U<=1'b0;
		end 
		else begin
		  key_return_D<=1'b0;
          key_return_L<=1'b0;
          key_return_E<=1'b0;
          key_return_R<=1'b0;
          key_return_U<=1'b0;
	      if (been_ready && key_down[last_change] == 1'b1) begin
			  if (last_change == KEY_CODES[0]) key_return_D <= 1'b1;
			  if (last_change == KEY_CODES[1]) key_return_L <= 1'b1;
			  if (last_change == KEY_CODES[2]) key_return_E <= 1'b1;
			  if (last_change == KEY_CODES[3]) key_return_R <= 1'b1;
			  if (last_change == KEY_CODES[4]) key_return_U <= 1'b1;	
		  end
	   end
	 end	
endmodule