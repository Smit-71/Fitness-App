import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeCard extends StatefulWidget {
  @override
  State<AgeCard> createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  int _currentValue = 18;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffC7EBF9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  alignment: Alignment.center,
                  height: size.height * 0.07,
                ),
                Positioned(
                  child: Container(
                    height: size.height * 0.09,
                    width: size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: NumberPicker(
                    axis: Axis.horizontal,
                    step: 1,
                    selectedTextStyle: GoogleFonts.nunito(
                      fontSize: size.height * 0.04,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textStyle: GoogleFonts.nunito(
                      color: Colors.black87,
                      fontSize: size.height * 0.03,
                    ),
                    // itemCount: 7,
                    value: _currentValue,
                    minValue: 1,
                    maxValue: 100,
                    onChanged: (v) {
                      setState(() {
                        _currentValue = v;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "Years",
                style: GoogleFonts.nunito(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
