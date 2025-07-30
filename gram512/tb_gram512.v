`include "gram512.v"

module tb_gram512;
    // Relógio do sistema
    reg clock_sistema;
    
    // Controle de gravação
    reg gravar_tb;
    
    // Entradas e saídas
    reg [15:0] dado_entrada;
    reg [8:0] pos_endereco; 
    wire [15:0] dado_resultado;

    // Unidade em teste
    minha_memoria512 memoria_teste (
        .valor_entrada(dado_entrada),
        .posicao_mem(pos_endereco),
        .enable_write(gravar_tb),
        .sinal_clock(clock_sistema),
        .valor_saida(dado_resultado)
    );

    initial begin
        $display("Simulação personalizada da Memória 512");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gram512);

        // Inicialização
        clock_sistema = 0;
        gravar_tb = 0;
        dado_entrada = 16'b0000000000000000;
        pos_endereco = 9'b000000000;
        
        // Teste escrevendo em diferentes endereços
        #1  gravar_tb = 1; dado_entrada = 16'b1010101010101010; pos_endereco = 9'd0;
        #2  gravar_tb = 1; dado_entrada = 16'b0101010101010101; pos_endereco = 9'd1;
        #2  gravar_tb = 1; dado_entrada = 16'b1111000011110000; pos_endereco = 9'd2;
        #2  gravar_tb = 1; dado_entrada = 16'b0000111100001111; pos_endereco = 9'd3;
        #2  gravar_tb = 1; dado_entrada = 16'b1111111100000000; pos_endereco = 9'd4;
        #2  gravar_tb = 1; dado_entrada = 16'b0000000011111111; pos_endereco = 9'd5;
        #2  gravar_tb = 1; dado_entrada = 16'b1010101001010101; pos_endereco = 9'd100;
        #2  gravar_tb = 1; dado_entrada = 16'b0101010110101010; pos_endereco = 9'd200;
        #2  gravar_tb = 1; dado_entrada = 16'b1100110011001100; pos_endereco = 9'd300; 
        #2  gravar_tb = 1; dado_entrada = 16'b0011001100110011; pos_endereco = 9'd400; 
        #2  gravar_tb = 1; dado_entrada = 16'b1010010110100101; pos_endereco = 9'd500; 
        #2  gravar_tb = 1; dado_entrada = 16'b0101101001011010; pos_endereco = 9'd511; 

        // Teste de leitura dos registradores
        #2  gravar_tb = 0; pos_endereco = 9'd0;
        #2  pos_endereco = 9'd1; 
        #2  pos_endereco = 9'd2; 
        #2  pos_endereco = 9'd3; 
        #2  pos_endereco = 9'd4; 
        #2  pos_endereco = 9'd5; 
        #2  pos_endereco = 9'd100; 
        #2  pos_endereco = 9'd200; 
        #2  pos_endereco = 9'd300; 
        #2  pos_endereco = 9'd400; 
        #2  pos_endereco = 9'd500; 
        #2  pos_endereco = 9'd511; 

        // Teste de atualização com gravar=0 
        #2  gravar_tb = 0; dado_entrada = 16'b1111111111111111; pos_endereco = 9'd0; // Não deve alterar
        #2  pos_endereco = 9'd0; // Verifica se o valor não foi alterado

        // Teste de atualização com gravar=1
        #2  gravar_tb = 1; dado_entrada = 16'b1111111111111111; pos_endereco = 9'd0; // Deve alterar
        #2  gravar_tb = 0; pos_endereco = 9'd0; // Verifica a alteração

        #5  $finish;
    end

    initial begin
        $monitor("Tempo: %0t | Gravar: %b | Posicao: %3d | Entrada: %b | Resultado: %b", $time, gravar_tb, pos_endereco, dado_entrada, dado_resultado);
    end

    always #1 clock_sistema = ~clock_sistema;
    
endmodule