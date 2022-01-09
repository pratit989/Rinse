import 'package:flutter/material.dart';
import 'package:rinse/Screens/Login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late Image backgroundImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backgroundImage = Image.asset("assets/images/Welcome.png");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        backgroundImage,
        Container(
          height: MediaQuery.of(context).size.height*0.4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton.extended(
                  heroTag: "CustomerLogin",
                  elevation: 0,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
                  label: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "Customer",
                        textAlign: TextAlign.center,
                      )),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton.extended(
                  heroTag: "WorkerLogin",
                  elevation: 0,
                  onPressed: () {},
                  label: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "Worker",
                        textAlign: TextAlign.center,
                      )),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton.extended(
                  heroTag: "AdminLogin",
                  elevation: 0,
                  onPressed: () {},
                  label: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "Admin",
                        textAlign: TextAlign.center,
                      )),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
