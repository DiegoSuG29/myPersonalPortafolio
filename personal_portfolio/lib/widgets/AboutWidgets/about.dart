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
    final coloring = Theme.of(context).colorScheme;
    final textStyling = Theme.of(context).textTheme;
    return MediaQuery.of(context).size.width <
            MediaQuery.of(context).size.height
        ? AboutMeMobile(
            coloring: coloring,
            textStyling: textStyling,
            carouselController: carouselController,
            carousel2Controller: carousel2Controller,
            carousel3Controller: carousel3Controller)
        : AboutMeDesktop(
            coloring: coloring,
            textStyling: textStyling,
            carouselController: carouselController,
            carousel2Controller: carousel2Controller,
            carousel3Controller: carousel3Controller);
  }
}

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({
    super.key,
    required this.coloring,
    required this.textStyling,
    required this.carouselController,
    required this.carousel2Controller,
    required this.carousel3Controller,
  });

  final ColorScheme coloring;
  final TextTheme textStyling;
  final CarouselController carouselController;
  final CarouselController carousel2Controller;
  final CarouselController carousel3Controller;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.height * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
                foregroundDecoration: BoxDecoration(
                    border: Border.all(width: 20, color: coloring.tertiary),
                    borderRadius: BorderRadius.circular(150)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: const Image(image: AssetImage("assets/images/me.jpg")),
                ),
              ),
              Card(
                color: coloring.primary,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hi, my name is Diego Sú Gómez. I'm a mexican of 21 years of age who is studying a Bachelor in Computer Science at Tec de Monterrey Campus Guadalajara. I am set to graduate in summer '24, and decided to create this website to showcase my portfolio, CV and skills I possess. I am a big fan of coding, web design, data science and math, as well as having other hobbies such as playing and watching both soccer & basketball. I am a fan of Real Madrid & the Denver Nuggets. I also enjoy watching series, listening to music and hangingout with my friends. I am a very competitive and motivated person, who is always looking to improve and grow.",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          color: coloring.inversePrimary,
                        ),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
              RawScrollbar(
                controller: scrollController,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: coloring.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                "Languages",
                                style: textStyling.titleMedium,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.height * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.325,
                                margin: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    CarouselSlider(
                                      carouselController: carouselController,
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.325,
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
                                          description:
                                              "Conversational/Bilingual",
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
                                        backgroundColor:
                                            coloring.primaryContainer,
                                        child: IconButton(
                                          onPressed: () {
                                            carouselController.previousPage();
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: coloring.inversePrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            coloring.primaryContainer,
                                        child: IconButton(
                                          onPressed: () {
                                            carouselController.nextPage();
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: coloring.inversePrimary,
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
                        color: coloring.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Text("Knowledge", style: textStyling.titleMedium),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.height * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.325,
                                margin: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    CarouselSlider(
                                      carouselController: carousel2Controller,
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.325,
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
                                            description:
                                                "VideoGame Development",
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
                                        backgroundColor:
                                            coloring.primaryContainer,
                                        child: IconButton(
                                          onPressed: () {
                                            carousel2Controller.previousPage();
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: coloring.inversePrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            coloring.primaryContainer,
                                        child: IconButton(
                                          onPressed: () {
                                            carousel2Controller.nextPage();
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: coloring.inversePrimary,
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
                        color: coloring.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                "Soft Skills",
                                style: textStyling.titleMedium,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.height * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.325,
                                margin: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    CarouselSlider(
                                      carouselController: carousel3Controller,
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.325,
                                        enlargeCenterPage: true,
                                      ),
                                      items: const [
                                        SkillCard(
                                            name: "Dedication",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.cyan,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Perseverance",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.green,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Motivation",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.cyan,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Leadership",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.green,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Communication",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.cyan,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Proactiveness",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.green,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Active Listening",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.cyan,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Critical Thinking",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.green,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Responsibility",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.cyan,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Punctuality",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.green,
                                            expertise: 5),
                                        SkillCard(
                                            name: "Organization",
                                            icon:
                                                CupertinoIcons.star_circle_fill,
                                            description: "Soft Skill",
                                            color: Colors.cyan,
                                            expertise: 5),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            coloring.primaryContainer,
                                        child: IconButton(
                                          onPressed: () {
                                            carousel3Controller.previousPage();
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: coloring.inversePrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            coloring.primaryContainer,
                                        child: IconButton(
                                          onPressed: () {
                                            carousel3Controller.nextPage();
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: coloring.inversePrimary,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMeDesktop extends StatelessWidget {
  const AboutMeDesktop({
    super.key,
    required this.coloring,
    required this.textStyling,
    required this.carouselController,
    required this.carousel2Controller,
    required this.carousel3Controller,
  });

  final ColorScheme coloring;
  final TextTheme textStyling;
  final CarouselController carouselController;
  final CarouselController carousel2Controller;
  final CarouselController carousel3Controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Flexible(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.25,
                    height: MediaQuery.of(context).size.height * 0.25,
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(width: 20, color: coloring.tertiary),
                        borderRadius: BorderRadius.circular(150)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: const Image(
                          image: AssetImage("assets/images/me.jpg")),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Flexible(
                  child: Card(
                    color: coloring.primary,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hi, my name is Diego Sú Gómez. I'm a mexican of 21 years of age who is studying a Bachelor in Computer Science at Tec de Monterrey Campus Guadalajara. I am set to graduate in summer '24, and decided to create this website to showcase my portfolio, CV and skills I possess. I am a big fan of coding, web design, data science and math, as well as having other hobbies such as playing and watching both soccer & basketball. I am a fan of Real Madrid & the Denver Nuggets. I also enjoy watching series, listening to music and hangingout with my friends. I am a very competitive and motivated person, who is always looking to improve and grow.",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                              color: coloring.inversePrimary,
                            ),
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Card(
                    color: coloring.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Languages",
                            style: textStyling.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.height * 0.4,
                            height: MediaQuery.of(context).size.height * 0.325,
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: carouselController,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: MediaQuery.of(context).size.height *
                                        0.325,
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
                                    backgroundColor: coloring.primaryContainer,
                                    child: IconButton(
                                      onPressed: () {
                                        carouselController.previousPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: coloring.inversePrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: coloring.primaryContainer,
                                    child: IconButton(
                                      onPressed: () {
                                        carouselController.nextPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: coloring.inversePrimary,
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
                ),
                Flexible(
                  child: Card(
                    color: coloring.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Text("Knowledge", style: textStyling.titleMedium),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.height * 0.4,
                            height: MediaQuery.of(context).size.height * 0.325,
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: carousel2Controller,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: MediaQuery.of(context).size.height *
                                        0.325,
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
                                    backgroundColor: coloring.primaryContainer,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel2Controller.previousPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: coloring.inversePrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: coloring.primaryContainer,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel2Controller.nextPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: coloring.inversePrimary,
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
                ),
                Flexible(
                  child: Card(
                    color: coloring.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Soft Skills",
                            style: textStyling.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.height * 0.4,
                            height: MediaQuery.of(context).size.height * 0.325,
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: carousel3Controller,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: MediaQuery.of(context).size.height *
                                        0.325,
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
                                    backgroundColor: coloring.primaryContainer,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel3Controller.previousPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: coloring.inversePrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: coloring.primaryContainer,
                                    child: IconButton(
                                      onPressed: () {
                                        carousel3Controller.nextPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: coloring.inversePrimary,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
