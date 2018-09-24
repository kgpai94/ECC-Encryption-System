module ecc(clk,reset,inst,
		  a0,a1,a2,a3,a4,
		  b0,b1,b2,b3,b4,
		  c0,c1,c2,c3,c4);

input clk;
input reset;
input [2:0] inst;

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
wire [2:0] inst;

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

wire [7:0] c10;
wire [7:0] c11;
wire [7:0] c12;
wire [7:0] c13;
wire [7:0] c14;

wire [7:0] c20;
wire [7:0] c21;
wire [7:0] c22;
wire [7:0] c23;
wire [7:0] c24;

wire [7:0] c30;
wire [7:0] c31;
wire [7:0] c32;
wire [7:0] c33;
wire [7:0] c34;

multiplier e1(clk,reset,
              a0,a1,a2,a3,a4,
              b0,b1,b2,b3,b4,
	      c10,c11,c12,c13,c14);

divider    e2(clk,reset,
              a0,a1,a2,a3,a4,
              b0,b1,b2,b3,b4,
	      c20,c21,c22,c23,c24);


square     e3(clk,reset,
               a0,a1,a2,a3,a4,
	       c30,c31,c32,c33,c34);

combinational e4(clk,reset,inst,
	      c10,c11,c12,c13,c14,
	      c20,c21,c22,c23,c24,
	      c30,c31,c32,c33,c34,
              c0,c1,c2,c3,c4);





endmodule









