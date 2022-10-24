module lab3(input [9:0] SW, input [3:0] KEY,
            output reg [6:0] HEX0, output reg [6:0] HEX1, output reg [6:0] HEX2,
            output reg [6:0] HEX3, output reg [6:0] HEX4, output reg [6:0] HEX5,
            output [9:0] LEDR);
    wire clk = ~KEY[0]; // this is your clock
    wire rst_n = KEY[3]; // this is your reset; your reset should be synchronous and active-low

    
    reg [3:0] state;

    always_ff @(posedge clk) 
    begin
        if(~rst_n) begin
            state <= 4'd0;
        end else begin
            case(state)
                4'd0: if(SW === 10'd6)begin
                    state <= 4'd1;  
                end else begin
                    state <= 4'd2;
                end
                4'd1: if(SW === 10'd3)begin
                    state <= 4'd3;  
                end else begin
                    state <= 4'd4;
                end
                4'd2: state <= 4'd4;
                4'd3: if(SW === 10'd2)begin
                    state <= 4'd5;  
                end else begin
                    state <= 4'd6;
                end
                4'd4: state <= 4'd6;
                4'd5: if(SW === 10'd9)begin
                    state <= 4'd7;  
                end else begin
                    state <= 4'd8;
                end
                4'd6: state <= 4'd8;
                4'd7: if(SW === 10'd1)begin
                    state <= 4'd9;  
                end else begin
                    state <= 4'd10;
                end
                4'd8: state <= 4'd10;
                4'd9: if(SW === 10'd4)begin
                    state <= 4'd11;  
                end else begin
                    state <= 4'd12;
                end
                4'd10: state <= 4'd12;
                4'd11: state <= 4'd11;
                4'd12: state <= 4'd12;
                default: state <= 4'd0;
            endcase 
        end
        

    end

    always_comb begin 
        if(state === 4'd11)begin
            HEX0 = 7'b1001000;
            HEX1 = 7'b0000110;
            HEX2 = 7'b0001100;
            HEX3 = 7'b1000000;
            HEX4 = 7'b1111111;
            HEX5 = 7'b1111111;
        end else if(state === 4'd12)begin
            HEX0 = 7'b0100001;
            HEX1 = 7'b0000110;
            HEX2 = 7'b0010010;
            HEX3 = 7'b1000000;
            HEX4 = 7'b1000111;
            HEX5 = 7'b1000110;
        end else begin
            case(SW)
                10'd0: begin
                    HEX0 = 7'b1000000;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd1: begin
                    HEX0 = 7'b1111001;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd2: begin
                    HEX0 = 7'b0100100;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd3: begin
                    HEX0 = 7'b0110000;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd4: begin
                    HEX0 = 7'b0011001;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd5: begin
                    HEX0 = 7'b0010010;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd6: begin
                    HEX0 = 7'b0000010;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd7: begin
                    HEX0 = 7'b1111000;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd8: begin
                    HEX0 = 7'b0000000;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                10'd9: begin
                    HEX0 = 7'b0011000;
                    HEX1 = 7'b1111111;
                    HEX2 = 7'b1111111;
                    HEX3 = 7'b1111111;
                    HEX4 = 7'b1111111;
                    HEX5 = 7'b1111111;
                end
                default: begin
                    HEX0 = 7'b0101111;
                    HEX1 = 7'b0100011;
                    HEX2 = 7'b0101111;
                    HEX3 = 7'b0101111;
                    HEX4 = 7'b0000110;
                    HEX5 = 7'b1111111;
                end

            endcase
        end
    end


endmodule: lab3
