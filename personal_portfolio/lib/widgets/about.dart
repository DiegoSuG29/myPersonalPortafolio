import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

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
      body: Text("About Me"),
    );
  }
}
