import 'package:flutter/material.dart';
import 'game.dart';
void main() {
 runApp(Application());
}

class Application extends StatelessWidget {
  // Contain the main properties of the app and also the main window (content)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MAIN PARAMETERS OF MATERIAL APP
      title: 'Flutactoe', // Title of the application
      theme: ThemeData(primarySwatch: Colors.blue), // Theme color of the application
      darkTheme: ThemeData(primarySwatch: Colors.blueGrey), // Dark theme color of the application
      color: Colors.lightBlue, // Main color of the application
      debugShowCheckedModeBanner: false, // Disable the debug banner

      home: MainWindow(),
    );
  }
}

class MainWindow extends StatefulWidget {
  @override 
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  late Game game;
  List<TileState> testGrid = [TileState.empty,TileState.empty,TileState.empty,TileState.cross,TileState.cross,TileState.cross,TileState.rounds,TileState.rounds,TileState.rounds,];
  late String textTurn;

  @override
  void initState() {
      super.initState();
      game = Game();
      game.crossTurn = game.playerStart();
      if (game.crossTurn) {
          textTurn = "Cross's turn";
      }
      else {
          textTurn = "Round's turn";
      }
  }
  void updateGame(int index) {
    setState(() {  
      if (game.grid[index] == TileState.empty) {
        if (game.crossTurn) {
          game.grid[index] = TileState.cross;
          game.crossPlays.add(index);
          game.checkWinning(game.crossPlays);
          game.crossTurn = false;
          textTurn = "Round's turn";
        }
        else {
          game.grid[index] = TileState.rounds;
          game.roundPlays.add(index);
          game.checkWinning(game.roundPlays);
          game.crossTurn = true;
          textTurn = "Cross's turn";
        }
      }
      else {
        textTurn = "You can't play here, select another tile";
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // The app bar on top of the screen
        backgroundColor: Colors.blue,
        title: Text(
          'Welcome to Flutactoe!',
          style: TextStyle(color: Colors.white),
        ),
      ),
      
      body: // The main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 50,
            children: [
            SizedBox(height: 80,),
            
            // MAIN TEXT TELLING WHICH TURN IS IT
            Text(textTurn, style: TextStyle(fontSize: 28),),

            // MAIN GRID
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          List.generate(
                              3,
                              (index) => GestureDetector(
                                  onTap:() => updateGame(index),
                                  child:
                                      Container(
                                          alignment: AlignmentGeometry.center,
                                          margin: const EdgeInsets.all(10.0),
                                          width: 100,
                                          height: 100, 
                                          color: updateTileColor(game.grid[index]),
                                          child: Text(getSymbolFromTileState(game.grid[index]), style: TextStyle(color: Colors.white, fontSize: 68),)
                                      ),
                                ), 
                            ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          List.generate(
                              3,
                              (index) => GestureDetector(
                                  onTap:() => updateGame(index+3),
                                  child:
                                      Container(
                                          alignment: AlignmentGeometry.center,
                                          margin: const EdgeInsets.all(10.0),
                                          width: 100,
                                          height: 100, 
                                          color: updateTileColor(game.grid[index+3]),
                                        
                                          child: Text(getSymbolFromTileState(game.grid[index+3]), style: TextStyle(color: Colors.white, fontSize: 68),)
                                      ),
                                ), 
                            ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          List.generate(
                              3,
                              (index) => GestureDetector(
                                  onTap:() => updateGame(index+6),
                                  child:
                                      Container(
                                          alignment: AlignmentGeometry.center,
                                          margin: const EdgeInsets.all(10.0),
                                          width: 100,
                                          height: 100, 
                                          color: updateTileColor(game.grid[index+6]),
                                          child: Text(getSymbolFromTileState(game.grid[index+6]), style: TextStyle(color: Colors.white, fontSize: 68),)
                                      ),
                                ), 
                            ),
                      ),
                  ],
              ),
          
            // RESET BUTTON

          ])
      );




            // gridUI(testGrid),
  }

  void gridUI(List<TileState> grid) {
    
  }
}


Color updateTileColor(TileState state) {
  switch (state) {
    case TileState.cross:
      return Colors.red;
    case TileState.rounds:
      return Colors.lightBlue;
    case TileState.empty:
      return Colors.blueGrey;
    }
  }










/*
    // FIRST ROW
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[0]),
        ),
        
        child:
            GestureDetector(
              onTap: onGridTap,
              child: Text(getSymbolFromTileState(grid[0]), style: TextStyle(color: Colors.white, fontSize: 76),),
            ) 
            
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[1]),
        ),

        child: Text(getSymbolFromTileState(grid[1]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[2]),
        ),

        child: Text(getSymbolFromTileState(grid[2]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
    ],),
    
    // SECOND ROW
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[3]),
        ),

        child: Text(getSymbolFromTileState(grid[3]), style: TextStyle(color: Colors.white, fontSize: 76,),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[4]),
        ),

        child: Text(getSymbolFromTileState(grid[4]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[5]),
        ),

        child: Text(getSymbolFromTileState(grid[5]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
    ],),
    
    // THIRD ROW
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[6]),
        ),

        child: Text(getSymbolFromTileState(grid[6]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[7]),
        ),

        child: Text(getSymbolFromTileState(grid[7]), style: TextStyle(color: Colors.white, fontSize: 76),)
        ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: updateTileColor(grid[8]),
        ),

        child: Text(getSymbolFromTileState(grid[8]), style: TextStyle(color: Colors.white, fontSize: 76),),
      )
      ],
    ),
    ],);
}
*/


void onGridTap() {
  print("Hello, World!");
}

/*
var widget = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Container(
      height: 100,
      width: 100,
      color: Colors.grey.shade600,
      child: Text('X', style: TextStyle(color: Colors.white)),
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.grey.shade600,
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.grey.shade600,
    ),

  ],

);
*/

/*

[] [] []
[] [] []
[] [] []

*/