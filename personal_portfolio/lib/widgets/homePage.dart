// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    final textStyling = Theme.of(context).textTheme;
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
                  color: coloring.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Hi, I'm Diego",
                          style: textStyling.bodyMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Computer Science Undergrad",
                          style: textStyling.bodyMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Currently in: Aguascalientes, Ags",
                          style: textStyling.bodySmall,
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
                      border: Border.all(width: 20, color: coloring.tertiary),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: const Image(
                          image: AssetImage("assets/images/me.jpg")),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: coloring.primary,
                  elevation: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
                    child: Column(
                      children: [
                        Text(
                          "My Projects",
                          style: textStyling.titleSmall,
                        ),
                        const Icon(
                          CupertinoIcons.folder_fill,
                          size: 125,
                        ),
                        Text(
                          "Review my featured projects and gain more insight on what I've done",
                          textAlign: TextAlign.center,
                          style: textStyling.bodySmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: IconButton(
                            onPressed: () =>
                                DefaultTabController.of(context).animateTo(2),
                            icon: const Icon(CupertinoIcons.arrow_right),
                            iconSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: coloring.primary,
                  elevation: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
                    child: Column(
                      children: [
                        Text(
                          "Academic/Professional History",
                          style: textStyling.titleSmall,
                        ),
                        const Icon(
                          CupertinoIcons.book,
                          size: 125,
                        ),
                        Text(
                          "Information about my trajectory, as well as professional experience",
                          textAlign: TextAlign.center,
                          style: textStyling.bodySmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: IconButton(
                            onPressed: () =>
                                DefaultTabController.of(context).animateTo(3),
                            icon: const Icon(CupertinoIcons.arrow_right),
                            iconSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Card(
                    color: coloring.primary,
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
                      child: Column(
                        children: [
                          Text(
                            "Contact Me",
                            style: textStyling.titleSmall,
                          ),
                          const Icon(
                            CupertinoIcons.phone_circle,
                            size: 125,
                          ),
                          Text(
                            "Get my contact information and my CV for download",
                            textAlign: TextAlign.center,
                            style: textStyling.bodySmall,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: IconButton(
                              onPressed: () =>
                                  DefaultTabController.of(context).animateTo(4),
                              icon: const Icon(CupertinoIcons.arrow_right),
                              iconSize: 35,
                            ),
                          ),
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
