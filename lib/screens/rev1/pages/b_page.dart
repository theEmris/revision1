import 'package:flutter/material.dart';

class Bpage extends StatefulWidget {
  String? title;
  Bpage({Key? key,this.title}) : super(key: key);

  @override
  _BpageState createState() => _BpageState();
}

class _BpageState extends State<Bpage> {
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
