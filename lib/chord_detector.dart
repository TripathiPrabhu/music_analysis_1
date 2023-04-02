// import 'dart:async';
// import 'dart:math';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_chord/flutter_chord.dart';
// import 'package:flutter_sound/flutter_sound.dart';
//
//
// import 'package:flutter/material.dart';
//
// import 'chord_detector.dart';
//
// class ChordDetectorPage extends StatefulWidget {
//   @override
//   _ChordDetectorPageState createState() => _ChordDetectorPageState();
// }
//
// class _ChordDetectorPageState extends State<ChordDetectorPage> {
//   bool _isRecording = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chord Detector'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             MaterialButton(
//               child: Text(_isRecording ? 'Stop' : 'Record'),
//               onPressed: _isRecording ? _stopRecording : _startRecording,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _startRecording() async {
//     setState(() {
//       _isRecording = true;
//     });
//    // await ChordDetector.startRecording();
//   }
//
//   Future<void> _stopRecording() async {
//     setState(() {
//       _isRecording = false;
//     });
//   //  await ChordLyricsLine.stopRecording();
//   }
// }
