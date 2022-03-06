import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Asahifa',
                    arguments: {"title": "A sahifamiz"});
              },
              child: Text("A_page'ga"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Bsahifa',
                    arguments: {"title": "B sahifasi"});
              },
              child: Text("B_page'ga"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/afaf');
              },
              child: Text("Erorr_page'ga"),
            ),
          ],
        ),
      ),
    );
  }
}
