module minha_ram8(
    input [15:0] dado_in,
    input [2:0] endereco_in,
    input habilita_in,
    input relogio_in,
    output [15:0] dado_out
);
    reg [15:0] banco_reg [0:7];

    always @(posedge relogio_in) begin
        if (habilita_in) begin
            banco_reg[endereco_in] <= dado_in;
        end
    end

    assign dado_out = banco_reg[endereco_in];

endmodule
