import 'package:flutter/material.dart';

class Apage extends StatefulWidget {
  String? title;
  Apage({Key? key, this.title}) : super(key: key);

  @override
  _ApageState createState() => _ApageState();
}

class _ApageState extends State<Apage> {
  @override
  Widget build(BuildContext context) {
  final  arg = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg['title']),
      ),
    );
  }
}
