module divider(clk,reset,
			a0,a1,a2,a3,a4,
			b0,b1,b2,b3,b4,
			c0,c1,c2,c3,c4);

input clk;
input reset;

input [7:0] a0;
input [7:0] a1;
input [7:0] a2;
input [7:0] a3;
input [7:0] a4;

input [7:0] b0;
input [7:0] b1;
input [7:0] b2;
input [7:0] b3;
input [7:0] b4;

output [7:0] c0;
output [7:0] c1;
output [7:0] c2;
output [7:0] c3;
output [7:0] c4;

wire clk;
wire reset;

wire [7:0] a0;
wire [7:0] a1;
wire [7:0] a2;
wire [7:0] a3;
wire [7:0] a4;

wire [7:0] b0;
wire [7:0] b1;
wire [7:0] b2;
wire [7:0] b3;
wire [7:0] b4;

wire [7:0] c0;
wire [7:0] c1;
wire [7:0] c2;
wire [7:0] c3;
wire [7:0] c4;

wire [7:0] s0;
wire [7:0] s1;
wire [7:0] s2;
wire [7:0] s3;
wire [7:0] s4;
wire [7:0] s5;
wire [7:0] s6;
wire [7:0] s7;
wire [7:0] s8;

div_stage1 st1(clk,reset,a0,a1,a2,a3,a4,b0,b1,b2,b3,b4,s0,s1,s2,s3,s4,s5,s6,s7,s8);

div_stage2 st2(clk,reset,s0,s1,s2,s3,s4,s5,s6,s7,s8,c0,c1,c2,c3,c4);

endmodule









