import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logic/comparision_logic.dart';
import 'speech.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textSample = 'Tap to Speak!';
  bool isListening = false;

  Future<void> toggleRecording() async {
    setState(() {
      isListening = true;
    });

    await Speech.toggleRecording(
      onResult: (String text) => setState(() {
        textSample = text;
        print(text);
        checkWordMatch(text);
      }),
      onListening: (bool isListening) {
        setState(() {
          this.isListening = isListening;
        });
      },
    );

    setState(() {
      isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1c202b),
        floatingActionButton: SizedBox(
          height: 300,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: toggleRecording,
            child: AvatarGlow(
              endRadius: 150,
              animate: isListening,
              glowColor: Colors.white,
              child: Icon(
                isListening ? Icons.circle : Icons.mic,
                size: 35,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100),
                child: Text(
                  textSample,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alata(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 1.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isListening = false;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 2.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white10),
                        child: Center(
                          child: Text(
                            "Stop Recognizing",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isListening = false;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 2.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white10),
                        child: Center(
                          child: Text(
                            "Set Timer",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
