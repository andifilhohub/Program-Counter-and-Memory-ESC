`include "../gram4k/gram4k.v"
`include "../other_gates/gmux4way16/gmux4way16.v"
`include "../other_gates/gdmux4way/gdmux4way.v"

module minha_ram16k(
    input [15:0] entrada_dados,
    input [13:0] endereco_mem,
    input controle_escrita,
    input clock_sistema,
    output [15:0] saida_dados
);
    
    // Fios para conectar o dmux com os loads das RAMs
    wire habilita0, habilita1, habilita2, habilita3;
    
    // Fios para conectar as RAMs com o mux
    wire [15:0] dados_ram0, dados_ram1, dados_ram2, dados_ram3;

    // Dmux
    gdmux4way dmux_inst(.in(controle_escrita), .sel(endereco_mem[13:12]),
                      .a(habilita0), .b(habilita1),
                      .c(habilita2), .d(habilita3));

    // RAMs_4k
    minha_ram4k ram0(entrada_dados, endereco_mem[11:0], habilita0, clock_sistema, dados_ram0);
    minha_ram4k ram1(entrada_dados, endereco_mem[11:0], habilita1, clock_sistema, dados_ram1);
    minha_ram4k ram2(entrada_dados, endereco_mem[11:0], habilita2, clock_sistema, dados_ram2);
    minha_ram4k ram3(entrada_dados, endereco_mem[11:0], habilita3, clock_sistema, dados_ram3);

    // Mux
    gmux4way16 mux_inst(.a(dados_ram0), .b(dados_ram1),
                    .c(dados_ram2), .d(dados_ram3),
                    .sel(endereco_mem[13:12]), .y(saida_dados));

endmodule
