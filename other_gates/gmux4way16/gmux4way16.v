// Multiplexador 4-way 16-bit personalizado
module meu_mux4way16 (
    input [15:0] canal_a, 
    input [15:0] canal_b, 
    input [15:0] canal_c, 
    input [15:0] canal_d, 
    input [1:0] controle_sel, 
    output [15:0] resultado_saida
);
    
    assign resultado_saida = (controle_sel == 2'b00) ? canal_a :
                             (controle_sel == 2'b01) ? canal_b :
                             (controle_sel == 2'b10) ? canal_c : canal_d;
    
endmodule
