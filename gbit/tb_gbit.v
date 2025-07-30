`include "gbit.v"
`include "gbit.v"
module tb_gbit;
  // relogio
  reg relogio;
`include "gbit.v"
  reg habilita;
module tb_gbit;
  // relógio do teste
  reg clk_tb;

  // controle de escrita
  reg enable_tb;

  // entrada e saída
  reg entrada_tb;
  wire saida_tb;

  // instância do registrador
  gbit reg_inst (
        .dado(entrada_tb),
        .habilita(enable_tb),
        .relogio(clk_tb),
        .resultado(saida_tb)
  );

  initial begin
    $display("Simulação personalizada do registrador 1 bit");
    $dumpfile("signals.vcd");
    $dumpvars(0, tb_gbit);
    clk_tb = 0;
    enable_tb = 0;
    entrada_tb = 0;

    #1 enable_tb = 1;
    #1 enable_tb = 0;
    #2 entrada_tb = 0;
    #2 entrada_tb = 1;
    #2 entrada_tb = 1;
    #2 entrada_tb = 0;
    #2 entrada_tb = 1;
    #1 enable_tb = 1;
    #1 enable_tb = 0;
    
    #5 $finish;
  end

  initial begin
    $monitor("enable=%b clk=%b entrada=%b saida=%b", enable_tb, clk_tb, entrada_tb, saida_tb);
  end

  always 
    #1 clk_tb = ~clk_tb;

endmodule
