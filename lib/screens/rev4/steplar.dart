import 'package:flutter/material.dart';

class Stepperlar extends StatefulWidget {
  const Stepperlar({Key? key}) : super(key: key);

  @override
  _StepperlarState createState() => _StepperlarState();
}

final _form1Key = GlobalKey<FormState>();
final _form2Key = GlobalKey<FormState>();
final _form3Key = GlobalKey<FormState>();

class _StepperlarState extends State<Stepperlar> {
  List<Step> steplarim = [
    Step(
      title: Text("User Name"),
      subtitle: Text("username'ingizni kiriting"),
      content: Form(
        key: _form1Key,

          child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            icon: Icon(Icons.person),
            suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.cyanAccent),
            ),
            label: Text("username"),
            hintText: "type here",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.greenAccent),
            )),
        validator: (rahmatillo) {
          if (rahmatillo!.isEmpty) {
            return "Please don't leave empty";
          } else {
            return null;
          }
        },
      )),
      state: StepState.editing,
    ),
    Step(
      state: StepState.editing,
      title: Text("Email"),
      subtitle: Text("email'ingizni kiriting"),
      content: Form(
        key: _form2Key,

          child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(Icons.person),
            suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.cyanAccent),
            ),
            label: Text("email"),
            hintText: "tyep here",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.greenAccent),
            )),
        validator: (rahmatillo) {
          if (rahmatillo!.isEmpty) {
            return "Please don't leave empty";
          }
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(rahmatillo)) {
            return "Email kiriting faqat";
          } else {
            return null;
          }
        },
      )),
      //state: _form1Key.currentState!.validate() ? StepState.complete:StepState.error,
    ),
    Step(
      state: StepState.editing,
      title: Text("password"),
      subtitle: Text("Parol'ingizni kiriting"),
      content: Form(
        key: _form3Key,

          child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.person),
            suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.cyanAccent),
            ),
            label: Text("parol"),
            hintText: "type here",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.greenAccent),
            )),
        validator: (rahmatillo) {
          if (rahmatillo!.isEmpty) {
            return "Please don't leave empty";
          } else {
            return null;
          }
        },
      )),
      //state: _form1Key.currentState!.validate() ? StepState.complete:StepState.error,
    )
  ];
  int _currentStep = 0;
  List keylar = [_form1Key, _form2Key, _form3Key];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stepper(
            steps: steplarim,
            onStepTapped: (step) {
              _currentStep = step;
            },
            currentStep: _currentStep,
            onStepContinue: () {
              if (funksiya(keylar[_currentStep])) {
                if (_currentStep != 2) {
                  setState(() {
                    _currentStep++;
                  });
                }
              }
            },
            onStepCancel: () {
              if (funksiya(keylar[_currentStep])) {
                if (_currentStep != 0) {
                  setState(() {
                    _currentStep--;
                  });
                }
              }
            }),
      ),
    );
  }

  funksiya(GlobalKey<FormState> _key) {
    if (_key.currentState!.validate()) {      
        return true;
      }
      else{
      return false;
      }
    }
  
  
}
