module testbench;



    reg     [2:0]   in;

    reg             enable;



    wire    [7:0]   out;



    decoder u1(.in(in),.enable(enable),.out(out));



    initial begin

        

        // enable = 0

        enable = 1'b0;



        in = 3'b000;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b001;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b010;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b011;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b100;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b101;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20



        in = 3'b110;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20





        in = 3'b111;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20



        // enable = 1

        enable = 1'b1;



        in = 3'b000;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b001;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b010;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        

        #20

        in = 3'b011;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b100;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20

        

        in = 3'b101;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20



        in = 3'b110;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);

        #20





        in = 3'b111;



        #5

        $display ("in = %b, enable = %b; out = %b", in, enable, out);



        $finish;



    end



endmodule





module decoder(in, enable, out);



    input       [2:0]   in;

    input               enable;



    output reg  [7:0]   out;



    /* modify the code here*/    
    always@(*)
    begin
        if(enable)
        begin
            case(in)
                3'b000: 
                    out = 8'd1;
                3'b001:
                    out = 8'd2;
                3'b010:
                    out = 8'd4;
                3'b011:
                    out = 8'd8;
                3'b100:
                    out = 8'd16;
                3'b101:
                    out = 8'd32;
                3'b110:
                    out = 8'd64;
                3'b111:
                    out = 8'd128;
                default:
                    out = 8'd0;
            endcase
        end
        else
            out = 8'd0;
        begin
        end
    end


endmodule

