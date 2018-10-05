
module LFSR(outrandom, clk, rst);
input clk ;
input rst ;
output [3:0] outrandom ;
reg [3:0] random ;
assign outrandom = (random==4'd15)?4'd1:((random==4'd14)?4'd2:
 (random==4'd13)?4'd3:(random==4'd12)?4'd4:(random==4'd11)?4'd5:(random==4'd10)?4'd6:(random==4'd9)?4'd7:(random==4'd0)?4'd8:random);
always @(posedge clk or posedge rst)
begin
if (rst)
random[3:0] <= 4'b1000;
else
begin
random[2:0] <= random[3:1];
random[3] <= random[1] ^ random[0];
end
end
endmodule

