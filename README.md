# blackjack_verilog
The Blackjack game implemented in HDL was identical to the traditional card game played by players and dealers. The game had several phases: dealing of cards, player decision-making (hit or stand), dealer activities, and a winner determined by the sum of the card values.
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
