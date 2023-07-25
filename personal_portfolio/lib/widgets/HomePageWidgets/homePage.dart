// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homePageButton.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Flexible(
            flex: 45,
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                    height: constraints.maxHeight * 0.65,
                    child: Card(
                      elevation: 50,
                      borderOnForeground: true,
                      color: coloring.primary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                "Hi, I'm Diego, welcome to my Webpage.",
                                style: textStyling.bodyMedium,
                              ),
                            ),
                            const Spacer(),
                            Flexible(
                              child: Text(
                                "I'm a Computer Science Undergrad",
                                style: textStyling.bodySmall,
                              ),
                            ),
                            const Spacer(),
                            Flexible(
                              child: Text(
                                "Currently in: Aguascalientes, Ags",
                                style: textStyling.bodySmall,
                              ),
                            ),
                            const Spacer(),
                            Flexible(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () {
                                  DefaultTabController.of(context).animateTo(1);
                                },
                                child: const Text("Know more about me!"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.35,
                    height: MediaQuery.of(context).size.height * 0.35,
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
          ),
          const Spacer(flex: 10),
          const Flexible(
            flex: 45,
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomePageButton(
                  title: "My Projects",
                  icon: CupertinoIcons.folder_fill,
                  description:
                      "Review my featured projects and gain more insight on what I've done",
                  index: 2,
                ),
                HomePageButton(
                  title: "Academic/Professional History",
                  icon: CupertinoIcons.book,
                  description:
                      "Information about my trajectory, as well as my professional experience",
                  index: 3,
                ),
                HomePageButton(
                    title: "Contact Me",
                    icon: CupertinoIcons.phone_circle,
                    description:
                        "Get my contact information and my CV for download",
                    index: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
