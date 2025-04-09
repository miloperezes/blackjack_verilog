# Blackjack Game Verilog Module

This repository contains a Verilog implementation of a simple **Blackjack Game Logic System**. It is designed for use in digital design simulations and can be extended to hardware testing for embedded or FPGA-based projects.

## 🧠 Overview

The `blackjack_game` module simulates basic Blackjack card handling for a dealer and a player. It supports:
- Game state reset
- Card dealing on clock edge
- Game result signaling via flags

## 📁 File Contents

- `blackjack_game.v` – Main Verilog module implementing the game logic.
- `README.md` – This file.

## 🔍 Module Description

```verilog
module blackjack_game(
    input  clk,
    input  reset,
    input  [3:0] dealer_card,
    input  [3:0] player_card,
    output reg [1:0] game_result,
    output reg [5:0] dealer_hand,
    output reg [5:0] player_hand,
    output reg [5:0] flag
);
```

### Ports

| Name         | Direction | Size  | Description                     |
|--------------|-----------|-------|---------------------------------|
| `clk`        | Input     | 1 bit | Clock signal                    |
| `reset`      | Input     | 1 bit | Reset trigger                   |
| `dealer_card`| Input     | 4 bit | Value of card drawn for dealer |
| `player_card`| Input     | 4 bit | Value of card drawn for player |
| `game_result`| Output    | 2 bit | Encoded result of the game     |
| `dealer_hand`| Output    | 6 bit | Dealer's hand total            |
| `player_hand`| Output    | 6 bit | Player's hand total            |
| `flag`       | Output    | 6 bit | Internal state control flag    |

## 🕹️ Game States via `flag`

- `6'b000001`: Game in progress, deal cards
- `6'b000011`: Game over state
- `6'b111111`: Initial uninitialized flag state (used internally)

## ⚙️ How It Works

1. On reset (`posedge reset`), hands and flags are initialized.
2. On each clock cycle:
   - Cards are dealt until totals hit thresholds (e.g. player: 20, dealer: 17).
   - Game transitions to a result state when hands are ≥ 21.
3. Game logic uses `force` statements for simulation-specific overwriting.

## 🧪 Simulation Tips

- Use a testbench to simulate card inputs and observe transitions.
- `force` statements are simulation-only and may not synthesize well on FPGA tools.
- This module is intended for *educational and simulation use*.

## 📌 Notes

- This is a minimal logic model and doesn't include complex Blackjack rules (e.g. Ace handling, multiple rounds, user input).
- Can be expanded into a full state machine or interfaced with a GUI for visualization.
