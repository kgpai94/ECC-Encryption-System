module top_ecc(clk,reset,inst,
	   ctrl,sel,data_out);

	   

input clk;
input reset;
input [2:0] inst;
input [2:0] ctrl;
input [1:0] sel;

output [7:0] data_out;

wire clk;
wire reset;
wire [2:0] inst;
wire [2:0] ctrl;
wire [1:0] sel;
wire [7:0] data_out;
wire [31:0] data_out1;
wire [31:0] data_in;
wire [7:0] a0;
wire [7:0] a1;
wire [7:0] a2;
wire [7:0] a3;

wire [7:0] b0;
wire [7:0] b1;
wire [7:0] b2;
wire [7:0] b3;

wire [7:0] c0;
wire [7:0] c1;
wire [7:0] c2;
wire [7:0] c3;
wire [7:0] c4;

reg [4:0] count;
reg [4:0] temp;

reg [7:0] a0_temp;
reg [7:0] a1_temp;
reg [7:0] a2_temp;
reg [7:0] a3_temp;

reg [7:0] b0_temp;
reg [7:0] b1_temp;
reg [7:0] b2_temp;
reg [7:0] b3_temp;

reg [7:0] x_in;
reg [7:0] y_in;

wire [7:0] x_out1;
wire [7:0] y_out1;
wire [7:0] x_out2;
wire [7:0] y_out2;

reg valid;
assign data_in = 32'h12345678;
assign a0 = a0_temp;
assign a1 = a1_temp;
assign a2 = a2_temp;
assign a3 = a3_temp;

assign b0 = b0_temp;
assign b1 = b1_temp;
assign b2 = b2_temp;
assign b3 = b3_temp;

control  ct1(clk,reset,ctrl,
	   data_in,data_out1,
	   x_in,y_in,
	   x_out1,y_out1,
	   x_out2,y_out2,
   	   s0,valid);

ecc      ct2(clk,reset,inst,
            a0,a1,a2,a3,8'd0,
	    b0,b1,b2,b3,8'd0,
	    c0,c1,c2,c3,c4);
 
 always@(posedge clk)
	begin
		if(reset)
			count <= 0;
		else if (count == 31)
				count <= 31;
			else 
				count <= count + 1;
	end   

always@(posedge clk)
begin
	if(reset == 1)
	begin
		valid <= 0;
		temp  <= 0;
	end
	else if(s0 == 1 && temp == 0)
	begin
		a0_temp <= x_out1;
		b0_temp <= y_out1;
		a1_temp <= x_out2;
		b1_temp <= y_out2;
		temp    <= 1;
	end
	else if(s0 == 1 && temp == 1)
	begin
		a2_temp <= x_out1;
		b2_temp <= y_out1;
		a3_temp <= x_out2;
		b3_temp <= y_out2;
		temp    <= 0;
	end
	else if(count == 11 )
	begin
		valid <= 1;
		x_in  <= c0;
		y_in  <= c1;
	end
	else if(count == 12 )
	begin
		valid <= 1;
		x_in  <= c2;
		y_in  <= c3;
	end
	else
	begin
		valid <= 0;
	end
end

assign data_out = ( sel == 2'b00 ) ? data_out1[7:0] :
			( sel == 2'b01 ) ? data_out1[15:8] :
			( sel == 2'b10 ) ? data_out1[23:16] :
			( sel == 2'b11 ) ? data_out1[31:24] : 8'd0;
endmodule









