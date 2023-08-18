import 'package:flutter/material.dart';

enum TileState { covered, blown, open, flagged, revealed }

void main() => runApp(const BoardGameApp());

class BoardGameApp extends StatelessWidget {
  const BoardGameApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
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
    List<Row> boardRow = <Row>[];
    for (int i = 0; i < rows; i++) {
      List<Widget> rowChildren = <Widget>[];
      for (int j = 0; j < cols; j++) {
        TileState state = uiState[i][j];
        if (state == TileState.covered) {
          rowChildren.add(GestureDetector(
            child: Listener(
              child: Container(
                margin: const EdgeInsets.all(1.0),
                height: 20.0,
                width: 20.0,
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
      padding: const EdgeInsets.all(10.0),
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
