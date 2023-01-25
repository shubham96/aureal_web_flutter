// import 'dart:js';

 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
// import 'package:webview_flutter/webview_flutter.dart';

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

  Widget loginWithHiveSigner(BuildContext context){
    return GestureDetector(
      onTap: ()async{
        // await showDialog(context: context, builder: (context){
        //   // return Dialog(
        //   //   child: WebView(
        //   //     // gestureRecognizers: Set()
        //   //     //   ..add(
        //   //     //     Factory<VerticalDragGestureRecognizer>(
        //   //     //           () => VerticalDragGestureRecognizer(),
        //   //     //     ), // or null
        //   //     //   ),
        //   //     javascriptMode: JavascriptMode.unrestricted,
        //   //     initialUrl:
        //   //     'https://hivesigner.com/oauth2/authorize?client_id=aureal&redirect_uri=%3Dhttp%253A%252F%252Flocalhost%253A3000%26&response_type=code&scope=offline,comment,vote,comment_option,custom_json',
        //   //     onPageStarted: (url) async {
        //   //       SharedPreferences prefs =
        //   //       await SharedPreferences.getInstance();
        //   //
        //   //       var uri = Uri.parse(url.toString());
        //   //       uri.queryParameters.forEach((key, value) {
        //   //         if (key == 'access_token' ||
        //   //             key == 'username' ||
        //   //             key == 'code') {
        //   //           if (key == 'username' &&
        //   //               prefs.getString('access_token') != null &&
        //   //               prefs.getString('code') != null) {
        //   //             prefs.setString('HiveUserName', value);
        //   //
        //   //             print(prefs.getString('code'));
        //   //
        //   //
        //   //           } else {
        //   //             prefs.setString('$key', value);
        //   //           }
        //   //
        //   //           print(prefs.getString(key));
        //   //           if (prefs.getString('code') != null) {
        //   //             print(
        //   //                 'this is the code motherfucker: ${prefs.getString('code')}');
        //   //           }
        //   //           // hiveAuth();
        //   //         }
        //   //       });
        //   //     },
        //   //   ),
        //   // );
        //   return Container();
        // });
        final result = await FlutterWebAuth.authenticate(url: "https://hivesigner.com/oauth2/authorize?client_id=aureal&redirect_uri=%3Dhttp%253A%252F%252Flocalhost%253A3000%26&response_type=code&scope=offline,comment,vote,comment_option,custom_json", callbackUrlScheme: "hivesigner");
        print(result);
      },
      child: Container(
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
      ),
    );
  }

  Widget loginWithUnstoppable(){

    void getHttp() async {

      Dio dio = Dio();
      CancelToken cancel = CancelToken();

      try {
        var response = await dio.post('http://localhost:2017/login', cancelToken: cancel);
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
        Expanded(flex: 3,child: Container(decoration: BoxDecoration(image: DecorationImage(image: Image.asset('assets/backgroundlogin.png').image, fit: BoxFit.cover)), )),
        Expanded(flex: 2,child: Container(color: Colors.black,
        child: Row(
          children: [
            Expanded(flex: 1,child: Container()),
            Expanded(flex: 2,child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginWithGoogle(),
                  SizedBox(height: 10,),
                  loginWithHiveSigner(context),
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



