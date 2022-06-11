import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:async';

void main() {
  runApp(const MaterialApp(
    home: Menu(),
  ));
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => HomeState();
}

class HomeState extends State<Game> {
  List<int> lastguesses = [];
  final String str = ('Your number is  ');
  int random = 0;
  int previous = 0;
  int score = 0;
  int index = 0;
  int guessed_card1 = 53;
  int guessed_card2 = 53;
  int guessed_card3 = 53;
  int guessed_card4 = 53;
  int guessed_card5 = 53;
  int future_value = -1;
  int previous_value = 0;

  callback(selector, temp) async {
    index = temp;
    await Future.delayed(const Duration(seconds: 2), () {
      previous = random;
      guessed_card1 = previous;

      setState(() {
        random = selector;
      });
    });
  }

  callback1(previousval) async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        guessed_card2 = previousval;
      });
    });
  }

  callback2() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card3 = guessed_card2;
      });
    });
  }

  callback3() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card4 = guessed_card3;
      });
    });
  }

  callback4(previousval) {
    Future.delayed(const Duration(seconds: 0), () async {
      guessed_card5 = previousval;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background_portrait.png'),
                  fit: BoxFit.cover)),
          child: Stack(children: [
            Positioned(
              left: 235,
              top: 300,
              child: Image.asset(
                'assets/$guessed_card5.png',
                width: 130,
                height: 130,
              ),
            ),
            Positioned(
              left: 135,
              top: 300,
              child: Image.asset(
                'assets/$guessed_card4.png',
                width: 130,
                height: 130,
              ),
            ),
            Positioned(
              left: 285,
              top: 140,
              child: Image.asset(
                'assets/$guessed_card3.png',
                width: 130,
                height: 130,
              ),
            ),
            Positioned(
              left: 190,
              top: 140,
              child: Image.asset(
                'assets/$guessed_card2.png',
                width: 130,
                height: 130,
              ),
            ),
            Positioned(
              left: 95,
              top: 140,
              child: Image.asset(
                'assets/$guessed_card1.png',
                width: 130,
                height: 130,
              ),
            ),
            Positioned(
              top: 200,
              left: -15,
              child: Image.asset(
                'assets/$guessed_card1.png',
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
              left: 50,
              bottom: 60,
              child: ElevatedButton(
                child: Text('HIGH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 5, 28, 233),
                    )),
                onPressed: () {
                  List<int> cardValues = [
                    1,
                    1,
                    1,
                    1,
                    2,
                    2,
                    2,
                    2,
                    3,
                    3,
                    3,
                    3,
                    4,
                    4,
                    4,
                    4,
                    5,
                    5,
                    5,
                    5,
                    6,
                    6,
                    6,
                    6,
                    7,
                    7,
                    7,
                    7,
                    8,
                    8,
                    8,
                    8,
                    9,
                    9,
                    9,
                    9,
                    10,
                    10,
                    10,
                    10,
                    11,
                    11,
                    11,
                    11,
                    12,
                    12,
                    12,
                    12,
                    13,
                    13,
                    13,
                    13
                  ];

                  future_value = cardValues.elementAt(random);
                  previous_value = cardValues.elementAt(previous);

                  if (previous_value <= future_value && index != 0) {
                    print('$previous_value,$future_value');
                    score++;
                    print('Score :$score');
                    Future.delayed(const Duration(seconds: 1), () {
                      callback3();
                      callback2();
                      setState(() {
                        callback1(previous);
                      });
                      callback4(guessed_card4);
                    });
                  } else {
                    setState(() {
                      score = 0;
                      random = 0;
                      previous = 0;
                      previous_value = 0;
                      future_value = 0;
                      guessed_card1 = 53;
                      guessed_card2 = 53;
                      guessed_card3 = 53;
                      guessed_card4 = 53;
                      guessed_card5 = 53;
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Gameover()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 0, 0),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
              ),
            ),
            Positioned(
              left: 175,
              bottom: 60,
              child: ElevatedButton(
                child: Text('LOW',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 6, 21, 228),
                    )),
                onPressed: () {
                  List<int> cardValues = [
                    1,
                    1,
                    1,
                    1,
                    2,
                    2,
                    2,
                    2,
                    3,
                    3,
                    3,
                    3,
                    4,
                    4,
                    4,
                    4,
                    5,
                    5,
                    5,
                    5,
                    6,
                    6,
                    6,
                    6,
                    7,
                    7,
                    7,
                    7,
                    8,
                    8,
                    8,
                    8,
                    9,
                    9,
                    9,
                    9,
                    10,
                    10,
                    10,
                    10,
                    11,
                    11,
                    11,
                    11,
                    12,
                    12,
                    12,
                    12,
                    13,
                    13,
                    13,
                    13
                  ];

                  future_value = cardValues.elementAt(random);
                  previous_value = cardValues.elementAt(previous);
                  if (previous_value > future_value) {
                    print('$previous_value,$future_value');

                    score++;
                    print('Score :$score');
                    Future.delayed(const Duration(seconds: 1), () {
                      callback3();
                      callback2();
                      setState(() {
                        callback1(previous);
                      });

                      callback4(guessed_card4);
                    });
                  } else {
                    setState(() {
                      score = 0;
                      random = 0;
                      previous_value = 0;
                      future_value = 0;
                      guessed_card1 = 53;
                      guessed_card2 = 53;
                      guessed_card3 = 53;
                      guessed_card4 = 53;
                      guessed_card5 = 53;
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Gameover()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
              ),
            ),
            Positioned(
                bottom: 60,
                left: 300,
                child: Getpicture(
                  callback: callback,
                  index: index,
                )),
            Positioned(
                top: 75,
                left: 280,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Score: $score',
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(184, 20, 4, 240)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(249, 7, 7, 7)),
                ))
          ]),
        ),
      ),
    );
  }
}

