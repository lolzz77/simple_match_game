import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // list of images
  List<String> imageList = [
    'lib/assets/PNG/Square (outline)/bear.png',
    'lib/assets/PNG/Square (outline)/chick.png',
    'lib/assets/PNG/Square (outline)/chicken.png',
    'lib/assets/PNG/Square (outline)/duck.png',
    'lib/assets/PNG/Square (outline)/rabbit.png',
    'lib/assets/PNG/Square (outline)/zebra.png'
  ];
  // for rolling random image
  int index = 0;
  // to set the target image to roll on to win the game
  int targetIndex = 0;
  var rng = new Random();
  bool gameStart = true;
  String result = '';
  String loseAudio = 'dissapointed.mp3';
  String winAudio = 'fairy_dust.mp3';

  // audio
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache cache = new AudioCache();

  @override
  void initState() {
    setTargetImage();
    randomImage();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    imageList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Matching Game',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Matching Game"),
            ),
            body: Container(
              child: Center(
                child: Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Try and Match with this Animal!",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 100, child: Image.asset(imageList[targetIndex])),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    child: Image.asset(imageList[index]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    // Align to bottom center
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        TextButton(
                            // Stop Button
                            // Make button text white and background blue
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () => {
                                  gameStart = false,
                                  print(
                                      'Target Index ${targetIndex} and Index ${index}'),
                                  if (targetIndex == index)
                                    {playLocal(winAudio), result = "You win!"}
                                  else
                                    {
                                      playLocal(loseAudio),
                                      result = "Ops! Try Again."
                                    },
                                  setState(() {})
                                },
                            child: Text(
                              "Stop",
                              style: TextStyle(fontSize: 30),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                            // Restart Button
                            // Make button text white and background blue
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () => {
                                  gameStart = true,
                                  randomImage(),
                                  setTargetImage(),
                                  result = '',
                                  setState(() {})
                                },
                            child: Text(
                              "Restart Game",
                              style: TextStyle(fontSize: 30),
                            )),
                        Text(
                          printResult(result),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }

  playLocal(audioName) async {
    //.play will play only once
    //.loop will keep playing
    //You can use audioPlayer.stop() to stop loop
    audioPlayer = await cache.play(audioName);
  }

  // stopLocal() async {
  //   audioPlayer.stop();
  // }

  String printResult(result) {
    return result;
  }

  void setTargetImage() {
    targetIndex = rng.nextInt(imageList.length);
  }

  void randomImage() async {
    while (gameStart) {
      // You have to put async & await for delay function
      await Future.delayed(Duration(milliseconds: 100), () {
        // I have a problem where I pressed stop
        // But the index would still update 1 more time
        // This is due to Future.delay
        // Once you set gameStart to false, the 'index update' task is already called
        // But the future.delay will delay the task 100ms
        // After 100ms, it will execute 'index update'
        if (!gameStart) {
          return;
        }

        // Generate random num between 0 to length of imageList
        // You have to put this outside of setState else the loop will not be delayed
        index = rng.nextInt(imageList.length);
        setState(() {
          print(index);
        });
      });
    }
  }
}
