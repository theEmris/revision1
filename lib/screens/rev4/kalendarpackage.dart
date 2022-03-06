import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class KalendarPackage extends StatefulWidget {
  const KalendarPackage({Key? key}) : super(key: key);

  @override
  _KalendarPackageState createState() => _KalendarPackageState();
}

class _KalendarPackageState extends State<KalendarPackage> {
  DateTime _now = DateTime.now();
  DateTime _firstDate = DateTime(1959, 7, 18);
  DateTime _lastDate = DateTime(2070, 6, 9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateTimePicker(
                initialValue: '',
                firstDate: _firstDate,
                lastDate: _lastDate,
                dateLabelText: 'Date',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(
                height: 200,
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),
              ),
              Container(
                height: 100,
                color: Colors.white38,
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      print("DatePicker olgan qiymat: $date");
                    });
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: _now,
                            firstDate: _firstDate,
                            lastDate: _lastDate)
                        .then((value) {
                      print("tanlandi: $value");
                    });
                  },
                  child: Text("show _date_picker")),
              ElevatedButton(
                  onPressed: () {
                    BottomPicker.time(
                            title: "Set your next meeting time",
                            titleStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.orange),
                            onSubmit: (index) {
                              print("tanlandi $index");
                            },
                            onClose: () {
                              print("Picker closed");
                            },
                            bottomPickerTheme: BOTTOM_PICKER_THEME.orange,
                            use24hFormat: true)
                        .show(context);
                  },
                  child: Text("bottom Picker 14"))
            ],
          ),
        ),
      ),
    );
  }
}
