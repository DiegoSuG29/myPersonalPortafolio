import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 50,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          "Hi, I'm Diego",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Computer Science Undergrad",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1486A5),
                          ),
                        ),
                        const Text(
                          "Currently in: Aguascalientes, Ags",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/AboutMe");
                            },
                            child: const Text("Know more about me!"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 300,
                    height: 300,
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 20,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(150)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: const Image(
                          image: AssetImage("assets/images/me.jpg")),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 400,
                  child: Card(
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
                      child: Column(
                        children: [
                          const Text(
                            "My Projects",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Icon(
                            CupertinoIcons.folder_fill,
                            size: 125,
                          ),
                          const Text(
                            "Review my featured projects and gain more insight on what I've done",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/Portfolio");
                            },
                            icon: const Icon(CupertinoIcons.arrow_right),
                            iconSize: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Card(
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
                      child: Column(
                        children: [
                          const Text(
                            "Academic/Professional History",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Icon(
                            CupertinoIcons.book,
                            size: 125,
                          ),
                          const Text(
                            "Information about my trajectory, as well as professional experience",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/Trajectory");
                            },
                            icon: const Icon(CupertinoIcons.arrow_right),
                            iconSize: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Card(
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
                      child: Column(
                        children: [
                          const Text(
                            "Contact Me",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Icon(
                            CupertinoIcons.phone_circle,
                            size: 125,
                          ),
                          const Text(
                            "Get my contact information and my CV for download",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/ContactMe");
                            },
                            icon: const Icon(CupertinoIcons.arrow_right),
                            iconSize: 35,
                          )
                        ],
                      ),
                    ),
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
