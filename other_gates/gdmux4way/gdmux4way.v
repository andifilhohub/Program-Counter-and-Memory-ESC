// Demultiplexador 1x4 personalizado
module meu_demux4way (input entrada, input [1:0] seletor, output saida_a, output saida_b, output saida_c, output saida_d);

    assign saida_a = (seletor == 2'b00) ? entrada : 0;
    assign saida_b = (seletor == 2'b01) ? entrada : 0;
    assign saida_c = (seletor == 2'b10) ? entrada : 0;
    assign saida_d = (seletor == 2'b11) ? entrada : 0;

endmodule
