`include "gram64.v"

module tb_gram64;
    // Relógio
    reg clock_tb;
    
    // Controle de escrita
    reg write_tb;
    
    // Entradas e saída
    reg [15:0] entrada_tb;
    reg [5:0] endereco_tb;
    wire [15:0] resultado_tb;

    // Unidade sob teste
    minha_ram64 instancia_memoria (
        .dados_entrada(entrada_tb),
        .endereco_acesso(endereco_tb),
        .controle_write(write_tb),
        .clock_principal(clock_tb),
        .dados_saida(resultado_tb)
    );

    initial begin
        $display("Simulação personalizada da RAM 64");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gram64);

        // Inicialização
        clock_tb = 0;
        write_tb = 0;
        entrada_tb = 16'b0000000000000000;
        endereco_tb = 6'b000000;

        // Teste escrevendo em diferentes endereços
        #1 write_tb = 1; entrada_tb = 16'b1010101010101010; endereco_tb = 6'b000000;
        #2 write_tb = 1; entrada_tb = 16'b0101010101010101; endereco_tb = 6'b000001;
        #2 write_tb = 1; entrada_tb = 16'b1111000011110000; endereco_tb = 6'b000010;
        #2 write_tb = 1; entrada_tb = 16'b0000111100001111; endereco_tb = 6'b000011;
        #2 write_tb = 1; entrada_tb = 16'b1111111100000000; endereco_tb = 6'b000100;
        #2 write_tb = 1; entrada_tb = 16'b0000000011111111; endereco_tb = 6'b000101;
        #2 write_tb = 1; entrada_tb = 16'b1010101001010101; endereco_tb = 6'b000110;
        #2 write_tb = 1; entrada_tb = 16'b0101010110101010; endereco_tb = 6'b000111;
        #2 write_tb = 1; entrada_tb = 16'b1100110011001100; endereco_tb = 6'b001000; 
        #2 write_tb = 1; entrada_tb = 16'b0011001100110011; endereco_tb = 6'b010000; 
        #2 write_tb = 1; entrada_tb = 16'b1010010110100101; endereco_tb = 6'b100000; 
        #2 write_tb = 1; entrada_tb = 16'b0101101001011010; endereco_tb = 6'b111111; 

        // Teste de leitura dos registradores
        #2 write_tb = 0; endereco_tb = 6'b000000;
        #2 endereco_tb = 6'b000001; 
        #2 endereco_tb = 6'b000010; 
        #2 endereco_tb = 6'b000011; 
        #2 endereco_tb = 6'b000100; 
        #2 endereco_tb = 6'b000101; 
        #2 endereco_tb = 6'b000110; 
        #2 endereco_tb = 6'b000111; 
        #2 endereco_tb = 6'b001000; 
        #2 endereco_tb = 6'b010000; 
        #2 endereco_tb = 6'b100000; 
        #2 endereco_tb = 6'b111111; 

        // Teste de atualização com write=0 
        #2 write_tb = 0; entrada_tb = 16'b1111111111111111; endereco_tb = 6'b000000; // Não deve alterar o registrador
        #2 endereco_tb = 6'b000000; // Verifica se o valor não foi alterado

        // Teste de atualização com write=1
        #2 write_tb = 1; entrada_tb = 16'b1111111111111111; endereco_tb = 6'b000000; // Deve alterar o registrador
        #2 write_tb = 0; endereco_tb = 6'b000000; // Verifica se o valor foi alterado

        #5 $finish;
    end

    initial begin
        $monitor("Tempo: %0t | Escrita: %b | Endereco: %6b | Entrada: %b | Resultado: %b", $time, write_tb, endereco_tb, entrada_tb, resultado_tb);
    end

    always
        #1 clock_tb = ~clock_tb;

endmodule