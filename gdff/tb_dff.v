`include "dff.v"

module tb_dff;
  
`include "dff.v"
  reg clk;
module tb_dff;
  // relógio simulado
  reg clk_tb;
  reg reset_tb;

  // sinais
  reg entrada_tb;
  wire saida_tb;

  meu_dff instancia_dff (entrada_tb, clk_tb, reset_tb, saida_tb);

  initial begin
    $display("Simulação personalizada do DFF");
    $dumpfile("signals.vcd");
    $dumpvars(0, tb_dff);
    clk_tb = 0;
    reset_tb = 0;
    entrada_tb = 0;

    #1 reset_tb = 1;
    #1 reset_tb = 0;
    #2 entrada_tb = 0;
    #2 entrada_tb = 1;
    #2 entrada_tb = 1;
    #2 entrada_tb = 0;
    #2 entrada_tb = 1;
    #1 reset_tb = 1;
    #1 reset_tb = 0;

    #5 $finish;
  end

  initial begin
    $monitor("reset=%b clk=%b entrada=%b saida=%b", reset_tb, clk_tb, entrada_tb, saida_tb);
  end

  always 
    #1 clk_tb = ~clk_tb;

endmodule

