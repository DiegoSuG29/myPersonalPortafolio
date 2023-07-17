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
          border: Border.all(color: Colors.black, width: 5)),
      width: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            FloatingActionButton.large(
              backgroundColor: color,
              elevation: 50,
              onPressed: null,
              child: flag == ""
                  ? Icon(
                      icon,
                      size: 55,
                      color: Colors.black,
                    )
                  : CircleFlag(flag, size: 55),
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                for (int i = 1; i < expertise + 1; i++)
                  const Icon(
                    CupertinoIcons.star_fill,
                    color: Colors.yellow,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
