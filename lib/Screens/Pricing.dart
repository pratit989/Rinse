import 'package:flutter/material.dart';

import 'CleaningPricing.dart';
import 'PressingPricing.dart';
class Pricing extends StatelessWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Text("Pricing"),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 25, color: Theme.of(context).colorScheme.primary),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
