module testbench;

    reg     [3:0]   in;

    wire    [3:0]   out;

    shifter u1(.in(in),.out(out));



    initial begin

        

        in = 4'b1010;



        #5

        if(out == 4'b1101)

            $display ("in = %b; The result of arithmetically shift right = %b", in, out);

        else if(out == 4'b0101)

            $display ("in = %b; The result of logically shift right = %b", in, out);

        else

            $display ("The input does not shift correctly!");

        #20

        

        

        $finish;



    end



endmodule





module shifter(in, out);



    input       [3:0]   in;

    output      [3:0]   out;



    /* modify the code here*/    
    assign out[3:0] = {in[3], in[3:1]};


endmodule
