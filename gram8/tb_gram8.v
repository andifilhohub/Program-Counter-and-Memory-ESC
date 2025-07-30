`include "gram8.v"

module tb_gram8;
    // Relógio
    reg relogio_tb;
    
    // Habilitação
    reg habilita_tb;
    
    // Entradas e saída
    reg [15:0] dado_tb;
    reg [2:0] endereco_tb;
    wire [15:0] resultado_tb;

    // Unidade sob teste
    minha_ram8 instancia_ram (
        .dado_in(dado_tb),
        .endereco_in(endereco_tb),
        .habilita_in(habilita_tb),
        .relogio_in(relogio_tb),
        .dado_out(resultado_tb)
    );

    initial begin
        $display("Simulação personalizada da RAM 8");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gram8);
        
        // Inicialização
        relogio_tb = 0;
        habilita_tb = 0;
        dado_tb = 16'b0000000000000000;
        endereco_tb = 3'b000;
        
        // Teste escrevendo em diferentes endereços
        #1 habilita_tb = 1; dado_tb = 16'b1010101010101010; endereco_tb = 3'b000; 
        #2 habilita_tb = 1; dado_tb = 16'b0101010101010101; endereco_tb = 3'b001;
        #2 habilita_tb = 1; dado_tb = 16'b1111000011110000; endereco_tb = 3'b010; 
        #2 habilita_tb = 1; dado_tb = 16'b0000111100001111; endereco_tb = 3'b011; 
        #2 habilita_tb = 1; dado_tb = 16'b1111111100000000; endereco_tb = 3'b100; 
        #2 habilita_tb = 1; dado_tb = 16'b0000000011111111; endereco_tb = 3'b101;
        #2 habilita_tb = 1; dado_tb = 16'b1010101001010101; endereco_tb = 3'b110; 
        #2 habilita_tb = 1; dado_tb = 16'b0101010110101010; endereco_tb = 3'b111; 
        
        // Teste de leitura dos registradores
        #2 habilita_tb = 0; endereco_tb = 3'b000;
        #2 endereco_tb = 3'b001; 
        #2 endereco_tb = 3'b010; 
        #2 endereco_tb = 3'b011; 
        #2 endereco_tb = 3'b100; 
        #2 endereco_tb = 3'b101;
        #2 endereco_tb = 3'b110; 
        #2 endereco_tb = 3'b111; 
        
        // Teste de atualização com habilita=0 (não deve alterar o valor)
        #2 habilita_tb = 0; dado_tb = 16'b1111111111111111; endereco_tb = 3'b000; // Não deve alterar o registrador
        #2 endereco_tb = 3'b000; // Verifica se o valor não foi alterado
        
        // Teste de atualização com habilita=1 (deve alterar o valor)
        #2 habilita_tb = 1; dado_tb = 16'b1111111111111111; endereco_tb = 3'b000; // Deve alterar o registrador
        #2 habilita_tb = 0; endereco_tb = 3'b000; // Verifica se o valor foi alterado
        
        #5 $finish;
    end

    initial begin
        $monitor("Tempo: %0t | Habilita: %d | Endereco: %d | Dado: %d | Resultado: %d", $time, habilita_tb, endereco_tb, dado_tb, resultado_tb);
    end

    always
        #1 relogio_tb = ~relogio_tb;
    
endmodule