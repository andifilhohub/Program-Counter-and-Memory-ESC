module meu_contador16 (
    input [15:0] entrada,
    input reiniciar,
    input carregar,
    input soma,
    input relogio,
    output reg [15:0] resultado
);

    initial resultado = 16'b0;

    always @ (posedge relogio) begin
        if (reiniciar)
            resultado <= 16'b0;
        else if (carregar)
            resultado <= entrada;
        else if (soma)
            resultado <= resultado + 16'b1;
    end

endmodule