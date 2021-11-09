import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(
      initialPage: 1,
      //viewportFraction: 0.4,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                      ),
                      hintText: 'Search Here',
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.14, vertical: 15),
                child: Text('Get Started!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w800
                ),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.14),
                child: Text('Choose the cleaning service service you are interested in today !',),
              ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.14, top: MediaQuery.of(context).size.height*0.1),
                child: Text('Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
                ),),
              ),
              Container(
                 height: MediaQuery.of(context).size.height*0.17,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Card(
                          elevation: 5,
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.1,
                            width: MediaQuery.of(context).size.width*0.4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/cleaning.png'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.3,
                                child: Text('Cleaning & Pressing',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Card(
                          elevation: 5,
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.1,
                            width: MediaQuery.of(context).size.width*0.4,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/pressing.png'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.3,
                                child: Text('Pressing',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ],

                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.14,vertical: 10),
                child: Row(
                  children: [
                    Text('Promotions',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                    ),),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.17,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      color: Colors.redAccent,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(text: TextSpan(children: [
                                TextSpan(text: "Get "),
                                TextSpan(text: "40% OFF\n",style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                )),
                                TextSpan(text: "on Cleaning & Pressing\n",style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                )),
                                TextSpan(text: "CODE: CNPS40",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,)),
                              ], style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              )),),
                              Image.asset('assets/images/Asset 46.png')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.redAccent,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(text: TextSpan(children: [
                                TextSpan(text: "Get "),
                                TextSpan(text: "40% OFF\n",style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                )),
                                TextSpan(text: "on Cleaning & Pressing\n",style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                )),
                                TextSpan(text: "CODE: CNPS40",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,)),
                              ], style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              )),),
                              Image.asset('assets/images/Asset 46.png')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],

          ),

        ],
      ),
    );
  }
}
