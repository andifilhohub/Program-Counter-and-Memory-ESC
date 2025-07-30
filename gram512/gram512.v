`include "../gram64/gram64.v"

module minha_memoria512(
    input [15:0] valor_entrada,
    input [8:0] posicao_mem,
    input enable_write,
    input sinal_clock,
    output [15:0] valor_saida
);
    
    // Fios para conectar o dmux com os loads das RAMs
    wire ctrl0, ctrl1, ctrl2, ctrl3, ctrl4, ctrl5, ctrl6, ctrl7;
    
    // Fios para conectar as RAMs com o mux
    wire [15:0] resultado_ram0, resultado_ram1, resultado_ram2, resultado_ram3;
    wire [15:0] resultado_ram4, resultado_ram5, resultado_ram6, resultado_ram7;

    // Dmux
    gdmux8way dmux_controller(.in(enable_write), .sel(posicao_mem[8:6]),
                      .a(ctrl0), .b(ctrl1), .c(ctrl2), .d(ctrl3),
                      .e(ctrl4), .f(ctrl5), .g(ctrl6), .h(ctrl7));

    // RAMs_64
    minha_ram64 ram0(valor_entrada, posicao_mem[5:0], ctrl0, sinal_clock, resultado_ram0);
    minha_ram64 ram1(valor_entrada, posicao_mem[5:0], ctrl1, sinal_clock, resultado_ram1);
    minha_ram64 ram2(valor_entrada, posicao_mem[5:0], ctrl2, sinal_clock, resultado_ram2);
    minha_ram64 ram3(valor_entrada, posicao_mem[5:0], ctrl3, sinal_clock, resultado_ram3);
    minha_ram64 ram4(valor_entrada, posicao_mem[5:0], ctrl4, sinal_clock, resultado_ram4);
    minha_ram64 ram5(valor_entrada, posicao_mem[5:0], ctrl5, sinal_clock, resultado_ram5);
    minha_ram64 ram6(valor_entrada, posicao_mem[5:0], ctrl6, sinal_clock, resultado_ram6);
    minha_ram64 ram7(valor_entrada, posicao_mem[5:0], ctrl7, sinal_clock, resultado_ram7);

    // Mux
    gmux8way16 mux_seletor(.a(resultado_ram0), .b(resultado_ram1),
                    .c(resultado_ram2), .d(resultado_ram3),
                    .e(resultado_ram4), .f(resultado_ram5),
                    .g(resultado_ram6), .h(resultado_ram7),
                    .sel(posicao_mem[8:6]), .out(valor_saida));

endmodule
