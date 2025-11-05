`timescale 1ns / 1ps

module to_upper ( 
    // inputs are 8 bits of each ascii character
    input wire a0, a1, a2, a3, a4, a5, a6, a7,
    output wire a0_out, a1_out, a2_out, a3_out, a4_out, a5_out, a6_out, a7_out
  );

    wire f1, f2, f3; // output the results of each function
    wire is_lowercase; // returns 1 if F passes through

    // Defining function 1: a4'(a0 + a1 + a2 + a3)
    // define wires
    wire f1_w_a4_not; // inverter wires
    wire f1_w_or_gate_1, f1_w_or_gate_2, f1_w_or_gate_3; // output of first or gate
    wire f1_w_and_gate_1; // output of first and gate

    // define inverter gates
    not #(5) G_f1_not4(f1_w_a4_not, a4);

    // define or/and gates
    or #(10) G_f1_or1(f1_w_or_gate_1, a0, a1);
    or #(10) G_f1_or2(f1_w_or_gate_2, f1_w_or_gate_1, a2);
    or #(10) G_f1_or3(f1_w_or_gate_3, f1_w_or_gate_3, a3);
    and #(10) G_f1_and(f1, f1_w_a4_not, f1_w_or_gate_3); // output function 1


    // Defining function 2: a4(a3' + a3a2'(a1' + a0'))
    // define wires
    wire f2_w_a0_not, f2_w_a1_not, f2_w_a2_not, f2_w_a3_not;
    wire f2_w_or_gate_2, f2_w_or_gate_3;
    wire f2_w_and_gate_2, f2_w_and_gate_3;
    wire f2_logic_result;

    // define inverter gates
    not #(5) G_f2_not0(f2_w_a0_not, a0);
    not #(5) G_f2_not1(f2_w_a1_not, a1);
    not #(5) G_f2_not2(f2_w_a2_not, a2);
    not #(5) G_f2_not3(f2_w_a3_not, a3);

    // define or/and gates
    or #(10) G_f2_or2(f2_w_or_gate_2, f2_w_a1_not, f2_w_a0_not);
    and #(10) G_f2_and1(f2_w_and_gate_2, f2_w_a2_not, f2_w_or_gate_2);
    and #(10) G_f2_and2(f2_w_and_gate_3, f2_w_and_gate_2, a3);
    or #(10) G_f2_or3(f2_logic_result, f2_w_a3_not, f2_w_and_gate_3);
    and #(10) G_f2_and(f2, a4, f2_logic_result);

    // Defining function 3: a7'a6a5
    // define wires
    wire w_a7_not, w_f3_and;

    // define inverter
    not #(5) G_f3_not7(w_a7_not, a7);   
    // define and gate
    and #(10) G_f3_and1(w_f3_and, a5, a6);
    and #(10) G_f3_and(f3, w_a7_not, w_f3_and);  

    wire f1_or_f2;
    or #(10) G_f2_f1_or(f1_or_f2, f1, f2);

    // connecting F = f1f2f2
    and #(10) G_F_and(is_lowercase, f1_or_f2, f3);

    // Generate output:
    // assign outputs, which are the same for everything besides a5
    assign a0_out = a0;
    assign a1_out = a1;
    assign a2_out = a2;
    assign a3_out = a3;
    assign a4_out = a4;
    assign a6_out = a6;
    assign a7_out = a7;

    wire is_lowercase_not;

    not #(5) G_condition_not(is_lowercase_not, is_lowercase);
    and #(10) G_bit5_logic(a5_out, a5, is_lowercase_not);

endmodule
