module Blackjack_tb;

    reg clk; 
    reg reset; 
    reg [3:0] dealer_card;
    reg [3:0] player_card;
    wire [5:0] player_hand;
    wire [5:0] dealer_hand;
    integer i; // Loop counter
    
    blackjack_game dut(
        .clk(clk),
        .reset(reset),
        .dealer_card(dealer_card),
        .player_card(player_card),
        .player_hand(player_hand),
        .dealer_hand(dealer_hand)
    );
    
    always #5 clk = ~clk;
    
    initial begin 
    
        #10;
        reset = 1;
        clk = 1;
        
        // Initialize player's cards
        for (i = 0; i < 2; i = i + 1) begin
            #1;
            player_card = $urandom_range(1,11);
        end
        
        // Initialize dealer's cards
        for (i = 0; i < 2; i = i + 1) begin
            #1;
            dealer_card = $urandom_range(1,11);
        end
        $display("Initial Player Card: %d | Initial Dealer Card: %d", player_card, dealer_card); 
        
        // Example of player and dealer hitting
        for (i = 0; i < 2; i = i + 1) begin
            #1; // Wait for a clock cycle
            
            // Player hits and receives card
            #1;
            player_card = $urandom_range(1,11);
            $display("Player hits and receives card: %d", player_card);
            
            // Update player hand after hit
            #1;
            $display("Player Score after hit: %d | Dealer Score after hit: %d", player_hand, dealer_hand);
            
            // Dealer hits and receives card
            #1;
            dealer_card = $urandom_range(1,11);
            $display("Dealer hits and receives card: %d", dealer_card);
            
            // Update dealer hand after hit
            #1;
            $display("Player Score after hit: %d | Dealer Score after hit: %d", player_hand, dealer_hand);
        end
        
        // Display final scores
        #1;
        $display("Final Player Score: %d | Final Dealer Score: %d", player_hand, dealer_hand);
        
        if (player_hand > dealer_hand && player_hand < 22 || player_hand < 22 && dealer_hand > 21) begin
            $display("Player Wins!");
        end else if (dealer_hand > player_hand && dealer_hand < 22 || player_hand > 21 && dealer_hand < 22) begin
            $display("Dealer Wins!");
        end else if (dealer_hand > 21 && player_hand > 21) begin
            $display ("Both Busted Tie!");
            // Tie or no winner 
        end else begin
            $display ("Tie!");  
        end 

        // End simulation
        #1;
        $finish;
   end
    
endmodule

