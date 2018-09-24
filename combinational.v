module combinational(clk,reset,inst,
	     c10,c11,c12,c13,c14,
	     c20,c21,c22,c23,c24,
             c30,c31,c32,c33,c34,
		 c0,c1,c2,c3,c4);

input clk;
input reset;

input [2:0] inst;

input [7:0] c10;
input [7:0] c11;
input [7:0] c12;
input [7:0] c13;
input [7:0] c14;

input [7:0] c20;
input [7:0] c21;
input [7:0] c22;
input [7:0] c23;
input [7:0] c24;

input [7:0] c30;
input [7:0] c31;
input [7:0] c32;
input [7:0] c33;
input [7:0] c34;

output [7:0] c0;
output [7:0] c1;
output [7:0] c2;
output [7:0] c3;
output [7:0] c4;

wire clk;
wire reset;

wire [2:0] inst;

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
	   else if(inst == 3'd1)
		begin
			c0 <= c10;
                        c1 <= c11;
			c2 <= c12;
			c3 <= c13;
			c4 <= c14;	
		end
         else if(inst == 3'd2)
		begin
			c0 <= c20;
                        c1 <= c21;
			c2 <= c22;
			c3 <= c23;
			c4 <= c24;	
		end	
	  else if(inst == 3'd3)
		begin
			c0 <= c30;
                        c1 <= c31;
			c2 <= c32;
			c3 <= c33;
			c4 <= c34;	
		end
	  else 
		begin
			c0 <= c0;
          	        c1 <= c1;
			c2 <= c2;
			c3 <= c3;
			c4 <= c4;	
		end
	end
endmodule








