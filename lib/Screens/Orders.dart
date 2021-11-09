import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Text("My Orders"),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('No Orders Found',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),

    ),
    );
  }
}
