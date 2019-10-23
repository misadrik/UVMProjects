module crc7(
    input clk,
    input rst_n,
    input data,
    output reg[6:0] crc,
    );
reg g0;

assign g0 = data^crc[6];

always@(posedge clk or negedge rst_n)
    if(~rst_n)begin
        crc<= 7'b0;
    end
    else
        crc[6]  <=  crc[5];
        crc[5]  <=  crc[4];
        crc[4]  <=  crc[3];
        crc[3]  <=  crc[2]^g0;
        crc[2]  <=  crc[1];
        crc[1]  <=  crc[0];
        crc[0]  <=  g0;

endmodule : crc7