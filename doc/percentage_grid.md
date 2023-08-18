# Responsive grid in Dart

## ChatGPT prompt
Write dart code to draw a square grid of containers to the screen. Its a grid of 9 x 9 square containers. The grid shoud fill 90% of the width of the portrait screen.There should be a margin of 1% of the screen width between the containers.

## ChatGPT response
Sure, here's an example Dart code using Flutter to draw a grid of 9x9 square containers with the specified layout:

''' dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGrid(),
    );
  }
}

class MyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerSize = (screenWidth * 0.9 - (screenWidth * 0.01 * 10)) / 9;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Square Grid of Containers'),
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          child: GridView.builder(
            itemCount: 9 * 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9,
              mainAxisSpacing: screenWidth * 0.01,
              crossAxisSpacing: screenWidth * 0.01,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: containerSize,
                height: containerSize,
                color: Colors.blue,
              );
            },
          ),
        ),
      ),
    );
  }
}
'''
Make sure you have Flutter installed and set up before you run this code. This code defines a Flutter app with a MyGrid widget that creates a 9x9 grid of blue square containers. It calculates the appropriate size for the containers and spacing based on the screen width and the specified percentages.