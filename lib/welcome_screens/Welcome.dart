import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(242, 169, 184, 1),
      body: Center(
        child: Image.asset("assets/images/TYRE.png",height: 300,)
      ),
    );
  }
}
