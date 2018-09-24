module mul_stage1(clk,reset,
		  a0,a1,a2,a3,a4,
		  b0,b1,b2,b3,b4,
		  s0,s1,s2,s3,s4,s5,s6,s7,s8);

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

output [7:0] s0;
output [7:0] s1;
output [7:0] s2;
output [7:0] s3;
output [7:0] s4;
output [7:0] s5;
output [7:0] s6;
output [7:0] s7;
output [7:0] s8;


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

reg [7:0] s0;
reg [7:0] s1;
reg [7:0] s2;
reg [7:0] s3;
reg [7:0] s4;
reg [7:0] s5;
reg [7:0] s6;
reg [7:0] s7;
reg [7:0] s8;

always@(posedge clk)
	begin
		if(reset == 1)
			begin
			   s0 = 8'd0;
			   s1 = 8'd0;
			   s2 = 8'd0;
			   s3 = 8'd0;
			   s4 = 8'd0;
			   s5=  8'd0;
			   s6 = 8'd0;
			   s7 = 8'd0;
			   s8 = 8'd0;
			end
		else
			begin
				s0 = (a0 & b0);
				s1 = (a0 & b1) + (a1 & b0) ;
			      s2 = (a0 & b2) + (a1 & b1) + (a2 & b0);
				s3 = (a0 & b3) + (a1 & b2) + (a2 & b1) + (a3 & b0);
				s4 = (a0 & b4) + (a1 & b3) + (a2 & b2) + (a3 & b1) + (a4 & b0);
				s5 = (a1 & b4) + (a2 & b3) + (a3 & b2) + (a4 & b1);
				s6 = (a2 & b4) + (a3 & b3) + (a4 & b2);
				s7 = (a3 & b4) + (a4 & b3);
				s8 = (a4 & b4);
			end
	end
		 

endmodule









