module lab6(clock, reset, out);
    input clock;
    input reset;
    output [6:0] out;
    wire clock_div;
	 wire [3:0]count;
    FrequencyDivider u_FreqDiv(.clk(clock), .reset(reset), .clk_div(clock_div));
    Counter u_counter(.clk(clock_div), .reset(reset), .count(count));
    SevenDisplay i_display(.count(count), .out(out));
endmodule

module FrequencyDivider(
    input clk,
    input reset,
    output reg clk_div
);
// 50 MHz to 1 Hz
    reg [25:0] inner_counter;
    always @(posedge clk or negedge reset) begin
        if(!reset) begin
           inner_counter <= 0;
           clk_div <= 1'b0;
        end
        else if(inner_counter == 26'd50000000) begin
            inner_counter <= 0;
            clk_div <= 1'b1; 
        end 
        else begin
            inner_counter <= inner_counter + 1;
            clk_div <= 1'b0;
       end 
    end
endmodule

module Counter(
    input clk,
    input reset,
    output reg [3:0] count
);
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            count <= 0;
        end
        else if (count == 4'd15)begin
           count <= 0; 
        end
        else begin
            count <= count + 1;
        end
    end
endmodule

module SevenDisplay(
    input [3:0] count,
    output reg [6:0] out
);
    always@(count) begin
        case(count)
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
