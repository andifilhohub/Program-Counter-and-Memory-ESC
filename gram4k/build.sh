# compila o testbench
iverilog -o design.vvp tb_gram4k.v 

# executa a simulação
vvp design.vvp

# invoca o gtk para visualização
gtkwave signals.vcd
