// Backend for a Tic Tac Toe application :
import 'dart:math'; // Random().nextBool()
import 'dart:io';

/* 
  Things to cover
  -The grid of tiles (done)
  -Winning combos (done)
  -The state of each tiles (done)
  -Player's turn (TODO)
*/

// State of a single Tile
enum TileState {
  empty,
  cross,
  rounds,
}

// Out of 19 683 different ways a 3x3 grid can be, there are only 8 ways to win the game, which is computable for a human like me.


List<List<int>> winningComboList = [
  // Horizontal Winning combos
  [0,1,2],
  [3,4,5],
  [6,7,8],

  // Vertical winning combos
  [0,3,6],
  [1,4,7],
  [2,5,8],

  // Diagonal winning combos
  [0,4,8],
  [2,4,6],
];

// Class that manage a game
class Game { 
  // Grid of tiles
  List<TileState> grid = List.filled(9, TileState.empty);
  List<int> crossPlays = []; // All the moves of the cross are stocked here
  List<int> roundPlays = []; // All the moves of the round are stocked here
  late bool crossTurn; // current turn : true : cross turn, false : round turn. 

  Game();

  bool playerStart() { // Uses randomization to know which player start
    return crossTurn = Random().nextBool();
  }

  bool isMovePossible(int index) { // Evaluates if the player can place a cross/round at index.
    return grid[index] == TileState.empty; // If true, he can place, else, he cannot because its already occupied
  }

  bool isGridComplete() { // Returns false if the grid is not complete and true if so
    for (int i = 0; i < grid.length; i++) {
      if (grid[i] == TileState.empty) return false;
    }
    return true;
  }

  bool _checkCombo(List<int> winningCombo, List<int> player) { // Compare the winning combo wanted to the list
    // This function should only be used by checkWinning, this is why it's a private function. Try avoid using it (you can't anyways..). 
    for (int i = 0; i < winningCombo.length; i++) {
      /*
      We will loop through the winningCombo list.
      We will try to find if the current number in the winningCombo list is in the player list.
      If its not the case, then the player hasn't made that combo yet.
      */
      if (player.contains(winningCombo[i]) == false) {
        return false;
      }
    }
    return true;
  }

  bool checkWinning(List<List<int>> winningCombos,List<int> player) {
    if (player.length < 3) { // If Cross player has done more than 3 moves, we can check if he wins or not.
      return false;
    }
    else {
      for (int i = 0; i < winningCombos.length; i++) {
        if (_checkCombo(winningCombos[i], player) == true) {
          return true;
        }
      }
    }
    return false;
  }

  String displayGrid() { // Returns a string representing a Tic Tac Toe grid.
    List<String> symbols = List.filled(9, ''); 
    for (int i = 0; i < grid.length; i++) {
      switch (grid[i]) {
        case TileState.cross:
          symbols[i] = 'X';
          break;
        case TileState.rounds:
          symbols[i] = 'O';
          break;
        case TileState.empty:
          symbols[i] = '-';
          break;
      }
    }
    return '${symbols[0]} | ${symbols[1]} | ${symbols[2]}\n${symbols[3]} | ${symbols[4]} | ${symbols[5]}\n${symbols[6]} | ${symbols[7]} | ${symbols[8]}';
  }

  void playCLI() { // Starts a game of Tic Tac Toe in the console with random choice of who start
    playerStart();
    bool isFinished = false;
    late String display;
    
    while (!isFinished) {
      display = displayGrid();
      print(display);
      print('Enter a position');
      
      int? userInput = int.parse(stdin.readLineSync()!);
      isFinished = isGridComplete();

      if (isFinished) { // The grid is complete
        break;
      }
      else { // The grid isn't complete
          if (isMovePossible(userInput-1)) {
            print('Move possible');
            if (crossTurn) {
              grid[userInput-1] = TileState.cross;
              crossPlays.add(userInput-1);
              print('Cross list : $crossPlays');
              if (checkWinning(winningComboList, crossPlays)) {
                print('Cross wins!');
                break;
              }
              crossTurn = false;
              }
            else {
              grid[userInput-1] = TileState.rounds;
              roundPlays.add(userInput-1);
              print('Round list : $roundPlays');
              if (checkWinning(winningComboList, roundPlays)) {
                print('Round wins!');
                break;
              }
              crossTurn = true;              
              }
              
              isFinished = isGridComplete();
              if (isFinished) {
                print("That's a draw (grid full)");
                display = displayGrid();
                print(display);
                break;
              }
          }
          else {
            print('Move not possible, retry.');
          }
      }
    }
    print('Game is finished.');
  }

  void playCLIFixed(bool playerStart) { // Starts a game of Tic Tac Toe in the console but you choose who starts the game 
  }
}

// DEBUG ONLY, THERE SHOULD NOT BE ANY MAIN FUNCTION IN THIS FILE
void main() {
  print('hello.');
  var test = Game();
  test.playCLI();
}