import 'package:flutter/material.dart';
import 'package:flutter_fitness/model/chart_data.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Steps extends StatefulWidget {
  @override
  State<Steps> createState() => _StepsState();
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
        width: size.width * 0.4,
        height: size.width * 0.4,
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
              width: 10,
              color: Color(0xffC7EBF9),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/image4.png",
                height: size.width * 0.08,
              ),
              SizedBox(height: 10),
              Text(
                "3112",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.08,
                ),
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

class _StepsState extends State<Steps> {
  late double xAlign;
  late Color todayColor;
  late Color weekColor;
  late Color monthColor;
  late List<ChartData> data;

  @override
  void initState() {
    xAlign = todayAlign;
    todayColor = selectedColor;
    weekColor = normalColor;
    monthColor = normalColor;
    data = [
      ChartData(10, 21500),
      ChartData(11, 22684),
      ChartData(12, 21643),
      ChartData(13, 23520),
      ChartData(14, 22883),
      ChartData(15, 23150),
      ChartData(16, 21800),
      ChartData(17, 23120),
      ChartData(18, 22635),
      ChartData(19, 22721),
      ChartData(20, 21220),
    ];
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
                        "Steps",
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
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HalfBorderCircularContainer(
                                size: size,
                                borderThickness: 13,
                                borderColor: Colors.green,
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: size.width * 0.1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Distance",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "1.9",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.07,
                                        ),
                                      ),
                                      Text(
                                        "km",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Calories",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "112",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.07,
                                        ),
                                      ),
                                      Text(
                                        "kcpl",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: size.height * 0.15,
                            child: SfCartesianChart(
                              margin: EdgeInsets.all(0),
                              borderWidth: 0,
                              backgroundColor: Colors.transparent,
                              plotAreaBorderWidth: 0,
                              primaryXAxis: NumericAxis(
                                minimum: 10,
                                maximum: 20,
                                interval: 1,
                                isVisible: false,
                                axisLine: AxisLine(color: Color(0xff58C5FF)),
                                majorGridLines: MajorGridLines(width: 0),
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                              ),
                              primaryYAxis: NumericAxis(
                                minimum: 19000,
                                maximum: 24000,
                                interval: 1000,
                                isVisible: false,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                              ),
                              series: <ChartSeries<ChartData, int>>[
                                SplineAreaSeries(
                                  dataSource: data,
                                  xValueMapper: (ChartData data, _) => data.a,
                                  yValueMapper: (ChartData data, _) => data.b,
                                  splineType: SplineType.natural,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff58C5FF),
                                      Color.fromRGBO(255, 255, 255, 0),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                SplineSeries(
                                  dataSource: data,
                                  color: Color(0xff0178b8),
                                  width: 3,
                                  xValueMapper: (ChartData data, _) => data.a,
                                  yValueMapper: (ChartData data, _) => data.b,
                                ),
                              ],
                            ),
                          ),
                        ],
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
                                      "Total",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/image4.png",
                                        height: size.height * 0.035,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "32,441",
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
                                      "Average",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/image4.png",
                                        height: size.height * 0.035,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "4.532",
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
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
