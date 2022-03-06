import 'package:flutter/material.dart';

class Erorpage extends StatefulWidget {
  
  Erorpage({Key? key}) : super(key: key);

  @override
  _ErorpageState createState() => _ErorpageState();
}

class _ErorpageState extends State<Erorpage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Error not Found"),
      ),
    );
  }
}
