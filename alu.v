module ALU_74LS181 (A,B,sel,mode,F,cin,cout,eqAB);
    input [3:0]A,B,sel;
    input mode,cin;

    output reg [3:0]F;
    output reg cout,eqAB; //eqAB only works when mode = 0 , sel = 0110 and carry in is 0, ie subtract mode

    reg [4:0]sum;

    always @(*) begin
        case (mode)
            1'b0:begin
                    case (sel)
                        4'b0000: sum = A + ~cin;
                        4'b0001: sum = ( A | B ) + ~cin;
                        4'b0010: sum = ( A | ~B ) + ~cin;
                        4'b0011: sum = -5'b1 + {4'b0,~cin};
                        4'b0100: sum = A + ( A & ~B ) + ~cin;
                        4'b0101: sum = ( A | B ) + ( A & ~B ) + ~cin;
                        4'b0110: sum = A - B + ~cin;
                        4'b0111: sum = ( A & ~B ) - 5'b1 + ~cin;
                        4'b1000: sum = A + ( A & B ) + ~cin;
                        4'b1001: sum = A + B + ~cin;
                        4'b1010: sum = ( A | ~B ) + ( A & B ) + ~cin;
                        4'b1011: sum = ( A & B ) - 5'b1 + ~cin;
                        4'b1100: sum = A + A + ~cin;
                        4'b1101: sum = ( A | B ) + A + ~cin;
                        4'b1110: sum = ( A | ~B ) + A + ~cin;
                        4'b1111: sum = A - 5'b1 + ~cin;
                        default: sum = 5'b0;
                    endcase
                    cout = sum[4];
                    F = sum[3:0];
                end
    
            1'b1:begin
                    case (sel)
                        4'b0000: F = ~A;
                        4'b0001: F = ~( A | B );
                        4'b0010: F = ~A & B;
                        4'b0011: F = 4'b0;
                        4'b0100: F = ~( A & B );
                        4'b0101: F = ~B;
                        4'b0110: F = A ^ B;
                        4'b0111: F = A & ~B;
                        4'b1000: F = ~A | B;
                        4'b1001: F = A ~^ B;
                        4'b1010: F = B;
                        4'b1011: F = A & B;
                        4'b1100: F = 4'b1111;
                        4'b1101: F = A | ~B;
                        4'b1110: F = A | B;
                        4'b1111: F = A;
                        default:  F = 4'b0;
                    endcase
                end 
            default: F = 4'b0; 
        endcase
        eqAB = &F;
    end

endmodule