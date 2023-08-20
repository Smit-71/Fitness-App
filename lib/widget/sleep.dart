import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sleep extends StatefulWidget {
  @override
  State<Sleep> createState() => _SleepState();
}

const double todayAlign = -1;
const double weekAlign = 0;
const double monthAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.blue;

class _SleepState extends State<Sleep> {
  late double xAlign;
  late Color todayColor;
  late Color weekColor;
  late Color monthColor;

  @override
  void initState() {
    xAlign = todayAlign;
    todayColor = selectedColor;
    weekColor = normalColor;
    monthColor = normalColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double height = size.height * 0.05;
    late double width = size.width * 0.6;
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xff0178B8),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        "Sleep",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        color: Color(0xffC7EBF9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          AnimatedAlign(
                            alignment: Alignment(xAlign, 0),
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              width: width * 0.5,
                              height: height,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                xAlign = todayAlign;
                                todayColor = selectedColor;
                                monthColor = normalColor;
                                weekColor = normalColor;
                              });
                            },
                            child: Align(
                              alignment: Alignment(-1, 0),
                              child: Container(
                                width: width * 0.5,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  'Today',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    color: todayColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                xAlign = weekAlign;
                                weekColor = selectedColor;
                                monthColor = normalColor;
                                todayColor = normalColor;
                              });
                            },
                            child: Align(
                              alignment: Alignment(0, 0),
                              child: Container(
                                width: width * 0.5,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  'Week',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    color: weekColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                xAlign = monthAlign;
                                monthColor = selectedColor;
                                weekColor = normalColor;
                                todayColor = normalColor;
                              });
                            },
                            child: Align(
                              alignment: Alignment(1, 0),
                              child: Container(
                                width: width * 0.5,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  'Month',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    color: monthColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.05,
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Today",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            height: size.height * 0.1,
                            width: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff444545),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(size.width * 0.05),
                                child: Image.asset("assets/white_moon.png"),
                              ),
                            ),
                          ),
                          Text(
                            "7h 20m",
                            style: GoogleFonts.nunito(
                              fontSize: size.width * 0.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: size.height * 0.12,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/light_blue.png"),
                              ),
                            ),
                            foregroundDecoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/dark_blue.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.27,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Duration",
                                    style: GoogleFonts.nunito(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "4h 58min",
                                    style: GoogleFonts.nunito(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.27,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Noise Level",
                                    style: GoogleFonts.nunito(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "56db",
                                    style: GoogleFonts.nunito(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.27,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Quality",
                                    style: GoogleFonts.nunito(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "76%",
                                    style: GoogleFonts.nunito(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold,
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
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
