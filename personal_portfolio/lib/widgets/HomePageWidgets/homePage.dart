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
    return MediaQuery.of(context).size.width <
            MediaQuery.of(context).size.height
        ? HomePageMobile(coloring: coloring, textStyling: textStyling)
        : HomePageDesktop(coloring: coloring, textStyling: textStyling);
  }
}

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({
    super.key,
    required this.coloring,
    required this.textStyling,
  });

  final ColorScheme coloring;
  final TextTheme textStyling;

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Flexible(
              flex: 20,
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                  foregroundDecoration: BoxDecoration(
                    border:
                        Border.all(width: 20, color: widget.coloring.tertiary),
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child:
                        const Image(image: AssetImage("assets/images/me.jpg")),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 20,
              fit: FlexFit.loose,
              child: Card(
                elevation: 50,
                borderOnForeground: true,
                color: widget.coloring.primary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "Hi, I'm Diego, welcome to my Webpage.",
                        style: widget.textStyling.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      Text(
                        "I'm a Computer Science Undergrad",
                        style: widget.textStyling.bodySmall,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Text(
                        "Currently in: Aguascalientes, Ags",
                        style: widget.textStyling.bodySmall,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      ElevatedButton(
                        onPressed: () {
                          DefaultTabController.of(context).animateTo(1);
                        },
                        child: const Text("Know more about me!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 25,
              child: RawScrollbar(
                controller: scrollController,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: const Row(
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
                            "Information about my trajectory and my professional experience",
                        index: 3,
                      ),
                      HomePageButton(
                        title: "Contact Me",
                        icon: CupertinoIcons.phone_circle,
                        description:
                            "Get my contact information and my CV for download",
                        index: 4,
                      ),
                    ],
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

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({
    super.key,
    required this.coloring,
    required this.textStyling,
  });

  final ColorScheme coloring;
  final TextTheme textStyling;

  @override
  Widget build(BuildContext context) {
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
                Flexible(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return SizedBox(
                      height: constraints.maxHeight * 0.65,
                      child: Card(
                        elevation: 50,
                        borderOnForeground: true,
                        color: coloring.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 4,
                                child: Text(
                                  "Hi, I'm Diego, welcome to my Webpage.",
                                  style: textStyling.bodyMedium,
                                ),
                              ),
                              const Spacer(),
                              Flexible(
                                flex: 2,
                                child: Text(
                                  "I'm a Computer Science Undergrad",
                                  style: textStyling.bodySmall,
                                ),
                              ),
                              const Spacer(),
                              Flexible(
                                flex: 2,
                                child: Text(
                                  "Currently in: Aguascalientes, Ags",
                                  style: textStyling.bodySmall,
                                ),
                              ),
                              const Spacer(),
                              Flexible(
                                flex: 4,
                                child: ElevatedButton(
                                  onPressed: () {
                                    DefaultTabController.of(context)
                                        .animateTo(1);
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
                ),
                Flexible(
                  child: Padding(
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
                Flexible(
                  child: HomePageButton(
                    title: "My Projects",
                    icon: CupertinoIcons.folder_fill,
                    description:
                        "Review my featured projects and gain more insight on what I've done",
                    index: 2,
                  ),
                ),
                Flexible(
                  child: HomePageButton(
                    title: "Academic/Professional History",
                    icon: CupertinoIcons.book,
                    description:
                        "Information about my trajectory and my professional experience",
                    index: 3,
                  ),
                ),
                Flexible(
                  child: HomePageButton(
                      title: "Contact Me",
                      icon: CupertinoIcons.phone_circle,
                      description:
                          "Get my contact information and my CV for download",
                      index: 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
