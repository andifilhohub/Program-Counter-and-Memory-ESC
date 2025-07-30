`include "gdmux8way16.v"

module tb_gdmux8way16;
    reg [15:0] d;
    reg [2:0] sel;
    wire [15:0] y0, y1, y2, y3, y4, y5, y6, y7;

    gdmux8way16 uut (
        .d(d),
        .sel(sel),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4),
        .y5(y5),
        .y6(y6),
        .y7(y7)
    );

    initial begin
        $display("Gdmux8way16 Testbench");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gdmux8way16);

        d = 16'hA5A5; sel = 3'b000; #10;
        d = 16'h5A5A; sel = 3'b001; #10;
        d = 16'hFFFF; sel = 3'b010; #10;
        d = 16'h0000; sel = 3'b011; #10;
        d = 16'h1234; sel = 3'b100; #10;
        d = 16'h5678; sel = 3'b101; #10;
        d = 16'h9ABC; sel = 3'b110; #10;
        d = 16'hDEF0; sel = 3'b111; #10;

        $finish;
    end

    initial begin
        $monitor("Time: %0t | Sel: %b | D: %h | Y0: %h | Y1: %h | Y2: %h | Y3: %h | Y4: %h | Y5: %h | Y6: %h | Y7: %h", 
                 $time, sel, d, y0, y1, y2, y3, y4, y5, y6, y7);
    end

endmodule