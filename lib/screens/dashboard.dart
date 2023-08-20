import 'package:flutter/material.dart';
import 'package:flutter_fitness/model/chart_data.dart';
import 'package:flutter_fitness/widget/calories.dart';
import 'package:flutter_fitness/widget/oxygen.dart';
import 'package:flutter_fitness/widget/sleep.dart';
import 'package:flutter_fitness/widget/steps.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<ChartData> data;
  late List<ChartData> heartRate;

  @override
  void initState() {
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
    heartRate = [
      ChartData(10, 21500),
      ChartData(11, 21684),
      ChartData(12, 21943),
      ChartData(13, 20220),
      ChartData(14, 22883),
      ChartData(15, 23150),
      ChartData(16, 21800),
      ChartData(17, 23120),
      ChartData(18, 22635),
      ChartData(19, 22721),
      ChartData(20, 21220),
      ChartData(21, 22883),
      ChartData(22, 23150),
      ChartData(23, 21800),
      ChartData(24, 23120),
      ChartData(25, 22635),
      ChartData(26, 22721),
      ChartData(27, 21220),
      ChartData(28, 22721),
      ChartData(29, 21220),
      ChartData(30, 22883),
      ChartData(31, 23150),
      ChartData(32, 21800),
      ChartData(33, 23120),
      ChartData(34, 22635),
      ChartData(35, 21620),
      ChartData(36, 21520),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff0178b8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Top Container
            Container(
              alignment: Alignment.topCenter,
              height: size.height * 0.5,
              width: size.width,
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
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: size.width * 0.03,
                    right: size.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "DASHBOARD",
                      style: GoogleFonts.nunito(
                        fontSize: size.height * 0.023,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "GOOD MORNING ",
                          style: GoogleFonts.nunito(
                            fontSize: size.height * 0.018,
                          ),
                        ),
                        Text(
                          "JOHN ADAM",
                          style: GoogleFonts.nunito(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Wrap(
                              children: [
                                Steps(),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image4.png",
                            height: size.height * 0.03,
                            width: size.height * 0.03,
                          ),
                          Text(
                            " 3112",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "still need - 4245 steps",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.04,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                          isVisible: true,
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
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet<dynamic>(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_) {
                                  return Wrap(
                                    children: [
                                      Calories(),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/fire.png",
                                        height: size.height * 0.025,
                                        width: size.height * 0.025,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Calories",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.045,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "112",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.07,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "kcpl",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet<dynamic>(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_) {
                                  return Wrap(
                                    children: [
                                      Sleep(),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: size.width * 0.45,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/moon.png",
                                        height: size.height * 0.025,
                                        width: size.height * 0.025,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Sleep",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.045,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "7.2",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.07,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "h",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.05,
                                        ),
                                      ),
                                    ],
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
            ),

            ///Bottom Container
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffC7EBF9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/heart.png",
                                  height: size.height * 0.02,
                                  width: size.height * 0.02,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Heart Rate",
                                  style: GoogleFonts.nunito(
                                    color: Color(0xff0178b8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "86",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.07,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "BPM",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: size.width * 0.55,
                          height: size.height * 0.09,
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
                                dataSource: heartRate,
                                xValueMapper: (ChartData data, _) => data.a,
                                yValueMapper: (ChartData data, _) => data.b,
                                splineType: SplineType.natural,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffEB5757),
                                    Color.fromRGBO(255, 255, 255, 0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              SplineSeries(
                                dataSource: heartRate,
                                color: Color(0xffEB5757),
                                width: 2,
                                xValueMapper: (ChartData data, _) => data.a,
                                yValueMapper: (ChartData data, _) => data.b,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xffC7EBF9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/blood.png",
                                  height: size.height * 0.02,
                                  width: size.height * 0.02,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Blood Pressure",
                                  style: GoogleFonts.nunito(
                                    color: Color(0xff0178b8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "141/90",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Wrap(
                                children: [
                                  Oxygen(),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: size.width * 0.45,
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xffC7EBF9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/o2.png",
                                    height: size.height * 0.02,
                                    width: size.height * 0.02,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Oxygen",
                                    style: GoogleFonts.nunito(
                                      color: Color(0xff0178b8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "90/60",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "SPo2",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xffC7EBF9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/weight.png",
                                  height: size.height * 0.02,
                                  width: size.height * 0.02,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Weight",
                                  style: GoogleFonts.nunito(
                                    color: Color(0xff0178b8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "72",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.07,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Kg",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xffC7EBF9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/temp.png",
                                  height: size.height * 0.02,
                                  width: size.height * 0.02,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Temperature",
                                  style: GoogleFonts.nunito(
                                    color: Color(0xff0178b8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "38.1 °C",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
