# compila o testbench
iverilog -o design.vvp tb_gram64.v 

# executa a simulação
vvp design.vvp

# invoca o gtk para visualização
gtkwave signals.vcd
