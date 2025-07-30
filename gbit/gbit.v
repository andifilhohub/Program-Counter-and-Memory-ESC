module gbit(input dado, input habilita, input relogio, output reg resultado);

    initial resultado <= 0;

    always @ (posedge relogio) begin
        if(habilita == 1) resultado <= dado;
    end
    
endmodule