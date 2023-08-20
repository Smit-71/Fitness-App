import 'package:flutter/material.dart';
import 'package:flutter_fitness/model/workout_details.dart';
import 'package:flutter_fitness/widget/popular_workout.dart';
import 'package:google_fonts/google_fonts.dart';

class Training extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 1.015 -
            MediaQuery.of(context).padding.top -
            kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xffC9EBF8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.05,
              left: size.width * 0.05,
              right: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "TRAINING",
                style: GoogleFonts.nunito(
                  fontSize: size.height * 0.023,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Popular workout for you",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02,
                ),
                child: SizedBox(
                  height: size.height * 0.23,
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      return PopularWorkout(index, size);
                    },
                  ),
                ),
              ),
              Text(
                "Workout Category",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/c1.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Lorem ipsum",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/c2.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Lorem ipsum",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/c3.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Lorem ipsum",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/c4.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: size.width * 0.43,
                            width: size.width * 0.43,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Lorem ipsum",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
