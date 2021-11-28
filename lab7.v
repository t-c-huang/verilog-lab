module lab7(clock, reset, in, out);
    input clock;
    input reset;
    input in;
    output [6:0] out;

    wire clock_div;
    wire [3:0] tmp;
    FrequencyDivider u_FreqDiv(.clock(clock),.clock_div(clock_div));
    MooreMachine u_Moore(.clock_div(clock_div),.reset(reset),.in(in),.tmp(tmp));
    SevenDisplay i_display(.tmp(tmp),.out(out));
endmodule
module FrequencyDivider (clock, clock_div);
    input clock;
    output reg clock_div;
    reg [24:0] counter = 25'd0;
    
    always @(posedge clock) begin
        if (counter == 25'd25000000) begin
            clock_div <= ~clock_div;
            counter <= counter + 1;
        end
        else if (counter == 25'd50000000) begin
            clock_div <= ~clock_div;
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule

module MooreMachine(clock_div, reset, in, tmp);
    input clock_div;
    input reset;
    input in;
    output reg [3:0] tmp = 4'd0;

    always @(posedge clock_div or negedge reset) begin
        if (!reset) begin
            tmp <= 4'd0;
        end
        else if (in == 0) begin
            case (tmp)
                4'd0:
                    tmp = 4'd1;
                4'd1:
                    tmp = 4'd2;
                4'd2:
                    tmp = 4'd3;
                4'd3:
                    tmp = 4'd4;
                4'd4:
                    tmp = 4'd5;
                4'd5:
                    tmp = 4'd0;
                default:
                    tmp = 4'd0;
                
            endcase
        end
        else begin
            case (tmp)
                4'd0:
                    tmp = 4'd3;
                4'd1:
                    tmp = 4'd5;
                4'd2:
                    tmp = 4'd0;
                4'd3:
                    tmp = 4'd1;
                4'd4:
                    tmp = 4'd2;
                4'd5:
                    tmp = 4'd4;
                default:
                    tmp = 4'd0;
            endcase
        end
    end
endmodule

module SevenDisplay(tmp, out);
    input [3:0] tmp;
    output reg [6:0]out;
    always@(tmp) begin
        case(tmp)
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
            default:begin
                out = 7'b1111111;
            end
        endcase
    end
endmodule
