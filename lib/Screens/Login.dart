import 'package:flutter/material.dart';
import 'package:rinse/Screens/VerifyMobileNumber.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: MediaQuery.of(context).size.shortestSide * 0.1, top: MediaQuery.of(context).size.shortestSide * 0.4),
                    child: Text(
                      "Enter Your \nMobile Number",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: '+91',
                                style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.primary),
                                enabled: false,
                              )),
                          Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value != '') {
                                        if (value!.length == 10) {
                                          phoneNumber = value;
                                        } else {
                                          return "Please enter a valid 10 digit mobile number";
                                        }
                                      } else {
                                        return "Please enter your mobile number";
                                      }
                                    },
                                    style: TextStyle(fontSize: 25)),
                              ))
                        ],
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.shortestSide * 0.1),
                      child: FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyMobileNumber(
                                      phoneNumber: phoneNumber,
                                    )));
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/LoginBackground.png'), fit: BoxFit.cover))),
      ),
    );
  }
}
