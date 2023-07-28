// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.description,
      required this.index});

  final String title, description;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    final textStyling = Theme.of(context).textTheme;
    return Card(
      color: coloring.primary,
      elevation: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Text(
                title,
                style: textStyling.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              flex: 10,
              fit: FlexFit.tight,
              child: FittedBox(
                child: Icon(
                  icon,
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: textStyling.bodySmall,
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: IconButton(
                  onPressed: () =>
                      DefaultTabController.of(context).animateTo(index),
                  icon: const Icon(CupertinoIcons.arrow_right_circle_fill),
                  iconSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
