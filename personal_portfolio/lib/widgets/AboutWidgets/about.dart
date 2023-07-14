import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:personal_portfolio/widgets/AboutWidgets/skillCard.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  CarouselController carouselController = CarouselController();
  CarouselController carousel2Controller = CarouselController();
  CarouselController carousel3Controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(CupertinoIcons.person),
              label: const Text("About Me"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/Portfolio");
              },
              icon: const Icon(CupertinoIcons.bag_fill),
              label: const Text("Portfolio"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/Trajectory");
              },
              icon: const Icon(CupertinoIcons.device_laptop),
              label: const Text("Trajectory"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/ContactMe");
              },
              icon: const Icon(CupertinoIcons.phone),
              label: const Text("Contact"),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 20, color: const Color(0xFF105676)),
                        borderRadius: BorderRadius.circular(150)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: const Image(
                          image: AssetImage("assets/images/me.jpg")),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Card(
                    child: SizedBox(
                      width: 700,
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: RichText(
                          text: const TextSpan(
                              text:
                                  "Hi, my name is Diego Sú Gómez. I'm a mexican of 21 years of age who is studying a Bachelor in Computer Science at Tec de Monterrey Campus Guadalajara. I am set to graduate in summer '24, and decided to create this website to showcase my portfolio, CV and skills I possess. I am a big fan of coding, web design, data science and math, as well as having other hobbies such as playing and watching both soccer & basketball.\n\nI am a fan of Real Madrid & the Denver Nuggets. I also enjoy watching series, listening to music and hangingout with my friends. I am a very competitive and motivated person, who is always looking to improve and grow.",
                              style: TextStyle(fontSize: 18)),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const Text(
                            "Languages",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 250,
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: carouselController,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: 300,
                                    enlargeCenterPage: true,
                                  ),
                                  items: const [
                                    SkillCard(
                                      name: "Spanish",
                                      icon: CupertinoIcons.flag_fill,
                                      description: "Native",
                                      color: Colors.green,
                                      expertise: 5,
                                      flag: "mx",
                                    ),
                                    SkillCard(
                                      name: "English",
                                      icon: CupertinoIcons.flag_fill,
                                      description: "Conversational/Bilingual",
                                      color: Colors.lightBlue,
                                      expertise: 5,
                                      flag: "us",
                                    ),
                                    SkillCard(
                                      name: "French",
                                      icon: CupertinoIcons.flag_fill,
                                      description: "Fluent",
                                      color: Colors.blueAccent,
                                      expertise: 3,
                                      flag: "fr",
                                    ),
                                    SkillCard(
                                      name: "Portuguese",
                                      icon: CupertinoIcons.flag_fill,
                                      description: "Basic, still learning",
                                      color: Colors.yellowAccent,
                                      expertise: 2,
                                      flag: "br",
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: IconButton(
                                      onPressed: () {
                                        carouselController.previousPage();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: IconButton(
                                      onPressed: () {
                                        carouselController.nextPage();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const Text(
                            "Knowledge",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 250,
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: carousel2Controller,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: 300,
                                    enlargeCenterPage: true,
                                  ),
                                  items: const [
                                    SkillCard(
                                        name: "Python",
                                        icon: SimpleIcons.python,
                                        description: "Programming Language",
                                        color: Colors.yellow,
                                        expertise: 5),
                                    SkillCard(
                                        name: "C++",
                                        icon: SimpleIcons.cplusplus,
                                        description: "Programming Language",
                                        color: Colors.blueAccent,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Javascript",
                                        icon: SimpleIcons.javascript,
                                        description: "Programming Language",
                                        color: Colors.orangeAccent,
                                        expertise: 4),
                                    SkillCard(
                                        name: "Dart",
                                        icon: SimpleIcons.dart,
                                        description: "Programming Language",
                                        color: Colors.cyan,
                                        expertise: 5),
                                    SkillCard(
                                        name: "R",
                                        icon: SimpleIcons.r,
                                        description: "Programming Language",
                                        color: Colors.blueGrey,
                                        expertise: 3),
                                    SkillCard(
                                        name: "Matlab",
                                        icon: CupertinoIcons.add,
                                        description: "Programming Language",
                                        color: Colors.red,
                                        expertise: 4),
                                    SkillCard(
                                        name: "C",
                                        icon: SimpleIcons.c,
                                        description: "Programming Language",
                                        color: Colors.purple,
                                        expertise: 4),
                                    SkillCard(
                                        name: "HTML",
                                        icon: SimpleIcons.html5,
                                        description: "Programming Language",
                                        color: Colors.grey,
                                        expertise: 4),
                                    SkillCard(
                                        name: "CSS",
                                        icon: SimpleIcons.css3,
                                        description: "Programming Language",
                                        color: Colors.lightGreenAccent,
                                        expertise: 4),
                                    SkillCard(
                                        name: "MySQL",
                                        icon: SimpleIcons.mysql,
                                        description: "Database Language",
                                        color: Colors.blue,
                                        expertise: 4),
                                    SkillCard(
                                        name: "MongoDB",
                                        icon: SimpleIcons.mongodb,
                                        description: "Database Language",
                                        color: Colors.green,
                                        expertise: 4),
                                    SkillCard(
                                        name: "Unreal Engine",
                                        icon: SimpleIcons.unrealengine,
                                        description: "VideoGame Development",
                                        color: Colors.grey,
                                        expertise: 4),
                                    SkillCard(
                                        name: "Flutter",
                                        icon: SimpleIcons.flutter,
                                        description:
                                            "Mobile development framework",
                                        color: Colors.cyan,
                                        expertise: 5),
                                    SkillCard(
                                        name: "React",
                                        icon: SimpleIcons.react,
                                        description:
                                            "Web Development Framework",
                                        color: Colors.cyanAccent,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Node.JS",
                                        icon: SimpleIcons.nodedotjs,
                                        description: "Back-End Environment",
                                        color: Colors.deepOrange,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Express.JS",
                                        icon: SimpleIcons.express,
                                        description: "Back-End Environment",
                                        color: Colors.yellowAccent,
                                        expertise: 5),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel2Controller.previousPage();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel2Controller.nextPage();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const Text(
                            "Soft Skills",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 250,
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: carousel3Controller,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: 300,
                                    enlargeCenterPage: true,
                                  ),
                                  items: const [
                                    SkillCard(
                                        name: "Dedication",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.cyan,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Perseverance",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.green,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Motivation",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.cyan,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Leadership",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.green,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Communication",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.cyan,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Proactiveness",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.green,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Active Listening",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.cyan,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Critical Thinking",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.green,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Responsibility",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.cyan,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Punctuality",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.green,
                                        expertise: 5),
                                    SkillCard(
                                        name: "Organization",
                                        icon: CupertinoIcons.star_circle_fill,
                                        description: "Soft Skill",
                                        color: Colors.cyan,
                                        expertise: 5),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel3Controller.previousPage();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel3Controller.nextPage();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
