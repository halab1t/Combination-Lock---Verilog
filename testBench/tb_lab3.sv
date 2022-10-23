module tb_lab3();

    reg sim_clk, sim_rst_n;
    reg [9:0] sim_SW;
    reg [9:0] sim_LEDR;
    reg [6:0] sim_HEX5, sim_HEX4, sim_HEX3, sim_HEX2, sim_HEX1, sim_HEX0;

    lab3 DUT (.SW(sim_SW), .KEY({sim_rst_n, 0, 0, sim_clk}), .HEX5(sim_HEX5),
             .HEX4(sim_HEX4), .HEX3(sim_HEX3), .HEX2(sim_HEX2),
             .HEX1(sim_HEX1), .HEX0(sim_HEX0));
    
    initial begin 
        sim_rst_n = 1'd0;
        #5;
        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;
        #5;
        sim_rst_n = 1'd1;
        #5;

//Case that every input is correct, expect that lock is open
        sim_SW = 10'd9;
        #15;
        assert(sim_HEX0 === 7'b0011000 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");
        
        sim_SW = 10'd6;
        #15;
        assert(sim_HEX0 === 7'b0000010 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");
        
        sim_clk = 1'd0;
        #5
        sim_clk = 1'd1;
        #15;

        assert(sim_HEX0 === 7'b0000010 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected after clock press");
        else $error("ERROR: 7-segments not functioning as expected after clock press");


        sim_SW = 10'd3;
        #15;
        assert(sim_HEX0 === 7'b0110000 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;

        sim_SW = 10'd2;
        #15;
        assert(sim_HEX0 === 7'b0100100 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;

        sim_SW = 10'd9;
        #15;
        assert(sim_HEX0 === 7'b0011000 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;

        sim_SW = 10'd1;
        #15;
        assert(sim_HEX0 === 7'b1111001 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;

        sim_SW = 10'd4;
        #15;
        assert(sim_HEX0 === 7'b0011001 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;
        #15;
        assert(sim_HEX0 === 7'b1001000 && sim_HEX1 === 7'b0000110 && sim_HEX2 === 7'b0001100 && sim_HEX3 === 7'b1000000 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("Lock opening as expected");
        else $error("ERROR: Lock not opening as expected");

//Case that you input the first digit incorrectly, expect that lock is closed

        
//Missing an error check, finish the closed assertion, copy and paste cycling 8 through each thing to make the condition fail at east digit
        

    end



endmodule: tb_lab3
