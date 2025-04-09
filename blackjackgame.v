`timescale 1ns / 1ps

module blackjack_game(
    input  clk,                // Clock input
    input  reset,              // Reset input
    input  [3:0] dealer_card,  // Dealer's current card
    input  [3:0] player_card,  // Player's current card
    output reg [1:0] game_result,  // Result of the game
    output reg [5:0] dealer_hand,         // Dealer's hand
    output reg [5:0] player_hand,         // Player's hand
    output reg [5:0] flag
);
wire w1, w2;
not N1(w1, 6'b111111);


initial flag = w1;
assign w2 = (flag==w1);

    // Game logic
always @(posedge reset) begin
    if (w2) begin
                    // Reset game state
        dealer_hand <= w1;
        player_hand <= w1;
        force flag = 6'b000001;
    end
    else begin
        force flag = 6'b000001;
    end
end
    
always @(posedge clk) begin 
   if (flag == 6'b000001) begin
           // Deal a card to player or dealer based on inputs
        if (player_hand < 6'b010100) begin
                  force player_hand = player_hand + player_card;
                  force flag = 6'b000001; 
              //    $display ("Player Hits");
        end
        else if (player_hand > 21) begin
            force flag = 6'b000011;
        end
       if (dealer_hand < 6'b010001) begin
                  force dealer_hand = dealer_hand + dealer_card;
                  force flag = 6'b000001; 
        end
        else if (dealer_hand >= 21) begin
            force flag = 6'b000011;
        end    
  end
end

endmodule
