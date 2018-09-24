module control(clk,reset,ctrl,
	   data_in,data_out,
	   x_in,y_in,
	   x_out1,y_out1,
	   x_out2,y_out2,
   	   s0,valid);

input clk;
input reset;
input [2:0] ctrl;

input [31:0] data_in;
input [7:0] x_in;
input [7:0] y_in;
input valid;

output [31:0] data_out;
output [7:0] x_out1;
output [7:0] x_out2;
output [7:0] y_out1;
output [7:0] y_out2;
output s0;

wire clk;
wire reset;
wire [2:0] ctrl;
wire [31:0] data_in;
wire [7:0] x_in;
wire [7:0] y_in;

reg [31:0] data_out;
reg [7:0] x_out1;
reg [7:0] x_out2;
reg [7:0] y_out1;
reg [7:0] y_out2;
reg s0;

reg [4:0] count;
reg [4:0] temp;

reg [7:0] data_in_x0;
reg [7:0] data_in_y0;
reg [7:0] data_in_x1;
reg [7:0] data_in_y1;

wire [7:0] data_out_x0;
wire [7:0] data_out_y0;
wire [7:0] data_out_x1;
wire [7:0] data_out_y1;

reg [7:0] data_in_de0;
wire [7:0] data_out_de0;

reg [7:0] data_in_de1;
wire [7:0] data_out_de1;

encrypt_x e1(clk,reset,data_in_x0,data_out_x0);
encrypt_y e2(clk,reset,data_in_y0,data_out_y0);

encrypt_x e3(clk,reset,data_in_x1,data_out_x1);
encrypt_y e4(clk,reset,data_in_y1,data_out_y1);

decrypt   e6(clk,reset,data_in_de0,data_out_de0);
decrypt   e7(clk,reset,data_in_de1,data_out_de1);

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
				data_out <= 0;
				data_in_x0 <= 0;
				data_in_x1 <= 0;
				data_in_y0 <= 0;
				data_in_y1 <= 0;
				x_out1     <= 0;
				x_out2     <= 0;
				y_out1     <= 0;
				y_out2     <= 0;
				s0         <= 0;
			end
		   else if( count == 0)
			begin
				data_in_x0 <= data_in[7:0];	
				data_in_y0 <= data_in[7:0];	
				data_in_x1 <= data_in[15:8];	
				data_in_y1 <= data_in[15:8];
			end
		   else if(count == 2)
			begin
				x_out1     <= data_out_x0 ;
				y_out1     <= data_out_y0 ;
				x_out2     <= data_out_x1 ;
				y_out2     <= data_out_y1 ;
				data_in_x0 <= data_in[23:16];	
				data_in_y0 <= data_in[23:16];	
				data_in_x1 <= data_in[31:24];	
				data_in_y1 <= data_in[31:24];
				s0         <= 1;
			end
		   else if(count == 4)
			begin
				x_out1     <= data_out_x0 ;
				y_out1     <= data_out_y0 ;
				x_out2     <= data_out_x1 ;
				y_out2     <= data_out_y1 ;
				s0         <= 1;
			end
		  else if(valid == 1)
		  	begin
				data_in_de0 <= x_in;
				data_in_de1 <= y_in;
				temp        <= count;
			end
		  else if(count == temp + 2)
		  	begin	  
				data_out[7:0]  <= data_out_de0;
				data_out[15:8] <= data_out_de1;
			end
		  else if(count == temp + 1)
		  	begin
				data_in_de0 <= x_in;
				data_in_de1 <= y_in;
			end
		  else if(count == temp + 3)
		  	begin
				data_out[24:16]  <= data_out_de0;
				data_out[31:25]  <= data_out_de1;
			end

		  else 
		  	begin
				s0 <= 0;
			end


	end

endmodule









