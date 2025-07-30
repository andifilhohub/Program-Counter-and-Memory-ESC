`include "greg16.v"

module tb_greg16;
  
    // Relógio do sistema
    reg clock_tb;

    // Controle de carga
    reg carregar_tb;

    // Entradas e saídas
    reg [15:0] valor_entrada;
    wire [15:0] valor_saida;

    // Unidade em teste
    meu_registrador16 instancia_reg (
        .entrada_dados(valor_entrada),
        .controle_carrega(carregar_tb),
        .clock_sinal(clock_tb),
        .saida_reg(valor_saida)
    );

    initial begin
        $display("Simulação personalizada do Registrador 16 bits");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_greg16);
        clock_tb = 0;
        carregar_tb = 0;
        valor_entrada = 16'b0000000000000000;

        #1 carregar_tb = 1; valor_entrada = 16'b1010101010101010;
        #1 carregar_tb = 0; 
        #2 valor_entrada = 16'b0101010101010101;
        #2 carregar_tb = 1; 
        #2 carregar_tb = 0;
        #2 valor_entrada = 16'b1111000011110000;
        #2 carregar_tb = 1;
        #2 carregar_tb = 0;

        #5 $finish;
    end

    initial begin
        $monitor("Tempo: %0t | Carregar: %b | Entrada: %b | Saida: %b", $time, carregar_tb, valor_entrada, valor_saida);
    end

    always 
        #1 clock_tb = ~clock_tb;

endmodule
