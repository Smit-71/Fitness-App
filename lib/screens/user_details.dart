import 'package:animated_button/animated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fitness/screens/navbar_tab.dart';
import 'package:flutter_fitness/widget/age_card.dart';
import 'package:flutter_fitness/widget/goal_card.dart';
import 'package:flutter_fitness/widget/height_card.dart';
import 'package:flutter_fitness/widget/info_card.dart';
import 'package:flutter_fitness/widget/weight_card.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetail extends StatefulWidget {
  static const routeName = '/user-detail-screen';

  @override
  State<UserDetail> createState() => _UserDetailState();
}

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

class _UserDetailState extends State<UserDetail> {
  int currentPos = 0;
  final List<dynamic> _items = [
    InfoCard(),
    AgeCard(),
    HeightCard(),
    WeightCard(),
    GoalCard(),
  ];
  final List<String> _title = [
    'Complete setup and start tracking',
    'How old are you?',
    'How tall are you?',
    'What’s your weight?',
    'What’s your goal?',
  ];
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffC7EBF9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height - MediaQuery.of(context).padding.top,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Container(
                    height: size.width * 0.2,
                    child: Image.asset("assets/sign_in_icon1.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.width * 0.2,
                        child: Text(
                          _title[currentPos],
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.07,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: _items.length,
                            itemBuilder: (context, index, realIndex) {
                              return _items[index];
                            },
                            carouselController: _controller,
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentPos = index;
                                });
                              },
                              enlargeCenterPage: true,
                              aspectRatio: 9 / 11,
                              viewportFraction: 0.85,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _items.map((url) {
                              int index = _items.indexOf(url);
                              return Container(
                                width: 25,
                                height: 2.5,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  color: currentPos == index
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Align(
                        child: AnimatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              Transition(NavbarTab()),
                              ModalRoute.withName('/sign-in-screen'),
                            );
                          },
                          enabled: true,
                          shadowDegree: ShadowDegree.light,
                          child: Text(
                            "Done",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
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
      ),
    );
  }
}
