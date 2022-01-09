import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rinse/Screens/Login.dart';
import 'package:rinse/Screens/Welcome.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset("assets/images/PersonProfile.png"),
        ),
        leadingWidth: MediaQuery.of(context).size.width*0.2,
        title: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Text("My Profile"),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Theme.of(context).colorScheme.primary),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight*2),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<User?>(
                    builder: (context, user, c) {
                      if (user == null) {
                        Future.microtask(() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Welcome()), (route) => false));
                        return Container();
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(text: TextSpan(children: [
                                TextSpan(text: user.displayName, style: TextStyle(
                                    fontSize: 25,
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w600
                                ),),
                                WidgetSpan(child: GestureDetector(onTap: (){},child: Icon(Icons.edit)))
                              ]),),
                              Text('${user.email} | ${user.phoneNumber}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                        ),
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1 , left: 40, right: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 12 , bottom: 12),
                          child: Text('Manage Addresses',
                          style: TextStyle(
                            fontSize: 17,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90.0),
                          child: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).colorScheme.secondary,),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
                    child: FloatingActionButton.extended(
                      heroTag: "LogoutFloatingActionButton",
                      onPressed: () => context.read<FirebaseAuth>().signOut(),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w900),
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
