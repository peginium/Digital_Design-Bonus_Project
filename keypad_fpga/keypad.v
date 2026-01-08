module keypad( 
input clk,
input reset,
output reg [3:0] row,
input [3:0] col,          
output reg [6:0] seg7   
); 

    reg [1:0] scan_state;
    reg [19:0] scan_counter;
    reg [3:0] key_value;
    reg [3:0] last_key_value;
    reg key_pressed;
    reg [6:0] seg_map [0:15]; 
    
    initial begin 
    seg_map[0]  = 7'b1000000; // 0 
    seg_map[1]  = 7'b1111001; // 1 
    seg_map[2]  = 7'b0100100; // 2 
    seg_map[3]  = 7'b0110000; // 3 
    seg_map[4]  = 7'b0011001; // 4 
    seg_map[5]  = 7'b0010010; // 5 
    seg_map[6]  = 7'b0000010; // 6 
    seg_map[7]  = 7'b1111000; // 7 
    seg_map[8]  = 7'b0000000; // 8 
    seg_map[9]  = 7'b0010000; // 9 
    seg_map[10] = 7'b0001000; // A 
    seg_map[11] = 7'b0000011; // B 
    seg_map[12] = 7'b1000110; // C 
    seg_map[13] = 7'b0100001; // D 
    seg_map[14] = 7'b0000110; // E 
    seg_map[15] = 7'b0001110; // F 
    end 
    
    always @(posedge clk or posedge reset) begin 
        if (reset) begin 
            row <= 4'b1110;
            scan_state <= 2'b00;
            scan_counter <= 20'd0;
            key_value <= 4'd0; 
            last_key_value <= 4'd0;
            key_pressed <= 1'b0; 
            seg7 <= 7'b1111111; 
        end else begin  
            scan_counter <= scan_counter + 1; 
            if (scan_counter == 20'd999_999) begin // Yakla  k 1 ms gecikme 
                scan_counter <= 0; 
                case (scan_state) 
                    2'b00: row <= 4'b1110; 
                    2'b01: row <= 4'b1101; 
                    2'b10: row <= 4'b1011;
                    2'b11: row <= 4'b0111; 
                endcase 
                scan_state <= scan_state + 1; 
                if (col != 4'b1111) begin 
                    key_pressed <= 1'b1;
                    case ({row, col}) 
                        8'b1110_1110: key_value <= 4'd1; // 1
                        8'b1110_1101: key_value <= 4'd2; // 2
                        8'b1110_1011: key_value <= 4'd3; // 3
                        8'b1110_0111: key_value <= 4'd4; // 4
                        8'b1101_1110: key_value <= 4'd5; // 5
                        8'b1101_1101: key_value <= 4'd6; // 6
                        8'b1101_1011: key_value <= 4'd7; // 7
                        8'b1101_0111: key_value <= 4'd8; // 8
                        8'b1011_1110: key_value <= 4'd9; // 9
                        8'b1011_1101: key_value <= 4'd10; // A 
                        8'b1011_1011: key_value <= 4'd11; // B 
                        8'b1011_0111: key_value <= 4'd12; // C 
                        8'b0111_1110: key_value <= 4'd13; // D 
                        8'b0111_1101: key_value <= 4'd14; // E 
                        8'b0111_1011: key_value <= 4'd15; // F 
                        8'b0111_0111: key_value <= 4'd0; // 0 
                        default: key_value <= last_key_value;
                    endcase 
                end else begin 
                    key_pressed <= 1'b0; // Tu a bas lmad  
                end 
            end 
            if (key_pressed) begin 
                last_key_value <= key_value;
                seg7 <= seg_map[key_value]; 
            end else begin 
                seg7 <= seg_map[last_key_value];
            end 
        end 
    end 
endmodule