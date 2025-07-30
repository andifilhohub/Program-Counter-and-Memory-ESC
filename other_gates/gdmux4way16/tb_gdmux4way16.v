`include "gdmux4way16.v"

module tb_gdmux4way16;
    reg [15:0] entrada_dados;
    reg [1:0] seletor_tb;
    wire [15:0] saida0, saida1, saida2, saida3;

    meu_demux4way16 instancia_demux (
        .dados_entrada(entrada_dados),
        .controle_sel(seletor_tb),
        .canal0(saida0),
        .canal1(saida1),
        .canal2(saida2),
        .canal3(saida3)
    );

    initial begin
        $display("Teste personalizado do Demux4way16");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gdmux4way16);

        entrada_dados = 16'hA5A5; seletor_tb = 2'b00; #10;
        entrada_dados = 16'h5A5A; seletor_tb = 2'b01; #10;
        entrada_dados = 16'hFFFF; seletor_tb = 2'b10; #10;
        entrada_dados = 16'h0000; seletor_tb = 2'b11; #10;

        $finish;
    end

    initial begin
        $monitor("Tempo: %0t | Seletor: %b | Entrada: %h | Canal0: %h | Canal1: %h | Canal2: %h | Canal3: %h", 
                    $time, seletor_tb, entrada_dados, saida0, saida1, saida2, saida3);
    end

endmodule