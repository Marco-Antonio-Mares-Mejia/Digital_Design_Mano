//Descripcion de los niveles de compuertas del circuito de la figura 4.2

module Circuito_fig_4_2 (A, B, C, F1, F2);

    input A, B, C;
    output F1, F2;
    wire T1, T2, T3, F3_b, E1, E2, E3;
    or g1 (T1, A,B,C);
    and g2 (T2, A, B, C);
    and g3 (E1, A, B);
    and g4 (E2, A, C);
    and g5 (E3, B, C);
    or g6 (F2, E1, E2, E3);
    not g7 (F2_b, F2);
    and g8 (T3, T1, F2_b);
    or g9 (F1, T2, T3);

endmodule

//Estimulo para analizar el circuito

module circuito_de_prueba;

    reg [2:0] D;
    wire F1, F2;

    Circuito_fig_4_2 M1 (D[2], D[1], D[0], F1, F2);

    initial begin
        D = 3'b000;
        repeat (7) #10 D = D + 3'b001;
    end

    initial $monitor ("ABC = %b F1 = %b F2 = %b", D, F1, F2);

endmodule