`timescale 1ns/1ns
`include "alu.v"

module ALU_74LS181_TB;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds

    // Inputs
    reg [3:0] A, B, sel;
    reg mode, cin;
    
    // Outputs
    wire [3:0] F;
    wire cout, eqAB;

    // Instantiate the ALU_74LS181 module
    ALU_74LS181 uut (
        .A(A),
        .B(B),
        .sel(sel),
        .mode(mode),
        .cin(cin),
        .F(F),
        .cout(cout),
        .eqAB(eqAB)
    );

    // Testbench stimuli
    initial begin
        // Initialize inputs
        $monitor("Time=%t, A=%b, B=%b, sel=%b, mode=%b, cin=%b, F=%b, cout=%b, eqAB=%b", $time, A, B, sel, mode, cin, F, cout, eqAB);
        A = 4'b1010;
        B = 4'b1010;
        sel = 4'b0110;
        mode = 1'b0;
        cin = 1'b0;
        // Apply inputs and display outputs
        
        
        #9 cin = 1'b1;
        // Test all combinations of inputs
        /*repeat (16) begin
            // Change inputs
            sel=sel +1;
            #10; // Wait a few time units
        end
        cin = 1'b1;
        sel = 4'b1111; 
        repeat (16) begin
            // Change inputs
            sel=sel +1;
            #10; // Wait a few time units
        end*/
        // End simulation
        $finish;
    end

endmodule
