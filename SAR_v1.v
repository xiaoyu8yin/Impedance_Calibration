module sar (
    input clk,
    input comp,
    output reg [5:0] dout = 6'b000000
);

reg [2:0] bit_counter = 3'd5; // 控制当前处理位（5~0）

always @(negedge clk) begin
    if (bit_counter < 3'd6) begin // 处理所有6个有效位
        // 根据比较结果设置当前位
        dout[bit_counter] <= comp ? 1'b1 : 1'b0;
        
        // 移动到下一个低位
        bit_counter <= bit_counter - 1'b1;
    end
end

endmodule