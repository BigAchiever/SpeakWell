import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c202b),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              children: [
                Container(
                  alignment: const Alignment(-0.5, 0.6),
                  //
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff1c202b),
                        offset: Offset(-5, -5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Image.asset(
                          "assets/clockandweather.png",
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Text(
                          "Clock & \nWeather",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: const Alignment(-0.6, 0.6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white10,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff1c202b),
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]),
                  height: 40,
                  width: 40,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 30),
                        child: Image.asset(
                          "assets/profile.png",
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, right: 20),
                        child: Text(
                          "Profile",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: const Alignment(-0.5, 0.6),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white10,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff1c202b),
                          offset: Offset(-5, -5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Image.asset(
                          "assets/settings.png",
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40.0,
                        ),
                        child: Text(
                          "Settings",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: const Alignment(-0.6, 0.6),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white10,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xff1c202b),
                            offset: Offset(5, 5),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 35),
                          child: Image.asset(
                            "assets/connection.png",
                            height: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 5),
                          child: Text(
                            "Watchfaces",
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  alignment: const Alignment(-0.5, 0.6),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white10,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff1c202b),
                          offset: Offset(-5, -5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Image.asset(
                          "assets/compete.png",
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          "Compete",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: const Alignment(-0.6, 0.6),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white10,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff1c202b),
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 30),
                        child: Image.asset(
                          "assets/googlefit.png",
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 5),
                        child: Text(
                          "Google Fit",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 8),
            child: Container(
              alignment: const Alignment(-0.8, 0.6),
              height: 180,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff1c202b),
                      offset: Offset(-10, -10),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      "assets/about.png",
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55.0),
                    child: Text(
                      "About",
                      style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
