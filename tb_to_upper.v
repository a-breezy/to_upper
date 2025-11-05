// testbank for to_upper function


`timescale 1ns / 1ps


module tb_to_upper;
// declare inputs and outputs
    reg [7:0] test_char;
    wire [7:0] result_char;

    // Initialize device under test
    to_upper dut (
        // Connect output ports of the DUT to bits of the 'result_char' wire
        .a0_out(result_char[0]), .a1_out(result_char[1]), .a2_out(result_char[2]), .a3_out(result_char[3]),
        .a4_out(result_char[4]), .a5_out(result_char[5]), .a6_out(result_char[6]), .a7_out(result_char[7]),

        
        // Connect input ports of the DUT to bits of the 'test_char' reg
        .a0(test_char[0]), .a1(test_char[1]), .a2(test_char[2]), .a3(test_char[3]),
        .a4(test_char[4]), .a5(test_char[5]), .a6(test_char[6]), .a7(test_char[7])
    );

    initial begin
        $dumpfile("to_upper_waveform.vcd");
        $dumpvars(0, tb_to_upper);


        $display("Starting to_upper testbench...");

        // Test 1 ( dec 40
        test_char = 8'd40;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 2 H dec 72
        test_char = 8'd72;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 3 . dec 183
        test_char = 8'd183;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 4 ƒ dec 131
        test_char = 8'd131;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 5 | dec 124
        test_char = 8'd124;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 6 DC4 dec 20
        test_char = 8'd20;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 7 ë dec 235
        test_char = 8'd235;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 8 a dec 97
        test_char = 8'd97;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 9 A dec 65
        test_char = 8'd65;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 10 z dec 122
        test_char = 8'd122;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 11 G dec 71
        test_char = 8'd71;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 12 m dec 109
        test_char = 8'd109;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 13 ' dec 146
        test_char = 8'd146;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 14 ) dec 48
        test_char = 8'd48;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 15 Ï dec 207
        test_char = 8'd207;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 16 : dec 58
        test_char = 8'd58;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 17 { dec 123
        test_char = 8'd123;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 18 " dec 148
        test_char = 8'd148;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        // Test 19 DEL dec 127
        test_char = 8'd127;
        #20;
        $display("Input: %s (%d), Output: %s (%d)", test_char, test_char, result_char, result_char);

        $display("Test finished.");
        $finish;
end

endmodule;
