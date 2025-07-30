# compila o testbench
iverilog -o design.vvp tb_gram16k.v 

# executa a simulação
vvp design.vvp

# invoca o gtk para visualização
gtkwave signals.vcd
