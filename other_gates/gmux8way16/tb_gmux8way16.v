`include "gmux8way16.v"

module tb_gmux8way16;
    reg [15:0] a, b, c, d, e, f, g, h;
    reg [2:0] sel;
    wire [15:0] out;

    gmux8way16 mux (
        .a(a), .b(b), .c(c), .d(d),
        .e(e), .f(f), .g(g), .h(h),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("Testbench para multiplexador 8-way 16-bit");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gmux8way16);

        a = $random;
        b = $random;
        c = $random;
        d = $random;
        e = $random;
        f = $random;
        g = $random;
        h = $random;

        sel = 3'b000;
        #10;

        sel = 3'b001;
        #10;

        sel = 3'b010;
        #10;

        sel = 3'b011;
        #10;

        sel = 3'b100;
        #10;

        sel = 3'b101;
        #10;

        sel = 3'b110;
        #10;

        sel = 3'b111;
        #10;

        $finish;
    end

    initial begin
        $monitor("sel=%b out=%h", sel, out);
    end
endmodule