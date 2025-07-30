// Demultiplexador 1x8 personalizado
module meu_demux8way (input entrada_sinal, input [2:0] controle_sel, output linha_a, output linha_b, output linha_c, output linha_d, output linha_e, output linha_f, output linha_g, output linha_h);
 
    assign linha_a = (controle_sel == 3'b000) ? entrada_sinal : 0;
    assign linha_b = (controle_sel == 3'b001) ? entrada_sinal : 0;
    assign linha_c = (controle_sel == 3'b010) ? entrada_sinal : 0;
    assign linha_d = (controle_sel == 3'b011) ? entrada_sinal : 0;
    assign linha_e = (controle_sel == 3'b100) ? entrada_sinal : 0;
    assign linha_f = (controle_sel == 3'b101) ? entrada_sinal : 0;
    assign linha_g = (controle_sel == 3'b110) ? entrada_sinal : 0;
    assign linha_h = (controle_sel == 3'b111) ? entrada_sinal : 0;

endmodule