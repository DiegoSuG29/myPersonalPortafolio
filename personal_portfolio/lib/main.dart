import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/themeNotifier.dart';
import 'package:personal_portfolio/widgets/homePage.dart';
import 'widgets/AboutWidgets/about.dart';
import 'widgets/ContactWidgets/contact.dart';
import 'widgets/PortfolioWidgets/portfolio.dart';
import 'widgets/TrajectoryWidgets/trajectory.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(darkTheme),
      child: const MyApp(),
    ),
  );
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  dividerColor: Colors.white54,
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'My Personal Portfolio',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'My Personal Portfolio'),
        "/AboutMe": (context) => const AboutMePage(),
        "/Portfolio": (context) => const PortfolioPage(),
        "/Trajectory": (context) => const TrajectoryPage(),
        "/ContactMe": (context) => const ContactPage()
      },
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
  bool darkMode = true;

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    darkMode = (themeNotifier.getTheme() == darkTheme);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Personal Portfolio",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: FlutterSwitch(
                value: darkMode,
                onToggle: (bool val) {
                  setState(() {
                    darkMode = val;
                  });
                  onThemeChanged(val, themeNotifier);
                },
                inactiveIcon: const Icon(
                  CupertinoIcons.brightness_solid,
                  color: Colors.orangeAccent,
                ),
                inactiveColor: Colors.orangeAccent,
                activeColor: Colors.indigo,
                activeIcon: const Icon(
                  CupertinoIcons.moon_fill,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.home, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.person, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "About Me",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.bag_fill, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Portfolio",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.device_laptop, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Trajectory",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.phone, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Contact",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          HomePage(),
          AboutMePage(),
          PortfolioPage(),
          TrajectoryPage(),
          ContactPage(),
        ]),
      ),
    );
  }
}
