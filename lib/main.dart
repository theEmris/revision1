import 'package:flutter/material.dart';
//import 'package:revision1/screens/rev4/kalendarpackage.dart';
//import 'package:revision1/screens/rev4/steplar.dart';
//import 'package:revision1/screens/rev5/home5.dart';
//import 'package:revision1/screens/rev4/home4.dart';
//import 'package:revision1/screens/rev3/home3.dart';
// import 'package:revision1/screens/rev1/home.dart';
// import 'package:revision1/screens/rev1/pages/a_page.dart';
// import 'package:revision1/screens/rev1/pages/b_page.dart';
// import 'package:revision1/screens/rev1//pages/error_page.dart';
//import 'package:revision1/screens/rev2/home2.dart';
//import 'package:revision1/screens/rev4/home4.dart';
import 'package:revision1/screens/rev4/stepperPackage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //   '/':(context) => HomePage1(),
      //   '/Asahifa': (context) => Apage(title: "A page",),
      //   '/Bsahifa':(context)=> Bpage(title: "B page",)
      // },
      // initialRoute: '/',
      // onUnknownRoute:
      //  (settings)=> MaterialPageRoute(builder: 
      //  (context)=>Erorpage()),

      home: StepperPackage(),
    );
  }
}

