import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectDevice extends StatefulWidget {
  @override
  State<ConnectDevice> createState() => _ConnectDeviceState();
}

class _ConnectDeviceState extends State<ConnectDevice> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xffC9EBF8),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
          ),
        ),
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
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
                  "Device",
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
            Center(
              child: Text(
                "Please Make sure your device switch on",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.04),
              child: Center(
                child: Text(
                  "Device Name",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.08,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.04),
              child: Center(
                child: Container(
                  height: size.height * 0.15,
                  width: size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 5,
                      color: Color(0xff0fb5d8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "POCO X3 PRO",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
              child: Center(
                child: Container(
                  height: size.height * 0.15,
                  child: Image.asset("assets/device_line.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: AnimatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  child: Text(
                    "Pair Device",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
