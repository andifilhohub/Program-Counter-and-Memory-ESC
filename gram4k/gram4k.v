`include "../gram512/gram512.v"

module minha_ram4k(
    input [15:0] dado_in,
    input [11:0] endereco_in,
    input habilita_in,
    input relogio_in,
    output [15:0] dado_out
);
    
    // Fios para conectar o dmux com os loads das RAMs
    wire habilita0, habilita1, habilita2, habilita3, habilita4, habilita5, habilita6, habilita7;
    // Fios para conectar as RAMs com o mux
    wire [15:0] dado_ram0, dado_ram1, dado_ram2, dado_ram3, dado_ram4, dado_ram5, dado_ram6, dado_ram7;

    // Dmux
    gdmux8way dmux_inst(
        .in(habilita_in), .sel(endereco_in[11:9]),
        .a(habilita0), .b(habilita1), .c(habilita2), .d(habilita3),
        .e(habilita4), .f(habilita5), .g(habilita6), .h(habilita7)
    );

    // RAMs_512
    gram512 ram0(dado_in, endereco_in[8:0], habilita0, relogio_in, dado_ram0);
    gram512 ram1(dado_in, endereco_in[8:0], habilita1, relogio_in, dado_ram1);
    gram512 ram2(dado_in, endereco_in[8:0], habilita2, relogio_in, dado_ram2);
    gram512 ram3(dado_in, endereco_in[8:0], habilita3, relogio_in, dado_ram3);
    gram512 ram4(dado_in, endereco_in[8:0], habilita4, relogio_in, dado_ram4);
    gram512 ram5(dado_in, endereco_in[8:0], habilita5, relogio_in, dado_ram5);
    gram512 ram6(dado_in, endereco_in[8:0], habilita6, relogio_in, dado_ram6);
    gram512 ram7(dado_in, endereco_in[8:0], habilita7, relogio_in, dado_ram7);

    // Mux
    gmux8way16 mux_inst(
        .a(dado_ram0), .b(dado_ram1), .c(dado_ram2), .d(dado_ram3),
        .e(dado_ram4), .f(dado_ram5), .g(dado_ram6), .h(dado_ram7),
        .sel(endereco_in[11:9]), .out(dado_out)
    );

endmodule
