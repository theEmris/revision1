import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _formKEy2 = GlobalKey<FormState>();
  final _parolController = TextEditingController();
  String parol = "Parol";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.pink.shade200),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                email(),
                Paroll(),
                singnUp(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Form Paroll() {
    return Form(
                
                key: _formKEy2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    obscureText: true,
                    controller: _parolController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.edit),
                        suffixIcon: Icon(Icons.health_and_safety),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        hintText: "type here",
                        labelText: "password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this form";
                      }
                      if (value != parol) {
                        return "Noto'g'ri xufya soz";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              );
  }

  ElevatedButton singnUp() {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            debugPrint("${_nameController}");
          }
          if (_formKEy2.currentState!.validate()) {
            debugPrint("${_parolController}");
          }
        },
        child: Text("Sign Up"));
  }

  Form email() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "Email",
              hintText: "Type here...",
              icon: Icon(Icons.add),
              suffixIcon: Icon(Icons.favorite),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.green)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
          validator: (val) {
            if (!RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                .hasMatch(val!)) {
              return "Eamil kiriting faqat";
            }
          },
        ),
      ),
    );
  }
}
