import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {

  final CountdownTimer countTimer = CountdownTimer();
  double? frequency;
  String note = '';
  int? octave;
  bool isRecording = false;

  FlutterFft flutterFft =  FlutterFft();

  _initialize() async {
    //print("Starting recorder...");
    // print("Before");
    // bool hasPermission = await flutterFft.checkPermission();
    // print("After: " + hasPermission.toString());

    // Keep asking for mic permission until accepted
    while (!(await flutterFft.checkPermission())) {
      flutterFft.requestPermission();
      // IF DENY QUIT PROGRAM
    }

    // await flutterFft.checkPermissions();
    await flutterFft.startRecorder();
     print("Recorder started...");
    // setState(() => isRecording = flutterFft.getIsRecording);

    flutterFft.onRecorderStateChanged.listen(
            (data) => {
          //   print("Changed state, received: $data"),
          setState(
                () => {
              frequency = data[1] as double,
              note = data[2] as String,
              octave = data[5] as int,
            },
          ),
          flutterFft.setNote = note,
          flutterFft.setFrequency = frequency!,
          flutterFft.setOctave = octave!,
          //   print("Octave: ${octave!.toString()}")
        },
        onError: (err) {
          // print("Error: $err");
        },
        onDone: () => {print("Isdone")});
  }

   @override
  void initState() {
  //   isRecording = flutterFft.getIsRecording;
  //   frequency = flutterFft.getFrequency;
   //  note = flutterFft.getNote;
  //   octave = flutterFft.getOctave;
    super.initState();
     _initialize();
  }







  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  bool _isRunning = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  void _startTimer() {

    setState(() {
      _isRunning = true;
      isRecording = true ;
      isRecording = flutterFft.getIsRecording;
      countTimer.key;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_seconds == 59) {
          _seconds = 0;
          if (_minutes == 59) {
            _minutes = 0;
            _hours++;
          } else {
            _minutes++;
          }
        } else {
          _seconds++;
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();

    setState(() {
      _isRunning = false;
      isRecording = false;
      countTimer.key;
    });
  }

  void _resetTimer() {

    setState(() {
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
      _isRunning = false;
      isRecording = false;
      countTimer.key;

    });
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    print(isRecording);
    return Scaffold(
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isRecording == true
            ? Text(note!,
            style: TextStyle(fontSize: 30))
            : Text("..", style: TextStyle(fontSize: 35)),
        // isRecording!
        //     ? Text(
        //     "Current frequency: ${frequency!.toStringAsFixed(2)}",
        //     style: TextStyle(fontSize: 30))
        //     : Text("Not Recording", style: TextStyle(fontSize: 35))


        // Figma Flutter Generator ItemWidget - GROUP
        Container(
            width: 310,
            height: 310,

            child: GestureDetector(
              onTap: (){
                // isRecording = !isRecording!;
                // countTimer.key;
              },
              child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 310,
                            height: 310,
                            decoration: BoxDecoration(
                              boxShadow : [BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.03999999910593033),
                                  offset: Offset(0,2),
                                  blurRadius: 48
                              )],
                              color : Color.fromRGBO(255, 255, 255, 1),
                              borderRadius : BorderRadius.all(Radius.elliptical(310, 310)),
                            )
                        )
                    ),Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                            width: 290,
                            height: 290,
                            decoration: BoxDecoration(
                              color : Color.fromRGBO(243, 180, 178, 1),
                              borderRadius : BorderRadius.all(Radius.elliptical(290, 290)),
                            )
                        )
                    ),Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                            width: 270,
                            height: 270,
                            decoration: BoxDecoration(
                              color : Color.fromRGBO(222, 101, 98, 1),
                              borderRadius : BorderRadius.all(Radius.elliptical(270, 270)),
                            )
                        )
                    ),Positioned(
                        top: 86,
                        left: 86,
                        child: Container(
                            width: 138,
                            height: 138,

                            child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 138,
                                          height: 138,
                                          decoration: BoxDecoration(
                                            color: Color(0XFFE58683),
                                            //  color : Color.fromRGBO(255, 255, 255, 1),
                                            borderRadius : BorderRadius.all(Radius.elliptical(138, 138)),
                                          )
                                      )
                                  ),Positioned(

                                      child: Center(
                                        child: SizedBox(
                                            height: 100,
                                            width: 60,
                                            child: Image.asset('images/mic.png',fit: BoxFit.fill,)),
                                      )
                                  ),
                                ]
                            )
                        )
                    ),
                  ]
              ),
            )
        ),

        Text(
          '$_hours:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
          style: TextStyle(fontSize: 72),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRunning ? _stopTimer : _startTimer,
              child: Text(_isRunning ? 'Stop' : 'Start'),
            ),
            SizedBox(width: 24),
            ElevatedButton(
              onPressed: _resetTimer,
              child: Text('Reset'),
            ),
          ],
        ),

      ],
    ),
    ),



    );
  }
}
