module clock_divisor(clk, clk27,clk17, clk22,clk16,clk20,clk1);
input clk;
output clk27;
output clk17;
output clk22;
output clk16;
output clk20;
output clk1;
reg [26:0] num;
wire [26:0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk17 = num[16];
assign clk22 = num[21];
assign clk16 = num[15];
assign clk27 = num[26];
assign clk20 = num[19];
assign clk1 = num[1];
endmodule
