`timescale 1 ps / 1 ps

module tb_lab3_gate();

    reg sim_clk, sim_rst_n;
    reg [9:0] sim_SW;
    reg [9:0] sim_LEDR;
    reg [6:0] sim_HEX5, sim_HEX4, sim_HEX3, sim_HEX2, sim_HEX1, sim_HEX0;

    lab3 DUT (.SW(sim_SW), .KEY({sim_rst_n, 1'b0, 1'b0, sim_clk}), .HEX5(sim_HEX5),
             .HEX4(sim_HEX4), .HEX3(sim_HEX3), .HEX2(sim_HEX2),
             .HEX1(sim_HEX1), .HEX0(sim_HEX0));
    
    integer failDigit, index;
    const integer passcodeLength = 6;
    reg [9:0]passcode[5:0] = {10'd6, 10'd3, 10'd2, 10'd9, 10'd1, 10'd4};

    task reset();
        begin
            sim_rst_n = 1'd0;
            #5;
            sim_clk = 1'd0;
            #5;
            sim_clk = 1'd1;
            #5;
            sim_rst_n = 1'd1;
            #5;
        end
    endtask

    task pressClk();
        begin
            sim_clk = 1'd0;
            #5;
            sim_clk = 1'd1;
            #15;
        end
    endtask


    initial begin 

        // reset();
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

//testing that we display error when we input a number > 9
        sim_SW = 10'd12;
        #15;
        assert(sim_HEX0 === 7'b0101111 && sim_HEX1 === 7'b0100011 && sim_HEX2 === 7'b0101111 && sim_HEX3 === 7'b0101111 && sim_HEX4 === 7'b0000110 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected with a greater than 9 input");
        else $error("ERROR: 7-segments not functioning as expected with greater than 9 input");
        
        sim_SW = 10'd6;
        #15;
        assert(sim_HEX0 === 7'b0000010 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");
        
        // pressClk();
        sim_clk = 1'd0;
        #5;
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
        #15;

        sim_SW = 10'd2;
        #15;
        assert(sim_HEX0 === 7'b0100100 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;
        #15;

        sim_SW = 10'd9;
        #15;
        assert(sim_HEX0 === 7'b0011000 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;
        #15;

        sim_SW = 10'd1;
        #15;
        assert(sim_HEX0 === 7'b1111001 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
        $display("7-segments functioning as expected");
        else $error("ERROR: 7-segments not functioning as expected");

        sim_clk = 1'd0;
        #5;
        sim_clk = 1'd1;
        #15;
        
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
        
    for(failDigit = 0; failDigit < passcodeLength; failDigit = failDigit + 1) begin
        reset();

        for(index = 0; index < passcodeLength; index = index + 1) begin
            if(failDigit === index)begin
                sim_SW = 10'd8;
                #15;

                assert(sim_HEX0 === 7'b0000000 && sim_HEX1 === 7'b1111111 && sim_HEX2 === 7'b1111111 && sim_HEX3 === 7'b1111111 && sim_HEX4 === 7'b11111111 && sim_HEX5 === 7'b1111111)
                $display("7-segments functioning as expected");
                else $error("ERROR: 7-segments not functioning as expected");
                
                pressClk();

            end else begin
                sim_SW = passcode[index];
                #15;
                pressClk();
            end 



        end

        assert(sim_HEX0 === 7'b0100001 && sim_HEX1 === 7'b0000110 && sim_HEX2 === 7'b0010010 && sim_HEX3 === 7'b1000000 && sim_HEX4 === 7'b1000111 && sim_HEX5 === 7'b1000110)
        $display("Lock closed as expected");
        else $error("ERROR: Lock not closed as expected");
        pressClk();

    end
    end



endmodule: tb_lab3_gate
