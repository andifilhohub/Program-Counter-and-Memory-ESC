`include "gram16k.v"

module tb_gram16k;
    // Relógio do sistema
    reg clock_tb;
    
    // Sinal de habilitação de escrita
    reg esc_hab_tb;
    
    // Entradas e saída
    reg [15:0] entrada_tb;
    reg [13:0] endereco_tb;
    wire [15:0] resultado_tb;

    // Unidade sob teste
    minha_ram16k instancia_memoria (
        .entrada_dados(entrada_tb),
        .endereco_mem(endereco_tb),
        .controle_escrita(esc_hab_tb),
        .clock_sistema(clock_tb),
        .saida_dados(resultado_tb)
    );

    initial begin
        $display("Simulação personalizada da RAM 16K");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gram16k);

        // Inicialização
        clock_tb = 0;
        esc_hab_tb = 0;
        entrada_tb = 16'b0;
        endereco_tb = 14'b0;
        
        // Teste escrevendo em diferentes endereços
        #1  esc_hab_tb = 1; entrada_tb = 16'b1010101010101010; endereco_tb = 14'd0;
        #2  esc_hab_tb = 1; entrada_tb = 16'b0101010101010101; endereco_tb = 14'd1;
        #2  esc_hab_tb = 1; entrada_tb = 16'b1111000011110000; endereco_tb = 14'd2;
        #2  esc_hab_tb = 1; entrada_tb = 16'b0000111100001111; endereco_tb = 14'd3;
        #2  esc_hab_tb = 1; entrada_tb = 16'b1111111100000000; endereco_tb = 14'd4;
        #2  esc_hab_tb = 1; entrada_tb = 16'b0000000011111111; endereco_tb = 14'd5;
        #2  esc_hab_tb = 1; entrada_tb = 16'b1010101001010101; endereco_tb = 14'd100;
        #2  esc_hab_tb = 1; entrada_tb = 16'b0101010110101010; endereco_tb = 14'd200;
        #2  esc_hab_tb = 1; entrada_tb = 16'b1100110011001100; endereco_tb = 14'd300; 
        #2  esc_hab_tb = 1; entrada_tb = 16'b0011001100110011; endereco_tb = 14'd400; 
        #2  esc_hab_tb = 1; entrada_tb = 16'b1010010110100101; endereco_tb = 14'd500; 
        #2  esc_hab_tb = 1; entrada_tb = 16'b0101101001011010; endereco_tb = 14'd16383; 

        // Teste de leitura dos registradores
        #2  esc_hab_tb = 0; endereco_tb = 14'd0;
        #2  endereco_tb = 14'd1; 
        #2  endereco_tb = 14'd2; 
        #2  endereco_tb = 14'd3; 
        #2  endereco_tb = 14'd4; 
        #2  endereco_tb = 14'd5; 
        #2  endereco_tb = 14'd100; 
        #2  endereco_tb = 14'd200; 
        #2  endereco_tb = 14'd300; 
        #2  endereco_tb = 14'd400; 
        #2  endereco_tb = 14'd500; 
        #2  endereco_tb = 14'd16383; 

        // Teste de atualização com esc_hab=0
        #2  esc_hab_tb = 0; entrada_tb = 16'b1111111111111111; endereco_tb = 14'd0; // Não deve alterar
        #2  endereco_tb = 14'd0; // Verifica se o valor não foi alterado

        // Teste de atualização com esc_hab=1
        #2  esc_hab_tb = 1; entrada_tb = 16'b1111111111111111; endereco_tb = 14'd0; // Deve alterar
        #2  esc_hab_tb = 0; endereco_tb = 14'd0; // Verifica a alteração

        #5  $finish;
    end

    initial begin
        $monitor("Tempo: %0t | Escrita: %b | Endereco: %4d | Entrada: %b | Resultado: %b", $time, esc_hab_tb, endereco_tb, entrada_tb, resultado_tb);
    end

    always #1 clock_tb = ~clock_tb;
    
endmodule