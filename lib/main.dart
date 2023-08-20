import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fitness/screens/dashboard.dart';
import 'package:flutter_fitness/screens/forgot_password.dart';
import 'package:flutter_fitness/screens/request_send.dart';
import 'package:flutter_fitness/screens/sign_in.dart';
import 'package:flutter_fitness/screens/sign_up.dart';
import 'package:flutter_fitness/screens/slider_screen.dart';
import 'package:flutter_fitness/screens/splash.dart';
import 'package:flutter_fitness/screens/user_details.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Splash(),
      routes: {
        Splash.routeName: (context) => Splash(),
        SignUp.routeName: (context) => SignUp(),
        SignIn.routeName: (context) => SignIn(),
        Dashboard.routeName: (context) => Dashboard(),
        UserDetail.routeName: (context) => UserDetail(),
        ForgotPassword.routeName: (context) => ForgotPassword(),
        SliderScreen.routeName: (context) => SliderScreen(),
        RequestSend.routeName: (context) => RequestSend(),
      },
    );
  }
}
