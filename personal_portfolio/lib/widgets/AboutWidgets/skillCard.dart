// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  const SkillCard(
      {super.key,
      required this.name,
      required this.icon,
      this.flag = "",
      required this.description,
      required this.color,
      required this.expertise});

  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final int expertise;
  final String flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary, width: 5)),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Flexible(
              flex: 20,
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(flex: 5),
            Flexible(
              flex: 50,
              child: FloatingActionButton.large(
                backgroundColor: color,
                elevation: 50,
                onPressed: null,
                child: flag == ""
                    ? Icon(
                        icon,
                        size: MediaQuery.of(context).size.height * 0.075,
                        color: Colors.black,
                      )
                    : CircleFlag(flag,
                        size: MediaQuery.of(context).size.height * 0.075),
              ),
            ),
            const Spacer(flex: 5),
            Flexible(
              flex: 20,
              child: Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const Spacer(flex: 10),
            Flexible(
              flex: 20,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  for (int i = 1; i < expertise + 1; i++)
                    Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.yellow,
                      size: MediaQuery.of(context).size.width >
                              MediaQuery.of(context).size.height
                          ? MediaQuery.of(context).size.width * 0.025
                          : MediaQuery.of(context).size.width * 0.05,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
