module div_stage2(clk,reset,
		  s0,s1,s2,s3,s4,s5,s6,s7,s8,
		  c0,c1,c2,c3,c4);

input clk;
input reset;

input [7:0] s0;
input [7:0] s1;
input [7:0] s2;
input [7:0] s3;
input [7:0] s4;
input [7:0] s5;
input [7:0] s6;
input [7:0] s7;
input [7:0] s8;

output [7:0] c0;
output [7:0] c1;
output [7:0] c2;
output [7:0] c3;
output [7:0] c4;

wire clk;
wire reset;

wire [7:0] s0;
wire [7:0] s1;
wire [7:0] s2;
wire [7:0] s3;
wire [7:0] s4;
wire [7:0] s5;
wire [7:0] s6;
wire [7:0] s7;
wire [7:0] s8;

reg [7:0] c0;
reg [7:0] c1;
reg [7:0] c2;
reg [7:0] c3;
reg [7:0] c4;

always@(posedge clk)
	begin
		if(reset == 1)
			begin
			   c0 = 8'd0;
			   c1 = 8'd0;
			   c2 = 8'd0;
			   c3 = 8'd0;
			   c4 = 8'd0;
			end
		else
			begin
		         c0 = s0 - s5 - s6;
			   c1 = s1 - s6;
			   c2 = s2 - s7 - s5 - s8;
			   c3 = s3 - s8 - s6;
			   c4 = s4 - s7;
			end
	end
		 

endmodule









