module meu_dff(input dado_in, input relogio, input reset, output reg saida_q);
  
    initial saida_q <= 0;

    always @ (posedge relogio or posedge reset) begin
        if(reset == 1) begin
            saida_q <= 0;
        end else begin
            saida_q <= dado_in;
        end
    end

endmodule

