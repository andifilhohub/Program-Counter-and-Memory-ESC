`include "../gram8/gram8.v"
`include "../other_gates/gdmux8way/gdmux8way.v"
`include "../other_gates/gmux8way16/gmux8way16.v"

module minha_ram64(
    input [15:0] dados_entrada,
    input [5:0] endereco_acesso,
    input controle_write,
    input clock_principal,
    output [15:0] dados_saida
);
    
    // Fios para conectar o dmux com os loads das RAMs
    wire hab0, hab1, hab2, hab3, hab4, hab5, hab6, hab7;
    
    // Fios para conectar as RAMs com o mux
    wire [15:0] saida_ram0, saida_ram1, saida_ram2, saida_ram3;
    wire [15:0] saida_ram4, saida_ram5, saida_ram6, saida_ram7;

    // Dmux
    gdmux8way dmux_ctrl(.in(controle_write), .sel(endereco_acesso[5:3]),
                      .a(hab0), .b(hab1), .c(hab2), .d(hab3),
                      .e(hab4), .f(hab5), .g(hab6), .h(hab7));

    // RAMs_8
    minha_ram8 ram0(dados_entrada, endereco_acesso[2:0], hab0, clock_principal, saida_ram0);
    minha_ram8 ram1(dados_entrada, endereco_acesso[2:0], hab1, clock_principal, saida_ram1);
    minha_ram8 ram2(dados_entrada, endereco_acesso[2:0], hab2, clock_principal, saida_ram2);
    minha_ram8 ram3(dados_entrada, endereco_acesso[2:0], hab3, clock_principal, saida_ram3);
    minha_ram8 ram4(dados_entrada, endereco_acesso[2:0], hab4, clock_principal, saida_ram4);
    minha_ram8 ram5(dados_entrada, endereco_acesso[2:0], hab5, clock_principal, saida_ram5);
    minha_ram8 ram6(dados_entrada, endereco_acesso[2:0], hab6, clock_principal, saida_ram6);
    minha_ram8 ram7(dados_entrada, endereco_acesso[2:0], hab7, clock_principal, saida_ram7);

    // Mux
    gmux8way16 mux_saida(.a(saida_ram0), .b(saida_ram1),
                    .c(saida_ram2), .d(saida_ram3),
                    .e(saida_ram4), .f(saida_ram5),
                    .g(saida_ram6), .h(saida_ram7),
                    .sel(endereco_acesso[5:3]), .out(dados_saida));

endmodule
