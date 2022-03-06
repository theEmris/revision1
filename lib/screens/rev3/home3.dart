import 'package:flutter/material.dart';

class Home3 extends StatefulWidget {
  const Home3({Key? key}) : super(key: key);

  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  bool _isChecked = false;
  var checkValue;
  bool _switchValue = false;
  double _sliderValue = 1;
  String _dropValue = "Uzbekistan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckboxListTile(
              value: _isChecked,
              checkColor: Colors.white,
              autofocus: true,
              title: Text("Checkbox list tile "),
              tileColor: Colors.amber,
              onChanged: (v) {
                setState(() {
                  _isChecked = !_isChecked;
                });
              }),
          RadioListTile(
              title: Text("o'qiysizmi"),
              value: "Student",
              groupValue: checkValue,
              onChanged: (v) {
                setState(() {
                  checkValue = v;
                });
              }),
          RadioListTile(
              title: Text("iSHLAYSIZMI"),
              value: "Ishlaydi",
              groupValue: checkValue,
              onChanged: (v) {
                setState(() {
                  checkValue = v;
                });
              }),
          Switch(
              value: _switchValue,
              onChanged: (v) {
                setState(() {
                  _switchValue = !_switchValue;
                });
              }),
          Slider(
              divisions: 10,
              value: _sliderValue,
              onChanged: (v) {
                setState(() {
                  _sliderValue = v;
                  debugPrint("${_sliderValue}");
                });
              }),
          DropdownButton(
              value: _dropValue,
              items: [
                DropdownMenuItem(
                  
                  value: "Uzbekistan",
                  child: Text("Uzbekistan"),
                  
                  
                ),
                 DropdownMenuItem(
                  
                  value: "Russia",
                  child: Text("Russia"),
                  
                  
                ),
                 DropdownMenuItem(
                  
                  value: "UAE",
                  child: Text("UAE"),
                  
                  
                ),
                
              ],
               onChanged: (v) {
                setState(() {
                  _dropValue = v.toString();
                });
              }
             )
        ],
      ),
    );
  }
}
