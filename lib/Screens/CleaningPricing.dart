import 'package:flutter/material.dart';

class CleaningPricing extends StatelessWidget {
  const CleaningPricing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Asset 46.png'),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(
                'Cleaning & Pressing',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
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
                children: [
                  Card(

                  ),
                  Image.asset('assets/images/boy.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
