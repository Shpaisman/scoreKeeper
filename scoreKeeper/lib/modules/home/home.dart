import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void onInit() {
  //   super.initState();
  // }

  int point1 = 0;
  int point2 = 0;
  int game1 = 0;
  int game2 = 0;
  int adv1 = 0;
  int adv2 = 0;
  int set1 = 0;
  int set2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue, Colors.red])),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    height: 100,
                    width: 100,
                    child: FlatButton(
                      onPressed: () {
                        _increment1();
                      },
                      child: Text("Hero"),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: FlatButton(
                      onPressed: () {
                        _increment2();
                      },
                      child: Text("Villain"),
                    ),
                  )
                ],
              ),
              scoreKeeper(),
              Text("$game1 - $game2", style: TextStyle(fontSize: 25)),
              Text(
                "$set1 - $set2",
                style: TextStyle(fontSize: 15, height: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget scoreKeeper() {
    if (point1 == 40 && point2 == 40 && adv1 == 0 && adv2 == 0) {
      return Text(
        "Deuce",
      );
    }
    if (adv1 == 1 && adv2 == 0) {
      return Text("Vantagem a favor");
    }
    if (adv1 == 0 && adv2 == 1) {
      return Text("Vantagem contra");
    } else
      return Text(
        "$point1 $point2",
        style: TextStyle(fontSize: 30, wordSpacing: 70),
      );
  }

  void _increment1() {
    setState(() {
      if (point1 == 0) {
        point1 = 15;
      } else if (point1 == 15) {
        point1 = 30;
      } else if (point1 == 30) {
        point1 = 40;
      } else if (point1 == 40 && point2 != 40) {
        point1 = 0;
        game1 += 1;
        point2 = 0;
      } else if (point1 == 40 && point2 == 40) {
        adv1 += 1;
        if (adv1 == 2 && adv2 == 0) {
          point1 = 0;
          point2 = 0;
          game1 += 1;
          adv1 = 0;
          adv2 = 0;
        }
        if (adv1 == 1 && adv2 == 1) {
          adv1 = 0;
          adv2 = 0;
        }
      }
      if (game1 == 6) {
        game1 = 0;
        game2 = 0;
        set1 += 1;
      }
    });
  }

  void _increment2() {
    setState(() {
      if (point2 == 0) {
        point2 = 15;
      } else if (point2 == 15) {
        point2 = 30;
      } else if (point2 == 30) {
        point2 = 40;
      } else if (point2 == 40 && point1 != 40) {
        point2 = 0;
        game2 += 1;
        point1 = 0;
      } else if (point2 == 40 && point1 == 40) {
        adv2 += 1;
        if (adv2 == 2 && adv1 == 0) {
          point2 = 0;
          point1 = 0;
          game2 += 1;
          adv1 = 0;
          adv2 = 0;
        }
        if (adv2 == 1 && adv1 == 1) {
          adv1 = 0;
          adv2 = 0;
        }
      }

      if (game2 == 6) {
        game1 = 0;
        game2 = 0;
        set2 += 1;
      }
    });
  }
}
