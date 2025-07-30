module meu_demux4way16 (
    input [15:0] dados_entrada,
    input [1:0] controle_sel,
    output [15:0] canal0,
    output [15:0] canal1,
    output [15:0] canal2,
    output [15:0] canal3
);
    assign canal0 = (controle_sel == 2'b00) ? dados_entrada : 16'b0;
    assign canal1 = (controle_sel == 2'b01) ? dados_entrada : 16'b0;
    assign canal2 = (controle_sel == 2'b10) ? dados_entrada : 16'b0;
    assign canal3 = (controle_sel == 2'b11) ? dados_entrada : 16'b0;

endmodule