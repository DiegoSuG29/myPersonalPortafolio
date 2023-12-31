import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/TrajectoryWidgets/trajectoryModal.dart';

class TrajectoryPage extends StatelessWidget {
  const TrajectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    return MediaQuery.of(context).size.width <
            MediaQuery.of(context).size.height
        ? TrajectoryPageMobile(coloring: coloring)
        : TrajectoryPageDesktop(coloring: coloring);
  }
}

class TrajectoryPageMobile extends StatelessWidget {
  const TrajectoryPageMobile({super.key, required this.coloring});

  final ColorScheme coloring;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  "Academic & Professional Experience",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: coloring.primary,
                elevation: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Academic History",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RawScrollbar(
                          controller: scrollController,
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: const TrajectoryModal(
                                    job: false,
                                    name: "High School",
                                    img: "assets/images/LogoTec.png",
                                    years: "2017-2020",
                                    school:
                                        "Tec de Monterrey Campus Aguascalientes",
                                    done: true,
                                    location: "Aguascalientes, Ags",
                                    link: "https://tec.mx/es/prepatec",
                                    gpa: "98.4",
                                  ),
                                ),
                                const SizedBox(width: 25),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: const TrajectoryModal(
                                    job: false,
                                    name: "B.S. in Computer Science",
                                    img: "assets/images/LogoTec.png",
                                    years: "2020-2024",
                                    school:
                                        "Tec de Monterrey Campus Guadalajara",
                                    location: "Guadalajara, Jalisco",
                                    gpa: "98.6",
                                    link:
                                        "https://tec.mx/es/computacion-y-tecnologias-de-informacion/ingeniero-en-tecnologias-computacionales",
                                  ),
                                ),
                                const SizedBox(width: 25)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: coloring.primary,
                elevation: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Professional Experience",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RawScrollbar(
                          controller: scrollController,
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: const TrajectoryModal(
                                    job: true,
                                    name: "Veterinary Assistant",
                                    school: "Veterinaria Saugo",
                                    img: "assets/images/vet.png",
                                    years: "2017",
                                    location: "Aguascalientes, Ags",
                                    done: true,
                                    description:
                                        "Summer job at my uncle's veterinary, managing inventory, handling excel and networking/customer service and attention.",
                                  ),
                                ),
                                const SizedBox(width: 25),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: const TrajectoryModal(
                                    job: true,
                                    name: "Embajador Tec",
                                    school:
                                        "Tec de Monterrey Campus Aguascalientes",
                                    img: "assets/images/Embajadores.png",
                                    years: "2019-2020",
                                    location: "Aguascalientes, Ags",
                                    link: "https://tec.mx/es/embajadores-tec",
                                    done: true,
                                    description:
                                        "Yearly program focused on attracting talent into the school by generating strategies in which actual students promote the life and advantages of studying there, developing multimedia content creation, networking, public speaking and intercommunication skills. Organizing volunteering events for helping associations, organizations & people in need.",
                                  ),
                                ),
                                const SizedBox(width: 25)
                              ],
                            ),
                          ),
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
    );
  }
}

class TrajectoryPageDesktop extends StatelessWidget {
  const TrajectoryPageDesktop({
    super.key,
    required this.coloring,
  });

  final ColorScheme coloring;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Flexible(
            flex: 10,
            child: Text(
              "Academic & Professional Experience",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: coloring.primary,
                elevation: 50,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Academic History",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              TrajectoryModal(
                                job: false,
                                name: "High School",
                                img: "assets/images/LogoTec.png",
                                years: "2017-2020",
                                school:
                                    "Tec de Monterrey Campus Aguascalientes",
                                done: true,
                                location: "Aguascalientes, Ags",
                                link: "https://tec.mx/es/prepatec",
                                gpa: "98.4",
                              ),
                              SizedBox(width: 25),
                              TrajectoryModal(
                                job: false,
                                name: "B.S. in Computer Science",
                                img: "assets/images/LogoTec.png",
                                years: "2020-2024",
                                school: "Tec de Monterrey Campus Guadalajara",
                                location: "Guadalajara, Jalisco",
                                gpa: "98.6",
                                link:
                                    "https://tec.mx/es/computacion-y-tecnologias-de-informacion/ingeniero-en-tecnologias-computacionales",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(flex: 5),
          Flexible(
            flex: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: coloring.primary,
                elevation: 50,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Professional Experience",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              TrajectoryModal(
                                job: true,
                                name: "Veterinary Assistant",
                                school: "Veterinaria Saugo",
                                img: "assets/images/vet.png",
                                years: "2017",
                                location: "Aguascalientes, Ags",
                                done: true,
                                description:
                                    "Summer job at my uncle's veterinary, managing inventory, handling excel and networking/customer service and attention.",
                              ),
                              SizedBox(width: 25),
                              TrajectoryModal(
                                job: true,
                                name: "Embajador Tec",
                                school:
                                    "Tec de Monterrey Campus Aguascalientes",
                                img: "assets/images/Embajadores.png",
                                years: "2019-2020",
                                location: "Aguascalientes, Ags",
                                link: "https://tec.mx/es/embajadores-tec",
                                done: true,
                                description:
                                    "Yearly program focused on attracting talent into the school by generating strategies in which actual students promote the life and advantages of studying there, developing multimedia content creation, networking, public speaking and intercommunication skills. Organizing volunteering events for helping associations, organizations & people in need.",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
