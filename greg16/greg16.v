module meu_registrador16 (input [15:0] entrada_dados, input controle_carrega, input clock_sinal, output reg [15:0] saida_reg);
    
    initial saida_reg <= 16'b0;

    always @ (posedge clock_sinal) begin
        if(controle_carrega == 1) saida_reg <= entrada_dados;
    end

endmodule