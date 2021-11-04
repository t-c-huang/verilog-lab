module testbench;



    reg [3:0] in;



    wire [1:0] out;

    wire valid;



    encoder u1(.in(in),.valid(valid),.out(out));



    initial begin

        

        in = 4'b0001;



        #5

        

        if(valid)

            $display ("in = %b; Output is valid, out = %b", in, out);

        else

            $display ("in = %b; Output is not valid, out = %b", in, out);



        #20

        

        in = 4'b0010;



        #5

        

        if(valid)

            $display ("in = %b; Output is valid, out = %b", in, out);

        else

            $display ("in = %b; Output is not valid, out = %b", in, out);



        #20

        

        in = 4'b0100;



        #5

        

        if(valid)

            $display ("in = %b; Output is valid, out = %b", in, out);

        else

            $display ("in = %b; Output is not valid, out = %b", in, out);



        #20

        

        in = 4'b1000;



        #5

        

        if(valid)

            $display ("in = %b; Output is valid, out = %b", in, out);

        else

            $display ("in = %b; Output is not valid, out = %b", in, out);



        #20

        

        in = 4'b0000;



        #5

        

        if(valid)

            $display ("in = %b; Output is valid, out = %b", in, out);

        else

            $display ("in = %b; Output is not valid, out = %b", in, out);



        #20

        

        in = 4'b1111;



        #5

        

        if(valid)

            $display ("in = %b; Output is valid, out = %b", in, out);

        else

            $display ("in = %b; Output is not valid, out = %b", in, out);





        $finish;



    end



endmodule





module encoder(in, valid, out);



    input [3:0] in;



    output reg valid;

    output reg [1:0] out;



    /* modify the code here*/
    always@(in)
    begin
    case(in)
    4'b0001:
    begin
        out = 2'b00;
        valid = 1'b1;
    end
    4'b0010:
    begin
        out = 2'b01;
        valid = 1'b1;
    end
    4'b0100:
    begin
        out = 2'b10;
        valid = 1'b1;
    end
    4'b1000:
    begin
        out = 2'b11;
        valid = 1'b1;
    end
    default:
    begin
        out = 2'b00;
        valid = 1'b0;
    end
    endcase
    end
    
endmodule
