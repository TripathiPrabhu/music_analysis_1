import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:music_analysis_1/count_down_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chord Detector",
        //theme: ThemeData.dark(),
        //color: Colors.blue,
        home: CountdownTimer(),
    );
  }
}