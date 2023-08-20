import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/slider_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash-screen';

  @override
  State<Splash> createState() => _SplashState();
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget splash;

  SlideTransitionAnimation(this.splash)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => splash,
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.bounceOut, parent: animation);
            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation),
              textDirection: TextDirection.rtl,
              child: splash,
            );
          },
        );
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(SliderScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffC7EBF9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: (size.height - MediaQuery.of(context).padding.top) * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "HMS همس",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.1,
                            ),
                          ),
                          Text(
                            "A WHISPER OF CARE",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.045,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: size.width * 0.2,
                        child: Image.asset("assets/sign_in_icon1.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (size.height - MediaQuery.of(context).padding.top) * 0.5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: size.height * 0.5,
                  child: Image.asset("assets/sign_in_icon1.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
