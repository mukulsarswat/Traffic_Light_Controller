module traffic_light_controller (
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

    typedef enum reg [1:0] {
        RED_STATE    = 2'b00,
        GREEN_STATE  = 2'b01,
        YELLOW_STATE = 2'b10
    } state_t;

    state_t current_state, next_state;
    reg [3:0] timer;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED_STATE;
            timer <= 0;
        end else begin
            if ((current_state == RED_STATE && timer == 4) ||
                (current_state == GREEN_STATE && timer == 4) ||
                (current_state == YELLOW_STATE && timer == 1)) begin
                current_state <= next_state;
                timer <= 0;
            end else begin
                timer <= timer + 1;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            RED_STATE:    next_state = GREEN_STATE;
            GREEN_STATE:  next_state = YELLOW_STATE;
            YELLOW_STATE: next_state = RED_STATE;
            default:      next_state = RED_STATE;
        endcase
    end

    // Output logic
    always @(*) begin
        red    = (current_state == RED_STATE);
        green  = (current_state == GREEN_STATE);
        yellow = (current_state == YELLOW_STATE);
    end

endmodule
