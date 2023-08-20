import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightCard extends StatefulWidget {
  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  double value = 171;
  var _1cm = 0.0328;
  var ft = 171 * 0.0328;
  List<String> listft = [
    "7'ft",
    "6'6''ft",
    "6'ft",
    "5'6''ft",
    "5'ft",
    "4'6''ft",
    "4'ft",
    "3'6''ft",
    "3'ft"
  ];

  List<String> listcm = [
    "214 cm",
    "202 cm",
    "183 cm",
    "171 cm",
    "153 cm",
    "141 cm",
    "122 cm",
    "110 cm",
    "92 cm"
  ];

  @override
  Widget build(BuildContext context) {
    var a = ft.toStringAsFixed(2).split("");
    final double min = 92;
    final double max = 214;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height - MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          color: Color(0xffC7EBF9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              a[0] + "'" + a[2] + " (" + value.toInt().toString() + " cm)",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...listft
                          .map((text) => Text(
                                text,
                                style: GoogleFonts.nunito(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                          .toList(),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: size.height * 0.08,
                    thumbShape: SliderComponentShape.noOverlay,
                    overlayShape: SliderComponentShape.noOverlay,
                    valueIndicatorShape: SliderComponentShape.noOverlay,

                    trackShape: RoundedRectSliderTrackShape(),
                    inactiveTrackColor: Colors.white,

                    /// ticks in between
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                  ),
                  child: Center(
                    child: Container(
                      height: size.height * 0.4,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Slider(
                          value: value,
                          min: min,
                          max: max,
                          divisions: 122,
                          label: value.round().toString(),
                          onChanged: (value) => setState(() {
                            this.value = value;
                            ft = value * _1cm;
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: size.height * 0.42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...listcm
                          .map((text) => Text(
                                text,
                                style: GoogleFonts.nunito(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
