# compila o testbench
iverilog -o design.vvp tb_gdmux4way16.v 

# executa a simulação
vvp design.vvp

# invoca o gtk para visualização
gtkwave signals.vcd
