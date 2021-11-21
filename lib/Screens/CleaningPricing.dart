import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyProfile.dart';

class CleaningPricing extends StatelessWidget {
  const CleaningPricing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
              ),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Asset 46.png',
                      scale: 1.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Text(
                        'Cleaning & Pressing',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: MediaQuery.of(context).size.width * 0.15,
                      endIndent: MediaQuery.of(context).size.width * 0.15,
                      height: 20,
                    ),
                    Text(
                      'Prices (Per Pc)',
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Card(
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.only(top: 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 38.0),
                                child: Scrollbar(
                                  child: ListView.builder(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 8),
                                      itemCount: 10,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('3 Piece Suit'),
                                                Text('250'),
                                              ],
                                            ),
                                            Divider(
                                              height: 20,
                                              thickness: 2,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Image.asset('assets/images/boy.png'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Card(
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.only(top: 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 38.0),
                                child: Scrollbar(
                                  child: ListView.builder(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 8),
                                      itemCount: 10,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('3 Piece Suit'),
                                                Text('250'),
                                              ],
                                            ),
                                            Divider(
                                              height: 20,
                                              thickness: 2,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Image.asset('assets/images/girl.png'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05),
                      child: FloatingActionButton.extended(
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyProfile())),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'BOOK NOW',
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
      ),
    );
  }
}
