import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/themeNotifier.dart';
import 'package:personal_portfolio/widgets/HomePageWidgets/homePage.dart';
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

//DARK THEME
final darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        color: Color(0xff000e14),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 14)),
    tabBarTheme: const TabBarTheme(
      labelColor: Color.fromARGB(255, 1, 152, 254),
      unselectedLabelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 18),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      indicatorColor: Color.fromARGB(255, 1, 152, 254),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black).copyWith(
        brightness: Brightness.dark,
        background: const Color(0xff001b29),
        primary: Colors.black,
        secondary: Colors.grey,
        tertiary: const Color(0xFF00377e),
        primaryContainer: const Color.fromARGB(255, 1, 152, 254),
        inversePrimary: Colors.white),
    //ColorScheme
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.white,
          wordSpacing: 2),
      titleMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: Colors.white),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 26,
          wordSpacing: 3),
      bodySmall: TextStyle(color: Colors.white, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return const Color.fromARGB(255, 1, 152, 254);
            }
            return Colors.white;
          },
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white;
            }
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return const Color.fromARGB(255, 1, 152, 254);
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
            }
            return const TextStyle(fontSize: 14);
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.black;
            }
            return Colors.white;
          },
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color.fromARGB(255, 1, 152, 254)));

//LIGHT THEME
final lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 1, 152, 254),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 14)),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 18),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      indicatorColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(
        brightness: Brightness.light,
        background: const Color(0xffAEE2FF),
        primary: Colors.white,
        secondary: const Color(0xff1D5D9B),
        tertiary: const Color.fromARGB(255, 99, 212, 253),
        primaryContainer: const Color.fromARGB(255, 1, 152, 254),
        inversePrimary: Colors.black), //ColorScheme
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.black,
          wordSpacing: 2),
      titleMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: Colors.black),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 26,
          wordSpacing: 3),
      bodySmall: TextStyle(color: Colors.black, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return const Color.fromARGB(255, 1, 152, 254);
            }
            return Colors.black;
          },
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return const Color.fromARGB(255, 1, 152, 254);
            }
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.lightBlue[100];
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
            }
            return const TextStyle(fontSize: 14);
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white;
            }
            return Colors.black;
          },
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color.fromARGB(255, 1, 152, 254)));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'My Personal Portfolio',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      home: const MyHomePage(
        title: "My Personal Portfolio",
      ),
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
                activeColor: Colors.indigoAccent,
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
                  Icon(CupertinoIcons.home),
                  SizedBox(width: 10),
                  Text(
                    "Home",
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.person),
                  SizedBox(width: 10),
                  Text(
                    "About Me",
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.bag_fill),
                  SizedBox(width: 10),
                  Text(
                    "Portfolio",
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.device_laptop),
                  SizedBox(width: 10),
                  Text(
                    "Trajectory",
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.phone),
                  SizedBox(width: 10),
                  Text(
                    "Contact",
                  ),
                ],
              ),
            ),
          ]),
        ),
        body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
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
