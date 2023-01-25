import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

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


  Widget loginWithGoogle(){
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white
      ),

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(FontAwesomeIcons.google),
              SizedBox(width: 20,),
              Text("Sign In with Google"),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginWithHiveSigner(){
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffe31337)
      ),

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/hivesigner.png', gaplessPlayback: true, width: 18,),
              const SizedBox(width: 20,),
              const Text("Login with HiveSigner", style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginWithUnstoppable(){

    void getHttp() async {
      try {
        var response = await Dio().post('http://localhost:2017/login');
        print(response);
      } catch (e) {
        print(e);
      }
    }

    return GestureDetector(
    onTap: (){
      (getHttp());
    },
        child: Container(

      decoration: const BoxDecoration(
          color: Color(0xff0D66FE)
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/unstoppable.png', gaplessPlayback: true, width: 25,),
              const SizedBox(width: 20,),
              const Text("Login with Unstoppable", style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Container(color: Colors.blue, )),
        Expanded(flex: 2,child: Container(color: Color(0xff191919),
        child: Row(
          children: [
            Expanded(flex: 1,child: Container()),
            Expanded(flex: 2,child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginWithGoogle(),
                  SizedBox(height: 10,),
                  loginWithHiveSigner(),
                  SizedBox(height: 10,),
                  loginWithUnstoppable()

                ],
              ),
            )),
            Expanded(flex: 1,child: Container()),
          ],
        ),
        )),
      ],
    );
  }
}