class Getpicture extends StatefulWidget {
  int index = 0;
  final Function callback;
  Getpicture({required this.callback, required this.index});

  @override
  State<Getpicture> createState() => GetpictureState();
}

class GetpictureState extends State<Getpicture> {
  int selector = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        selector = Random().nextInt(52);

        setState(() {
          index++;
        });
        widget.callback(selector, index);
      },
      child: Text('NEXT',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 3, 7, 245),
          )),
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(249, 0, 0, 0),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
    );
  }
}

class Gameover extends StatefulWidget {
  const Gameover({Key? key}) : super(key: key);

  @override
  State<Gameover> createState() => MenuState();
}

class MenuState extends State<Gameover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu_portrait.png'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black12.withOpacity(0.0),
                  Colors.black87.withOpacity(0.6)
                ], begin: Alignment.center),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 1366.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.black87])),
                  )),
            ),
          ),
          Positioned(
              left: 5,
              bottom: 250,
              child: Image.asset(
                'assets/gameover_portrait.png',
                width: 400,
                height: 500,
              )),
          Positioned(
              left: 100,
              bottom: 220,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Game()));
                },
                child: Text('Try Again'),
                style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(Size(400, 500)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 50,
                    )),
                    elevation: MaterialStateProperty.all<double>(20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 39, 76, 90))),
              )),
          Positioned(
              left: 155,
              bottom: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                },
                child: Text('Exit'),
                style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(Size(350, 400)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 50,
                    )),
                    elevation: MaterialStateProperty.all<double>(20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 37, 55, 82))),
              ))
        ],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => Menu_State();
}

class Menu_State extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu_portrait.png'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black12.withOpacity(0.0),
                  Colors.black87.withOpacity(0.6)
                ], begin: Alignment.center),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 1366.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.black87])),
                  )),
            ),
          ),
          Positioned(
              left: 5,
              bottom: 250,
              child: Image.asset(
                'assets/High-low.png',
                width: 400,
                height: 500,
              )),
          Positioned(
              left: 130,
              bottom: 270,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Game()));
                },
                child: Text('Start'),
                style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(Size(200, 300)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 50,
                    )),
                    elevation: MaterialStateProperty.all<double>(20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 33, 49, 83))),
              )),
          Positioned(
              left: 5,
              bottom: 185,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Player should click on the "NEXT" button,the card will flick',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 63, 190, 190),
                  ))),
          Positioned(
              left: 15,
              bottom: 155,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'then guess based on the card that you clicked',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 93, 207, 207),
                  ))),
          Positioned(
              left: 15,
              bottom: 125,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Click High if your guess of the card is higher ',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 66, 179, 169),
                  ))),
          Positioned(
              left: 7,
              bottom: 95,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Click low if your guess of the card is lower',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 63, 160, 167),
                  ))),
          Positioned(
              left: 23,
              bottom: 65,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Correct Guess means the game will continue',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 71, 168, 168),
                  ))),
          Positioned(
              left: 35,
              bottom: 35,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Wrong Guess means GameOver.',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 67, 166, 173),
                  )))
        ],
      ),
    );
  }
}
