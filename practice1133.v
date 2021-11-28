module practice1113(num, result);

    input   [3:0]   num;

    output  reg[6:0]   result;

    reg [3:0]result_n;

    /* modify the code here */
    always@(num)
    begin
    if(num <=2)
        result_n = num;
    else if(num <= 5)
        result_n = (num + 1) * 2;
    else if(num <= 7)
        result_n =  (num - 1) * 2;
    else
        result_n = 5'b0;
    end
    
    always@(result_n)
    begin
    case(result_n)
        4'd0:
            result = 7'b1000000;
        4'd1:
            result = 7'b1111001;
        4'd2:
            result = 7'b0100100;
        4'd3:
            result = 7'b0110000;
        4'd4:
            result = 7'b0011001;
        4'd5:
            result = 7'b0010010;
        4'd6:
            result = 7'b0000010;
        4'd7:
            result = 7'b1111000;
        4'd8:
            result = 7'b0000000;
        4'd9:
            result = 7'b0010000;
        4'd10:
            result = 7'b0001000;
        4'd11:
            result = 7'b0000011;
        4'd12:
            result = 7'b1000110;
        default:
            result = 7'b0000000;
    endcase
    end

endmodule
