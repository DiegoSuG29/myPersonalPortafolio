import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Personal Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF105676)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // leading: const Padding(
        //   padding: EdgeInsets.only(left: 15.0),
        //   child: Image(
        //     image: AssetImage('assets/images/peace.png'),
        //   ),
        // ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.person),
              label: const Text("About Me"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bag_fill),
              label: const Text("Portfolio"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.device_laptop),
              label: const Text("Trajectory"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.phone),
              label: const Text("Contact"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Color(0xFF105676))),
                              child: const Text("Know more about me!",
                                  style: TextStyle(color: Colors.white)),
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
                              width: 20, color: const Color(0xFF105676)),
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
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Divider(),
              ),
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
                              onPressed: () {},
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
                              "Information about my trajectory, as well as skills and technical abilities",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {},
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
                              onPressed: () {},
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
      ),
    );
  }
}
