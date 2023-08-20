import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutCategory extends StatelessWidget {
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
                        "Category Name",
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
                  Stack(
                    children: [
                      Container(
                        child: Image.asset("assets/category.png"),
                      ),
                      Positioned(
                        left: size.width * 0.5,
                        top: size.width * 0.25,
                        child: Container(
                          height: size.width * 0.1,
                          child: Image.asset(
                            "assets/start.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "At vero eos et accusamus et iusto odio",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: size.height * 0.02,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "3 min",
                                style: GoogleFonts.nunito(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/category.png",
                              height: size.width * 0.12,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Accusamus et iusto odio",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.035,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: size.height * 0.017,
                                        color: Color(0xff0fb5d8),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "3 min",
                                        style: GoogleFonts.nunito(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(color: Colors.black54),
                        Row(
                          children: [
                            Image.asset(
                              "assets/category.png",
                              height: size.width * 0.12,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Accusamus et iusto odio",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.035,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: size.height * 0.017,
                                        color: Color(0xff0fb5d8),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "3 min",
                                        style: GoogleFonts.nunito(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(color: Colors.black54),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Feedback",
                            style: GoogleFonts.nunito(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: TextField(
                  style: GoogleFonts.nunito(),
                  decoration: InputDecoration(
                    hintText: "Write your Comment...",
                    hintStyle: GoogleFonts.nunito(),
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
