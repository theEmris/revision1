import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class Home4 extends StatefulWidget {
  const Home4({Key? key}) : super(key: key);

  @override
  _Home4State createState() => _Home4State();
}

class _Home4State extends State<Home4> {
  DateTime _now = DateTime.now();
  DateTime _firstDate = DateTime(1959, 7, 18);
  DateTime _lastDate = DateTime(2070, 6, 9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("Birinchi kalendar"),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: _now,
                    firstDate: _firstDate,
                    lastDate: _lastDate,
                    cancelText: "cancelText",
                    confirmText: "confirmText",
                  ).then((value) {
                    print("tanlangan time:$value");
                  });
                }),
            ElevatedButton(
              child: Text("ShowIosPicker"),
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.green.shade200,
                        child: Column(
                          children: [
                            SizedBox(
                              
                              height: MediaQuery.of(context).size.height * 0.35,
                              child:
                                  CupertinoDatePicker(
                                    backgroundColor: Colors.purple.shade200,
                                    minimumYear: 1959,
                                    maximumDate: _lastDate
                                    ,use24hFormat: true
                                    ,
                                    onDateTimeChanged: (_) {
                                       print("Cupertino date picker niki: $_");
                              }),
                            )
                          ],
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
