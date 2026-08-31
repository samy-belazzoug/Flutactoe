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

class MainWindow extends StatelessWidget {
  Game game = Game();
  List<TileState> testGrid = [TileState.empty,TileState.empty,TileState.empty,TileState.cross,TileState.cross,TileState.cross,TileState.rounds,TileState.rounds,TileState.rounds,];
  
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
          gridUI(testGrid),
    );
  }
}

Widget? gridUI(List<TileState> grid) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    // FIRST ROW
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        width: 100,
        height: 100,
        child: Text(getSymbolFromTileState(grid[0]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        width: 100,
        height: 100,
        child: Text(getSymbolFromTileState(grid[1]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        width: 100,
        height: 100,
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
        color: Colors.blueGrey,
        width: 100,
        height: 100,
        child: Text(getSymbolFromTileState(grid[3]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        width: 100,
        height: 100,
        child: Text(getSymbolFromTileState(grid[4]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        width: 100,
        height: 100,
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
        color: Colors.blueGrey,
        width: 100,
        height: 100,
        child: Text(getSymbolFromTileState(grid[6]), style: TextStyle(color: Colors.white, fontSize: 76),),
      ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        width: 100,
        height: 100,
        child: Text(getSymbolFromTileState(grid[7]), style: TextStyle(color: Colors.white, fontSize: 76),)
        ),
      Container(
        alignment: AlignmentGeometry.center,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        width: 100,
        height: 100,
        child: Text(getSymbolFromTileState(grid[8]), style: TextStyle(color: Colors.white, fontSize: 76),),
      )
      ],
    ),
    ],);
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