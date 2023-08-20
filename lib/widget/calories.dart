import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calories extends StatefulWidget {
  const Calories({Key? key}) : super(key: key);

  @override
  State<Calories> createState() => _CaloriesState();
}

const double todayAlign = -1;
const double weekAlign = 0;
const double monthAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.blue;

class HalfBorderCircularContainer extends StatelessWidget {
  const HalfBorderCircularContainer({
    Key? key,
    required this.size,
    required this.borderThickness,
    required this.borderColor,
    required this.backgroundColor,
  }) : super(key: key);

  final Size size;
  final double borderThickness;
  final Color borderColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size.width * 0.4, size.width * 0.4),
      painter: HalfBorderPainter(
        borderThickness: borderThickness,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
      ),
      child: Container(
        width: size.width * 0.55,
        height: size.width * 0.55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Container(
          height: size.width * 0.4,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              width: 13,
              color: Color(0xffC7EBF9),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "112",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.07,
                    ),
                  ),
                  Text(
                    " kcpl",
                    style: GoogleFonts.nunito(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/calories.png",
                    height: size.width * 0.06,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "86",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.07,
                    ),
                  ),
                  Text(
                    " BPM",
                    style: GoogleFonts.nunito(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                    ),
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

class HalfBorderPainter extends CustomPainter {
  final double borderThickness;
  final Color borderColor;
  final Color backgroundColor;

  HalfBorderPainter({
    required this.borderThickness,
    required this.borderColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThickness;

    final radius = size.width * 0.5;

    final path = Path()
      ..moveTo(radius, 0)
      ..arcToPoint(
        Offset(radius, size.width),
        radius: Radius.circular(radius),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _CaloriesState extends State<Calories> {
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
                        "Calories",
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
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        HalfBorderCircularContainer(
                          size: size,
                          borderThickness: 13,
                          borderColor: Colors.green,
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                    child: Center(
                      child: Text(
                        "15 March 2023 at 5:16 pm",
                        style: GoogleFonts.nunito(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
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
                            width: size.width * 0.43,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.08),
                                    child: Text(
                                      "Running",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/step.png",
                                        height: size.height * 0.035,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "37%",
                                        style: GoogleFonts.nunito(
                                          fontSize: size.width * 0.06,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
                            width: size.width * 0.43,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.08),
                                    child: Text(
                                      "Walking",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/step.png",
                                        height: size.height * 0.035,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "63%",
                                        style: GoogleFonts.nunito(
                                          fontSize: size.width * 0.06,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
