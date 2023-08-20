import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class Transition extends PageRouteBuilder {
  final Widget page;

  Transition(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 800),
            reverseTransitionDuration: Duration(milliseconds: 800),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.center,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            });
}

class RequestSend extends StatelessWidget {
  static const routeName = '/request-screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffC7EBF9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// top Container
              Container(
                alignment: Alignment.topCenter,
                height: size.height * 0.66,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "HMS همس",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.07,
                                  ),
                                ),
                                Text(
                                  "A WHISPER OF CARE",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.03,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: size.width * 0.12,
                              child: Image.asset("assets/sign_in_icon1.png"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Request Sent",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07,
                              ),
                            ),
                            Text(
                              "Your request has been successfully submitted.\nPlease check associated email address.",
                              style: GoogleFonts.nunito(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// bottom Container
              SizedBox(
                height: size.height * 0.3,
                width: size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.35,
                        top: size.height * 0.02,
                        bottom: size.height * 0.02,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/sign_in_icon1.png"),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Back to Login",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    Transition(SignIn()),
                                    ModalRoute.withName('/splash-screen'),
                                  );
                                },
                                child: Text(
                                  "SIGN IN",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.05,
                                    color: Color(0xff0178b8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
