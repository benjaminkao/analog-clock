import 'package:flutter/material.dart';

import 'package:clock/clock_body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _clockTheme = _buildClockTheme(false);
  List<bool> isSelected = [false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _clockTheme,
      home: Scaffold(
          backgroundColor: isSelected[0] ? Colors.grey[800] : Colors.grey[300],
          body: Center(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Flex(    //Flex is basically row and column combined into one
                  //Change axis based on orientation of screen
                  direction: orientation == Orientation.portrait
                  ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 300, width: 300, child: Clock()),
                    SizedBox(
                      height: 50.0,
                      width: 100.0,
                    ),
                    Material(
                      child: ToggleButtons(
                        color: Colors.grey[800],
                        selectedColor: Colors.grey[300],
                        fillColor: Colors.grey[800],
                        borderColor: Colors.black,
                        selectedBorderColor: Colors.white,
                        children: <Widget>[
                          Icon(Icons.brightness_3),
                        ],
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                            _clockTheme = _buildClockTheme(isSelected[index]);
                          });
                        },
                        isSelected: isSelected,
                      ),
                    ),
                  ],
                );
              },
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClockBody(),
      );
  }
}

ThemeData _buildClockTheme(bool darkMode) {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: darkMode ? Colors.grey[800] : Colors.white,
    colorScheme: darkMode
        ? base.colorScheme.copyWith(
            primary: Colors.grey[800],
            secondary: Colors.grey[900],
            secondaryVariant: Colors.grey[700],
            primaryVariant: Colors.white,
    )
        : base.colorScheme.copyWith(
            primary: Colors.grey[300],
            secondary: Colors.grey[500],
            secondaryVariant: Colors.white,
            primaryVariant: Colors.grey,
          ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
