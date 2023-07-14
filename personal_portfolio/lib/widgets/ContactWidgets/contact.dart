import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'contactCard.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/AboutMe");
              },
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
              onPressed: null,
              icon: const Icon(CupertinoIcons.phone),
              label: const Text("Contact"),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
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
                    const Card(
                      elevation: 50,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              "Contact Me",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                  "Get my information, socials, and where you can find me",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      elevation: 50,
                      child: SizedBox(
                        width: 1000,
                        height: 300,
                        child: Form(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 18),
                            child: Column(
                              children: [
                                const Text(
                                  "Contact me from here!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(CupertinoIcons.person),
                                    labelText: "Your E-mail",
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(CupertinoIcons.pencil),
                                    labelText: "Subject",
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Text",
                                  ),
                                  maxLines: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                          CupertinoIcons.arrow_right_square),
                                      label: const Text("Send")),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Column(
                          children: [
                            const Text(
                              "Download My CV",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Icon(
                              CupertinoIcons.book_circle_fill,
                              size: 200,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                    CupertinoIcons.download_circle_fill),
                                label: const Text("Download Now"))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ContactCard(
                          name: "Email",
                          value: "diego.su@hotmail.com",
                          icon: CupertinoIcons.mail_solid),
                      ContactCard(
                          name: "Discord",
                          value: "diegosu.29",
                          icon: SimpleIcons.discord),
                      ContactCard(
                        name: "Instagram",
                        value: "diegosug",
                        icon: SimpleIcons.instagram,
                        link: "https://www.instagram.com/diegosug/",
                      ),
                      ContactCard(
                        name: "GitHub",
                        value: "DiegoSuG29",
                        icon: SimpleIcons.github,
                        link: "https://github.com/DiegoSuG29",
                      ),
                      ContactCard(
                        name: "Linked In",
                        value: "Diego Sú Gómez",
                        icon: SimpleIcons.linkedin,
                        link:
                            "https://www.linkedin.com/in/diego-s%C3%BA-g%C3%B3mez-455427227/",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
