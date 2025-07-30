`include "gram64.v"

module tb_gram64;
    // clock
    reg clk;
    
    // load
    reg load;
    
    // sinais
    reg [15:0] w;
    reg [5:0] address;
    wire [15:0] out_w;

    // unit under test
    gram64 uut (
    .w(w),
    .address(address),
    .load(load),
    .clk(clk),
    .out_w(out_w));

initial begin
    $display("gram64 Testbench");
    $dumpfile("signals.vcd");
    $dumpvars(0, tb_gram64);

    // Inicialização
    clk = 0;
    load = 0;
    w = 16'b0000000000000000;
    address = 6'b000000;

    // Teste escrevendo em diferentes endereços
    #1 load = 1; w = 16'b1010101010101010; address = 6'b000000;
    #2 load = 1; w = 16'b0101010101010101; address = 6'b000001;
    #2 load = 1; w = 16'b1111000011110000; address = 6'b000010;
    #2 load = 1; w = 16'b0000111100001111; address = 6'b000011;
    #2 load = 1; w = 16'b1111111100000000; address = 6'b000100;
    #2 load = 1; w = 16'b0000000011111111; address = 6'b000101;
    #2 load = 1; w = 16'b1010101001010101; address = 6'b000110;
    #2 load = 1; w = 16'b0101010110101010; address = 6'b000111;
    #2 load = 1; w = 16'b1100110011001100; address = 6'b001000; 
    #2 load = 1; w = 16'b0011001100110011; address = 6'b010000; 
    #2 load = 1; w = 16'b1010010110100101; address = 6'b100000; 
    #2 load = 1; w = 16'b0101101001011010; address = 6'b111111; 

    // Teste de leitura dos registradores
    #2 load = 0; address = 6'b000000;
    #2 address = 6'b000001; 
    #2 address = 6'b000010; 
    #2 address = 6'b000011; 
    #2 address = 6'b000100; 
    #2 address = 6'b000101; 
    #2 address = 6'b000110; 
    #2 address = 6'b000111; 
    #2 address = 6'b001000; 
    #2 address = 6'b010000; 
    #2 address = 6'b100000; 
    #2 address = 6'b111111; 

    // Teste de atualização com load=0 
    #2 load = 0; w = 16'b1111111111111111; address = 6'b000000; // Não deve alterar o registrador
    #2 address = 6'b000000; // Verifica se o valor não foi alterado

    // Teste de atualização com load=1
    #2 load = 1; w = 16'b1111111111111111; address = 6'b000000; // Deve alterar o registrador
    #2 load = 0; address = 6'b000000; // Verifica se o valor foi alterado

    #5 $finish;
end

initial begin
    $monitor("Time: %0t | Load: %b | Address: %6b | W: %b | Out: %b", $time, load, address, w, out_w);
end

always
    #1 clk = ~clk;

endmodule