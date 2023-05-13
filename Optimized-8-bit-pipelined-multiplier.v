module PipelinedMultiplier(
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [15:0] result
);

reg [7:0] a_reg;
reg [7:0] b_reg;
reg [3:0] stage;

wire [15:0] partial_product1;
wire [15:0] partial_product2;
wire [15:0] partial_product3;
wire [15:0] partial_product4;

assign partial_product1 = a_reg[0] ? b_reg : 0;
assign partial_product2 = a_reg[1] ? {b_reg[6:0], 1'b0} : 0;
assign partial_product3 = a_reg[2] ? {b_reg[5:0], 2'b00} : 0;
assign partial_product4 = a_reg[3] ? {b_reg[4:0], 3'b000} : 0;

always @(posedge clk)
begin
    if (reset)
    begin
        a_reg <= 8'b0;
        b_reg <= 8'b0;
        stage <= 0;
        result <= 16'b0;
    end
    else
    begin
        case (stage)
            0: begin
                a_reg <= a;
                b_reg <= b;
                stage <= 1;
            end
            1: begin
                result <= partial_product1;
                stage <= 2;
            end
            2: begin
                result <= result + partial_product2;
                stage <= 3;
            end
            3: begin
                result <= result + partial_product3;
                stage <= 4;
            end
            4: begin
                result <= result + partial_product4;
                stage <= 0;
            end
        endcase
    end
end

endmodule
