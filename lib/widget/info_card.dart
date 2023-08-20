import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatefulWidget {
  @override
  State<InfoCard> createState() => _InfoCardState();
}

const double maleAlign = -1;
const double femaleAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.blue;

class _InfoCardState extends State<InfoCard> {
  late double xAlign;
  late Color maleColor;
  late Color femaleColor;

  @override
  void initState() {
    xAlign = maleAlign;
    maleColor = selectedColor;
    femaleColor = normalColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double height = size.height * 0.05;
    late double width = size.width * 0.6;
    return Scaffold(
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Color(0xffC7EBF9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Personal Information",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "First Name",
                  labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: "Last Name",
                  labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
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
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = maleAlign;
                          maleColor = selectedColor;

                          femaleColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Male',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: maleColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = femaleAlign;
                          femaleColor = selectedColor;

                          maleColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: Alignment(1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Female',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: femaleColor,
                            ),
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
