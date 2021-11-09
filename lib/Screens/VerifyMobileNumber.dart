import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:rinse/Screens/CreateAccount.dart';

class VerifyMobileNumber extends StatefulWidget {
  const VerifyMobileNumber({Key? key}) : super(key: key);

  @override
  _VerifyMobileNumberState createState() => _VerifyMobileNumberState();
}

class _VerifyMobileNumberState extends State<VerifyMobileNumber> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  bool processing = false;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
              blurRadius: 5, color: Colors.grey[200]!, offset: Offset(0, 5))
        ],
        color: Colors.grey[100]!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verify Mobile Number',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2,
                    vertical: 10),
                child: Text(
                  'Please enter the 4 digit SMS verification code we sent to your mobile number.',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: PinPut(
                  fieldsCount: 4,
                  onSubmit: (String pin) => _confirmCode(pin, context),
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration,
                  selectedFieldDecoration: _pinPutDecoration.copyWith(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue)),
                  followingFieldDecoration: _pinPutDecoration,
                  fieldsAlignment: MainAxisAlignment.center,
                  eachFieldMargin: EdgeInsets.all(5),
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: FloatingActionButton.extended(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateAccount())),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Verify Account',
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ),
                  backgroundColor: Colors.redAccent,
                ),
              ),
              Text('Did not receive the code?',
              style: TextStyle(
                color: Colors.grey
              ),),
              GestureDetector(onTap: () {} ,child:
                Text('Resend SMS', style: TextStyle(
                  color: Colors.redAccent
                ),))
            ],
          ),
        ));
  }

  void _confirmCode(String pin, BuildContext context) {
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        'Pin Submitted. Value: $pin',
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
