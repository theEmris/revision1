import 'dart:math';

import 'package:flutter/material.dart';

class Home5 extends StatefulWidget {
  const Home5({Key? key}) : super(key: key);

  @override
  _Home5State createState() => _Home5State();
}

class _Home5State extends State<Home5> {
  int son1 = 0;
  int son2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Set State"),
              onPressed: () {
                setState(() {
                  myRandOne();
                  debugPrint("son1: ${son1} va son2: ${son2}");
                });
              },
            ),
            ElevatedButton(
              child: Text("Not Set State"),
              onPressed: () {
                setState(() {
                  debugPrint("son1: ${son1} va son2: ${son2}");
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  myRandOne() {
    int r = Random().nextInt(100);
    int r2 = Random().nextInt(100);
    son1 = r;
    son2 = r2;
  }

  myRandTwo() {
    int r = Random().nextInt(10);
    return r;
  }
}
