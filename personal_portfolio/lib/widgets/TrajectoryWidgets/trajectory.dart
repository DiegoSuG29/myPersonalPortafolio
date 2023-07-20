import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/TrajectoryWidgets/trajectoryModal.dart';

class TrajectoryPage extends StatelessWidget {
  const TrajectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: [
              Text(
                "Academic & Professional Experience",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  color: coloring.primary,
                  elevation: 50,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Academic History",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Padding(
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
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  color: coloring.primary,
                  elevation: 50,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Professional Experience",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Padding(
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
                                      "Yearly program focused on attracting talent into the school by generating strategies in which actual students promote the life and advantages of studying there, developing multimedia content creation, networking, public speaking and intercommunication skills. Organizing volunteering events for helping associations, organizations & people in need."),
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
      ),
    );
  }
}
