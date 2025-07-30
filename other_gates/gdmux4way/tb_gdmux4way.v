`include "gdmux4way.v"

module tb_gdmux4way;

    reg entrada_tb;
    reg [1:0] sel_tb;
    wire resultado_a, resultado_b, resultado_c, resultado_d;

    meu_demux4way instancia_teste (.entrada(entrada_tb), .seletor(sel_tb), .saida_a(resultado_a), .saida_b(resultado_b), .saida_c(resultado_c), .saida_d(resultado_d));

    initial begin
        $display("Teste personalizado para porta DEMUX 4-way combinacional");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_gdmux4way);

        #0 entrada_tb = 1; sel_tb = 2'b00;
        #10 entrada_tb = 1; sel_tb = 2'b01;
        #10 entrada_tb = 1; sel_tb = 2'b10;
        #10 entrada_tb = 1; sel_tb = 2'b11;

        #10 $finish;
    end

    initial begin
        $monitor("tempo=%03d: \tentrada=%d,seletor=%d,saida_a=%d,saida_b=%d,saida_c=%d,saida_d=%d \n", $time, entrada_tb, sel_tb, resultado_a, resultado_b, resultado_c, resultado_d);
    end

endmodule