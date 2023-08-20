import 'package:flutter/material.dart';
import 'package:flutter_fitness/model/chart_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Oxygen extends StatefulWidget {
  @override
  State<Oxygen> createState() => _OxygenState();
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
              Image.asset(
                "assets/oxygen.png",
                height: size.width * 0.06,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: size.width * 0.07,
                    ),
                  ),
                  Text(
                    "97",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.07,
                    ),
                  ),
                  Text(
                    " %SpO2",
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

class _OxygenState extends State<Oxygen> {
  late List<ChartData> oxygen;

  @override
  void initState() {
    oxygen = [
      ChartData(10, 23500),
      ChartData(11, 23684),
      ChartData(12, 23143),
      ChartData(13, 23320),
      ChartData(14, 23883),
      ChartData(15, 23150),
      ChartData(16, 23800),
      ChartData(17, 23320),
      ChartData(18, 23735),
      ChartData(19, 23221),
      ChartData(20, 23520),
      ChartData(21, 23783),
      ChartData(22, 23450),
      ChartData(23, 23200),
      ChartData(24, 23620),
      ChartData(25, 23835),
      ChartData(26, 23921),
      ChartData(27, 23620),
      ChartData(28, 23521),
      ChartData(29, 23320),
      ChartData(30, 23883),
      ChartData(31, 23550),
      ChartData(32, 23800),
      ChartData(33, 23320),
      ChartData(34, 23535),
      ChartData(35, 23220),
      ChartData(36, 23520),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        "Oxygen",
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
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Container(
                      width: size.width * 0.55,
                      height: size.height * 0.2,
                      child: SfCartesianChart(
                        margin: EdgeInsets.all(0),
                        borderWidth: 0,
                        backgroundColor: Colors.transparent,
                        plotAreaBorderWidth: 0,
                        primaryXAxis: NumericAxis(
                          minimum: 10,
                          maximum: 36,
                          interval: 1,
                          isVisible: false,
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
                            dataSource: oxygen,
                            xValueMapper: (ChartData data, _) => data.a,
                            yValueMapper: (ChartData data, _) => data.b,
                            splineType: SplineType.monotonic,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff0074BE),
                                Color.fromRGBO(255, 255, 255, 0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
