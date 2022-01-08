import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rinse/Screens/NavBarBody.dart';

import 'MyProfile.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late String _firstName;
  late String _lastName;
  late String _emailAddress;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.08,
                    horizontal: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          elevation: 3,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value != '' && value != null) {
                                _firstName = value;
                              } else {
                                return "Please enter your first name";
                              }
                            },
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          elevation: 3,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value != '' && value != null) {
                                _lastName = value;
                              } else {
                                return "Please enter your last name";
                              }
                            },
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          elevation: 3,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value != '' && value != null && value.contains("@")) {
                                _emailAddress = value;
                              } else {
                                return "Please enter a valid email address";
                              }
                            },
                          ),
                        )
                      ],
                    )),
              ),
              Consumer<User?>(
                  builder: (context, user, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 70),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            user!.updateDisplayName("$_firstName $_lastName");
                            user.updateEmail(_emailAddress);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => NavBarBody()));
                          }
                        },
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'PROCEED',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
