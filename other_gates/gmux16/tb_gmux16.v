`include "gmux16.v"

module tb_gmux16;
    reg [15:0] a, b;
    reg sel;
    wire [15:0] y;

    gmux16 uut (a, b, sel, y);

    initial begin
        $display("Testbench para gate MUX 16 bits combinacional");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gmux16);

        # 0 a = $random; b = $random; sel = 0;
        # 10 a = $random; b = $random; sel = 1;

        # 10 $finish;
    end

    initial begin
        $monitor("t=%03d: \ta=%d,b=%d,sel=%d,y=%d \n", $time, a, b, sel, y);
    end
endmodule