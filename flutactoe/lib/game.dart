// Backend for a Tic Tac Toe application :
import 'dart:io';

/* 
  Things to cover
  -The grid of tiles
  -Winning combos
  -The state of each tiles
  -The state of the game (winning, losing, draw)
  -Player's turn

*/

enum TileState {
  empty,
  cross,
  rounds,
}

final grid = List<TileState>.filled(9, TileState.empty, growable: false);


// DEBUG ONLY, THERE SHOULD NOT BE ANY MAIN FUNCTION IN THIS FILE
void main() {
  print(grid);
}