import 'package:flutter/material.dart';
import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
class StepperPackage extends StatefulWidget {
  const StepperPackage({Key? key}) : super(key: key);

  @override
  _StepperPackageState createState() => _StepperPackageState();
}

final _form1Key = GlobalKey<FormState>();
final _form2Key = GlobalKey<FormState>();
final _form3Key = GlobalKey<FormState>();
List keylar = [_form1Key, _form2Key, _form3Key];

class _StepperPackageState extends State<StepperPackage> {

  int _currentStep = 0;

  List<Step> _myStep = [
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
  List<Step> _yourStep = [
    Step(title: Text("1"), content:Text("1")),
  ];
  int activeStep = 5; // Initial step set to 5.

  int upperBound = 6;
 
  @override
  Widget build(BuildContext context) {    
    
    return Scaffold(
      body: 
      //!1 - Stepper flutterni o'ziniki 

        //flutterStepper(),

      //?2 - Packet pubdev.dan
      //  awesomeStepper()
    //TODO 3 - packet pubdev dan
     Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconStepper(
                icons: [
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                ],

                // activeStep property set to activeStep variable defined above.
                activeStep: activeStep,

                // This ensures step-tapping updates the activeStep. 
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
              header(),
              Expanded(
                child: FittedBox(
                  child: Center(
                    child: Text('$activeStep'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),
            ],
          ),
        ),
      
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';

      case 3:
        return 'About the Author';

      case 4:
        return 'Publisher Information';

      case 5:
        return 'Reviews';

      case 6:
        return 'Chapters #1';

      default:
        return 'Introduction';
    }
  }


                
                
            
  
  

  AwesomeStepper awesomeStepper() {
    return AwesomeStepper(
            headerColor: Colors.blue,
            progressColor: Colors.red,
            headerStyle: const TextStyle(color: Colors.white, fontSize: 20),
            progressBarAnimationDuration: const Duration(seconds: 2),
            headerAnimationDuration: const Duration(seconds: 1),
            progressStyle: const TextStyle(color: Colors.white, fontSize: 20),
            controlBuilder: (onNext, onBack) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: onBack,
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  IconButton(
                      onPressed: onNext,
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                ],
              );
            },
            onStepChanged: (page) {
              print('active page = $page');
            },
            steps: [
              AwesomeStepperItem(
                  label: 'Step 1',
                  content: Container(
                    alignment: Alignment.center,
                    child: const Text('Step 1'),
                  )),
              AwesomeStepperItem(
                  label: 'Step 2',
                  content: Container(
                    alignment: Alignment.center,
                    child: const Text('Step 2'),
                  )),
               AwesomeStepperItem(
                  label: 'Step 3',
                  content: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(Icons.person),
            suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.cyanAccent),
            ),
            label: Text("email"),
            hintText: "tyep here",))),
              
            ],
          );
  }

  Stepper flutterStepper() {
    return Stepper(
        steps: _myStep,
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
        });
  }

  funksiya(GlobalKey<FormState> _key) {
    if (_key.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
