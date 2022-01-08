import 'package:flutter/material.dart';

import 'MyProfile.dart';

class PressingPricing extends StatelessWidget {
  const PressingPricing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
              ),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/PressingPricing.png',
                    scale: 0.9,
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 1,
                    indent: MediaQuery.of(context).size.width * 0.01,
                    endIndent: MediaQuery.of(context).size.width * 0.01,
                    height: 20,
                  ),
                  Text(
                    'Prices (Per Pc)',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.23,
                          child: Card(
                            elevation: 1,
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.only(top: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Scrollbar(
                              child: ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 8),
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                        children: [
                                          Text('3 Piece Suit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                          Text('250', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Image.asset('assets/images/Boy.png', scale: 1.2,),
                      ],
                    ),
                  ),
                  Text("Select items you wish to add in your laundry", style: TextStyle(color: Colors.grey),),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.23,
                          child: Card(
                            elevation: 1,
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.only(top: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Scrollbar(
                              child: ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 8),
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text('3 Piece Suit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                          Text('250', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Image.asset('assets/images/Girl.png', scale: 1.2,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton.extended(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyProfile())),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'BOOK NOW',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
