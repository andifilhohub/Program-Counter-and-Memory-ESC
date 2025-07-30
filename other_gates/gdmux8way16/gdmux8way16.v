module gdmux8way16 (
    input [15:0] d,
    input [2:0] sel,
    output [15:0] y0,
    output [15:0] y1,
    output [15:0] y2,
    output [15:0] y3,
    output [15:0] y4,
    output [15:0] y5,
    output [15:0] y6,
    output [15:0] y7
);
    assign y0 = (sel == 3'b000) ? d : 16'b0;
    assign y1 = (sel == 3'b001) ? d : 16'b0;
    assign y2 = (sel == 3'b010) ? d : 16'b0;
    assign y3 = (sel == 3'b011) ? d : 16'b0;
    assign y4 = (sel == 3'b100) ? d : 16'b0;
    assign y5 = (sel == 3'b101) ? d : 16'b0;
    assign y6 = (sel == 3'b110) ? d : 16'b0;
    assign y7 = (sel == 3'b111) ? d : 16'b0;
    
endmodule
