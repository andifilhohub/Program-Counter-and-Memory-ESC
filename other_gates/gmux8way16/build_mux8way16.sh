#!/bin/bash
# compila o design e o testbench, gerando um arquivo de design().vvp)
iverilog -o design.vvp tb_gmux8way16.v ../mux4way16/gmux4way16.v ../mux16/gmux16.v

# Verifica a saída do design
vvp design.vvp

# Invoca o GTKWave para visualizar as ondas
gtkwave signals.vcd