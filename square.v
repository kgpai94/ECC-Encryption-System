module square(clk,reset,
	     a0,a1,a2,a3,a4,
	     c0,c1,c2,c3,c4);

input clk;
input reset;

input [7:0] a0;
input [7:0] a1;
input [7:0] a2;
input [7:0] a3;
input [7:0] a4;


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

reg [7:0] c0;
reg [7:0] c1;
reg [7:0] c2;
reg [7:0] c3;
reg [7:0] c4;


always@(posedge clk)
		begin
			if(reset == 1)
				begin
				   c0 <= 8'd0;
				   c1 <= 8'd0;
				   c2 <= 8'd0;
				   c3 <= 8'd0;
				   c4 <= 8'd0;
				end
		       else
				begin
				   c0 <= a0 + a4;
				   c1 <= a3;
				   c2 <= a1 + a4;
				   c3 <= a3 + a2;
				   c4 <= a2;
				end
	    end

endmodule









