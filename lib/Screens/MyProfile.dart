import 'package:flutter/material.dart';


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
        title: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Text("My Profile"),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(40))),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight*2),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(text: TextSpan(children: [
                    TextSpan(text: "Pratit Todkar", style: TextStyle(
                        fontSize: 30,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w800
                    ),),
                    WidgetSpan(child: GestureDetector(onTap: (){},child: Icon(Icons.edit)))
                  ]),
                  ),
                  Text('pratittodkar@gmail.com | 7738472965',
                  style: TextStyle(
                    color: Color.fromRGBO(31, 68, 68, 1),
                    fontWeight: FontWeight.w800,
                  ),),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                        ),
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2 , left: 40, right: 40),
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
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
                    child: FloatingActionButton.extended(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyProfile())),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
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
