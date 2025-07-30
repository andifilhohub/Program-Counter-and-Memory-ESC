# compila o testbench
iverilog -o design.vvp tb_gpc16.v 

# executa a simulação
vvp design.vvp

# invoca o gtk para visualização
gtkwave signals.vcd
