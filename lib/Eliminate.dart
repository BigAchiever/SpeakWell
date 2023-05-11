import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parth2/Drawer.dart';
import 'package:parth2/profile.dart';
import 'package:parth2/result.dart';

// import 'database.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final TextEditingController wordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String word = "";
  Map<String, dynamic> wordMap = {};

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff1c202b),
      appBar: AppBar(
        backgroundColor: const Color(0xff1c202b),
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: const Duration(milliseconds: 500),
                          child: const DrawerScreen()));
                },
                icon: const Icon(Icons.menu))),
        title: const Center(child: Text("SpeakWell")),
        titleTextStyle: GoogleFonts.alata(fontSize: 25),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            duration: const Duration(milliseconds: 500),
                            child: const profile()));
                  },
                  icon: const Icon(Icons.person)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              height: size.height / 7,
              width: size.width / 1.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(size.width / 20),
                  child: Text(
                    "👋 Hey ! I am SpeakWell Let me know if you want my help or have any questions ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alata(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Container(
              height: size.height / 10,
              width: size.width / 1.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Improvement in your communication skills is now Accessible and Efficient!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alata(
                      fontWeight: FontWeight.w300,
                      color: Colors.white38,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            SizedBox(
              height: size.height / 3,
              width: size.width / 1.1,
              child: StreamBuilder<DocumentSnapshot>(
                stream: _firestore
                    .collection('Words')
                    .doc('wordMapDoc')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.exists) {
                    final data = snapshot.data!.data() as Map<String, dynamic>;
                    wordMap = data['words'] as Map<String, dynamic>;

                    if (wordMap.isEmpty) {
                      // Show message when wordMap is empty
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white10,
                        ),
                        child: const Center(
                          child: Text(
                            'No Words added yet!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 2,
                            ),
                            itemCount: wordMap.length,
                            itemBuilder: (context, index) {
                              final word = wordMap.keys.elementAt(index);
                              final spoken = wordMap[word];

                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(word),
                                    SizedBox(height: 5),
                                    Text('Spoken: $spoken'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: size.height / 7.3,
            ),
            SizedBox(
              height: size.height / 20,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        height: size.height / 10,
                        width: size.width / 9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white10,
                        ),
                        child: const Icon(Icons.mic, color: Colors.white),
                      ),
                    ),
                    Container(
                      height: size.height / 8,
                      width: size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          controller: wordController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Your Word'),
                          onChanged: (value) => setState(() => word = value),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (word.isNotEmpty) {
                          //  to the map
                          if (wordMap.containsKey(word)) {
                            Fluttertoast.showToast(
                              msg: 'Word already exists',
                              backgroundColor: Colors.red,
                            );
                          } else {
                            wordMap[word] = 0;
                          }

                          // saving updated map to Firestore
                          await _firestore
                              .collection('Words')
                              .doc('wordMapDoc')
                              .set({'words': wordMap});

                          wordController.clear();
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white10,
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height / 35,
            ),
          ],
        ),
      ),
    );
  }
}
