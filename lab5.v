module lab5(a,b,out);
input [2:0] a;
input [2:0] b;
output reg [6:0] out;

reg [4:0]sum;
always@(a,b) 
begin
sum = a+b;
case (sum)
4'd0:begin
	out = 7'b1000000;
end
4'd1:begin
	out = 7'b1111001;
end
4'd2:begin
	out = 7'b0100100;
end
4'd3:begin
	out = 7'b0110000;
end
4'd4:begin
	out = 7'b0011001;
end
4'd5:begin
	out = 7'b0010010;
end
4'd6:begin
	out = 7'b0000010;
end
4'd7:begin
	out = 7'b1111000;
end
4'd8:begin
	out = 7'b0000000;
end
4'd9:begin
	out = 7'b0010000;
end
4'd10:begin
	out = 7'b0001000;
end
4'd11:begin
	out = 7'b0000011;
end
4'd12:begin
	out = 7'b1000110;
end
4'd13:begin
	out = 7'b0100001;
end
4'd14:begin
	out = 7'b0000110;
end
4'd15:begin
	out = 7'b0001110;
end
default:begin
	out = 7'b1111111;
end

endcase
end
endmodule
