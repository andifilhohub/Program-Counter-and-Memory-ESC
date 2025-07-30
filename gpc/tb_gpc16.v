`include "gpc16.v"

module tb_gpc16;
  
    // clock
    reg clk;
    
    // sinais
    reg reset;
    reg load;
    reg increment;
    reg [15:0] w;
    wire [15:0] y;

    // Unit Under Test
    gpc16 uut (
        .w(w),
        .reset(reset),
        .load(load),
        .increment(increment),
        .clk(clk),
        .y(y)
    );

    initial begin
        $display("pc16 Testbench");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gpc16);
        
        // Inicializa valores
        clk = 0;
        reset = 0;
        load = 0;
`include "gpc16.v"
        w = 16'b0;
module tb_gpc16;
    // relógio
    reg relogio_tb;
    
    // sinais
    reg reiniciar_tb;
    reg carregar_tb;
    reg soma_tb;
    reg [15:0] entrada_tb;
    wire [15:0] resultado_tb;

    // Unidade em teste
    meu_contador16 instancia_contador (
        .entrada(entrada_tb),
        .reiniciar(reiniciar_tb),
        .carregar(carregar_tb),
        .soma(soma_tb),
        .relogio(relogio_tb),
        .resultado(resultado_tb)
    );

    initial begin
        $display("Simulação personalizada do contador 16 bits");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gpc16);
        
        // Inicializa valores
        relogio_tb = 0;
        reiniciar_tb = 0;
        carregar_tb = 0;
        soma_tb = 0;
        entrada_tb = 16'b0;

        // Aplica reset para garantir resultado = 0
        #1 reiniciar_tb = 1;
        #1 reiniciar_tb = 0;
        
        // Testa a operação carregar para carregar valor
        #1 carregar_tb = 1; entrada_tb = 16'b1010101010101010;
        #1 carregar_tb = 0;
        
        // Testa o incremento: incrementa resultado por 3 ciclos de clock
        #2 soma_tb = 1;
        #3 soma_tb = 0;
        
        // Testa novo carregar
        #2 carregar_tb = 1; entrada_tb = 16'b0101010101010101;
        #1 carregar_tb = 0;

        // Testa reset após carregar
        #2 reiniciar_tb = 1;
        #1 reiniciar_tb = 0;
        
        // Testa incremento contínuo por 5 ciclos
        #2 soma_tb = 1;
        #5 soma_tb = 0;

        #5 $finish;
    end

    initial begin
        $monitor("Tempo: %0t | Reiniciar: %d | Carregar: %d | Soma: %d | Entrada: %d | Resultado: %d", 
                 $time, reiniciar_tb, carregar_tb, soma_tb, entrada_tb, resultado_tb);
    end

    always 
        #1 relogio_tb = ~relogio_tb;

endmodule
