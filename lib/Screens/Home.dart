import 'package:flutter/material.dart';
import 'package:rinse/Screens/CleaningPricing.dart';
import 'package:rinse/Screens/PressingPricing.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: 15),
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)
                //     ),
                //     child: TextFormField(
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //         contentPadding: EdgeInsets.all(15),
                //         prefixIcon: Icon(
                //           Icons.search,
                //           color: Colors.grey[400],
                //         ),
                //         hintText: 'Search Here',
                //         hintStyle: TextStyle(
                //             color: Colors.grey[400],
                //             fontWeight: FontWeight.w600,
                //             fontSize: 15),
                //         border: InputBorder.none
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight * 2),
                  child: Text(
                    'Get Started!',
                    style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: kToolbarHeight),
                  child: Text(
                    'Choose the cleaning service service you are interested in today !',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CleaningPricing())),
                            child: Image.asset('assets/images/CleaningPressing.png', height: MediaQuery.of(context).size.height*0.22,),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressingPricing())),
                            child: Image.asset('assets/images/Pressing.png', height: MediaQuery.of(context).size.height*0.22),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.14,vertical: 10),
                //   child: Row(
                //     children: [
                //       Text('Promotions',
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w800
                //       ),),
                //     ],
                //   ),
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height*0.17,
                //   child: PageView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       Card(
                //         color: Colors.redAccent,
                //         margin: EdgeInsets.symmetric(horizontal: 20),
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                //         clipBehavior: Clip.antiAlias,
                //         child: Padding(
                //           padding: const EdgeInsets.all(20.0),
                //           child: Container(
                //
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 RichText(text: TextSpan(children: [
                //                   TextSpan(text: "Get "),
                //                   TextSpan(text: "40% OFF\n",style: TextStyle(
                //                     fontWeight: FontWeight.w900,
                //                     fontSize: 20,
                //                   )),
                //                   TextSpan(text: "on Cleaning & Pressing\n",style: TextStyle(
                //                     fontWeight: FontWeight.w600,
                //                     fontSize: 17,
                //                   )),
                //                   TextSpan(text: "CODE: CNPS40",style: TextStyle(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: 15,)),
                //                 ], style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 20,
                //                 )),),
                //                 Image.asset('assets/images/Asset 46.png')
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Card(
                //         color: Colors.redAccent,
                //         margin: EdgeInsets.symmetric(horizontal: 20),
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                //         clipBehavior: Clip.antiAlias,
                //         child: Padding(
                //           padding: const EdgeInsets.all(20.0),
                //           child: Container(
                //
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 RichText(text: TextSpan(children: [
                //                   TextSpan(text: "Get "),
                //                   TextSpan(text: "40% OFF\n",style: TextStyle(
                //                     fontWeight: FontWeight.w900,
                //                     fontSize: 20,
                //                   )),
                //                   TextSpan(text: "on Cleaning & Pressing\n",style: TextStyle(
                //                     fontWeight: FontWeight.w600,
                //                     fontSize: 17,
                //                   )),
                //                   TextSpan(text: "CODE: CNPS40",style: TextStyle(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: 15,)),
                //                 ], style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 20,
                //                 )),),
                //                 Image.asset('assets/images/Asset 46.png')
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
