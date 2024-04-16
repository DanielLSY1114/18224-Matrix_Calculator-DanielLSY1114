`default_nettype none

module my_chip (
    input logic [11:0] io_in, // Inputs to your chip
    output logic [11:0] io_out, // Outputs from your chip
    input logic clock,
    input logic reset // Important: Reset is ACTIVE-HIGH
);
    // input
    logic [7:0] data_in;
    logic enter, sw;
    logic rst;
    logic [1:0] operation;

    // output
    logic [4:0] data_out;
    logic finish, error;
    logic [3:0] index;

    // input synchronization and assignment
    Synchronizer sync1(.async(io_in[7:0]), .clock(clock), .sync(data_in[7:0]));
    Synchronizer sync2(.async(io_in[8]), .clock(clock), .sync(enter));
    Synchronizer sync3(.async(io_in[9]), .clock(clock), .sync(sw));
    Synchronizer sync4(.async(io_in[11:10]), .clock(clock), .sync(operation[1:0]));
    Synchronizer sync5(.async(reset), .clock(clock), .sync(rst));

    // output assignment
    assign io_out[4:0] = data_out[4:0];
    assign io_out[5] = finish;
    assign io_out[6] = error;
    assign io_out[10:7] = index[3:0];

    
    Matrix_Calculator matrix_calculator(.data_in(data_in),
                                        .enter(enter),
                                        .sw(sw),
                                        .operation(operation), 
                                        .clk(clock), 
                                        .rst(rst), 
                                        .data_out(data_out), 
                                        .finish(finish), 
                                        .error(error), 
                                        .index(index));

endmodule
