import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(mobile: MobileLogin(), desktop: DesktopLogin(
      ), tablet: TabletLogin(),),
    );
  }
}

class MobileLogin extends StatelessWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(color:Colors.blue),)
      ]
    );
  }
}

class TabletLogin extends StatelessWidget {
  const TabletLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Container(color: Colors.green,)),
        Expanded(flex: 1,child: Container(color: Colors.black,)),
      ],
    );
  }
}

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Container(color: Colors.blue, )),
        Expanded(flex: 1,child: Container(color: Colors.black,)),
      ],
    );
  }
}



