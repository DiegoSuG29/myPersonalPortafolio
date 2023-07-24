import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/PortfolioWidgets/projectWidget.dart';
import 'package:simple_icons/simple_icons.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  ScrollController scrollbarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                "My Projects",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 30),
              RawScrollbar(
                thumbColor: coloring.inversePrimary,
                thumbVisibility: true,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                controller: scrollbarController,
                child: SingleChildScrollView(
                  controller: scrollbarController,
                  scrollDirection: Axis.horizontal,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProjectWidget(
                        title: "BAMX",
                        description:
                            "Flutter Project developed for Banco de Alimentos. Manage volunteering events for the company, allow registration of events, programs and users, authentication system, profile management.",
                        img: "assets/images/bamx.png",
                        stack: [
                          SimpleIcons.flutter,
                          SimpleIcons.firebase,
                        ],
                        githubLink: "https://github.com/sant-gdc/BAMX",
                        demoLink: "https://youtu.be/jqldKiiPR9U",
                      ),
                      ProjectWidget(
                        title: "IBM Certification Manager",
                        description:
                            "Webpage developed for IBM as a Project using the MERN framework. Application that allows IBM Managers to keep track of their employee's certifications and get certain recommendations based on their data.",
                        img: "assets/images/solutio.png",
                        stack: [
                          SimpleIcons.react,
                          SimpleIcons.mongodb,
                          SimpleIcons.express,
                          SimpleIcons.axios,
                        ],
                        githubLink:
                            "https://github.com/Hector-rob/Software_planning16",
                        demoLink: "https://youtu.be/dDvyCHkQzqk",
                      ),
                      ProjectWidget(
                        title: "Multi Agent Simulator",
                        description:
                            "Application using both Unreal Engine & Python to simulate a crossroad in which all the agents (cars) act accordingly to avoid crashes (Stop on red lights, control passing of cars, walking people moving only on streets or when the light is red, etc).",
                        stack: [
                          SimpleIcons.unrealengine,
                          SimpleIcons.python,
                        ],
                        demoLink: "https://www.youtube.com/watch?v=kTqpcQKjzYU",
                        githubLink:
                            "https://drive.google.com/drive/folders/125gUlZ3PZ6ExznNqX25XWrjGoDPAHh8t?usp=share_link",
                      ),
                      ProjectWidget(
                        title: "Nucleotides Analysis",
                        description:
                            "R program that analyzes different DNA sequences depending on viruses to find similarities & differences using R Data Analytics tools.",
                        stack: [SimpleIcons.r],
                        githubLink:
                            "https://github.com/DiegoSuG29/NucleotidesAnalysis",
                      ),
                      ProjectWidget(
                        title: "Lexical Interpreter",
                        description:
                            "Analyzer that interprets a code in 3 different languages using regular expressions & and interpreter and highlights each of the components of the code with a different color on a separate webpage.",
                        stack: [
                          SimpleIcons.c,
                          SimpleIcons.html5,
                        ],
                        githubLink:
                            " https://github.com/DiegoSuG29/ResaltadorLexico",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
