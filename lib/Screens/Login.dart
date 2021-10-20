import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide*0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.shortestSide*0.1),
                child: Text("Enter Your Mobile Number",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.longestSide*0.05,
                    fontWeight: FontWeight.w500,
                  ),
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
                            style: TextStyle(fontSize: 30),
                            enabled: false,

                          )),
                      Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) => value!='' ? value!.length == 10 ? null : "Please enter a valid 10 digit mobile number" : "Please enter your mobile number",
                                style:
                                TextStyle(fontSize: 30)),
                          ))
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.shortestSide*0.1),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                  backgroundColor: Colors.pink,
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/LoginBackground.png'), fit: BoxFit.cover)
        ),
      ),
    );
  }
}
