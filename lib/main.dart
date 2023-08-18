import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

enum TileState { covered, blown, open, flagged, revealed }

void main() => runApp(const BoardGameApp());

class BoardGameApp extends StatelessWidget {
  const BoardGameApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.portraitUp,
    //     DeviceOrientation.portraitDown,
    //   ]);
    return const MaterialApp(
      // Application name
      title: 'Board Game',
      // The widget which will be started on application startup
      home: Board(),
    ); // MaterialApp
  }
}

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  BoardState createState() => BoardState();
}

class BoardState extends State<Board> {
  final int rows = 9;
  final int cols = 9;
  final int numOfMines = 11; // TODO: Minesweeper specific
  final double gridWidth = 90 / 100; // Grid width is 90% of screen width
  final double tileMargin =
      1 / 100; // Margin between the tiles is 1% of screen width

  late List<List<TileState>> uiState;

  void resetBoard() {
    uiState = List<List<TileState>>.generate(rows, (row) {
      return List<TileState>.filled(cols, TileState.covered);
    }); // List.generate
  }

  @override
  void initState() {
    resetBoard();
    super.initState();
  }

  Widget buildBoard() {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerSize =
        (screenWidth * gridWidth - (screenWidth * tileMargin * 10 / 2)) / cols;

    List<Row> boardRow = <Row>[];
    for (int i = 0; i < rows; i++) {
      List<Widget> rowChildren = <Widget>[];
      for (int j = 0; j < cols; j++) {
        TileState state = uiState[i][j];
        if (state == TileState.covered) {
          rowChildren.add(GestureDetector(
            child: Listener(
              child: Container(
                margin: EdgeInsets.all(screenWidth * tileMargin / 2),
                height: containerSize,
                width: containerSize,
                color: Colors.grey,
              ),
            ),
          ));
        }
      }
      boardRow.add(Row(
        children: rowChildren,
        mainAxisAlignment: MainAxisAlignment.center,
        key: ValueKey<int>(i),
      ));
    }
    return Container(
      color: Colors.grey[700],
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: boardRow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board game'),
      ),
      body: Container(
        color: Colors.grey[50],
        child: Center(
          child: buildBoard(),
        ),
      ),
    );
  }
}
