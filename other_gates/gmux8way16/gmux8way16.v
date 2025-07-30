// Multiplexador 8-way 16-bit personalizado
module meu_mux8way16 (
    input [15:0] entrada_a, input [15:0] entrada_b, input [15:0] entrada_c, input [15:0] entrada_d,
    input [15:0] entrada_e, input [15:0] entrada_f, input [15:0] entrada_g, input [15:0] entrada_h,
    input [2:0] seletor_ctrl, output [15:0] saida_dados
);
    
    assign saida_dados = (seletor_ctrl == 3'b000) ? entrada_a :
                         (seletor_ctrl == 3'b001) ? entrada_b :
                         (seletor_ctrl == 3'b010) ? entrada_c :
                         (seletor_ctrl == 3'b011) ? entrada_d :
                         (seletor_ctrl == 3'b100) ? entrada_e :
                         (seletor_ctrl == 3'b101) ? entrada_f :
                         (seletor_ctrl == 3'b110) ? entrada_g : entrada_h;
    
endmodule
