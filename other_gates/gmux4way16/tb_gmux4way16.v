`include "gmux4way16.v"

module tb_gmux4way16;
    reg [15:0] a, b, c, d;
    reg [1:0] sel;
    wire [15:0] y;

    gmux4way16 uut (a, b, c, d, sel, y);

    initial begin
        $display("Testbench para gate MUX 4-way 16-bit");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gmux4way16);

        a = 16'b0000000000000000;
        b = 16'b1111111111111111;
        c = 16'b1010101010101010;
        d = 16'b0101010101010101;

        sel = 2'b00;
        #10;
        sel = 2'b01;
        #10;
        sel = 2'b10;
        #10;
        sel = 2'b11;
        #10;

        $finish;
    end

    initial begin
        $monitor("t=%03d: \ta=%b,b=%b,c=%b,d=%b,sel=%b,y=%b \n", $time, a, b, c, d, sel, y);
    end
endmodule