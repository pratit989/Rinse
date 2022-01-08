import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:rinse/Screens/CreateAccount.dart';
import 'package:rinse/Screens/NavBarBody.dart';

class VerifyMobileNumber extends StatefulWidget {
  final String phoneNumber;

  const VerifyMobileNumber({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _VerifyMobileNumberState createState() => _VerifyMobileNumberState();
}

class _VerifyMobileNumberState extends State<VerifyMobileNumber> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  bool processing = false;
  late String verificationCode;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        border: Border.all(color: Colors.black12),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[200]!, offset: Offset(0, 5))],
        color: Colors.grey[100]!);
  }

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: '+91' + widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.code);
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) => print("Please Enter Code Manually"));
    super.initState();
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
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2, vertical: 10),
                child: Text(
                  'Please enter the 4 digit SMS verification code we sent to your mobile number.',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: PinPut(
                  autofocus: true,
                  fieldsCount: 6,
                  onSubmit: (String pin) => _confirmCode(pin, context),
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration,
                  selectedFieldDecoration:
                      _pinPutDecoration.copyWith(color: Colors.white, border: Border.all(color: Theme.of(context).colorScheme.primary)),
                  followingFieldDecoration: _pinPutDecoration,
                  fieldsAlignment: MainAxisAlignment.center,
                  eachFieldMargin: EdgeInsets.all(5),
                  textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                'Did not receive the code?',
                style: TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Resend SMS',
                    style: TextStyle(color: Colors.redAccent),
                  ))
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
    FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationCode, smsCode: pin))
        .then((UserCredential userCredential) {
          if (userCredential.user!.displayName != null) {
            return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NavBarBody()), (Route<dynamic> route) => false);
          } else {
            return Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
          }
        })
        .catchError((onError) {
          print(onError);
        })
        .onError((error, stackTrace) => print(error));
  }
}
