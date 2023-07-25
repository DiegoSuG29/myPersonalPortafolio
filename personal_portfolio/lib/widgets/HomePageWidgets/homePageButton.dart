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
              flex: 2,
              child: Text(
                title,
                style: textStyling.titleSmall,
              ),
            ),
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: FittedBox(
                child: Icon(
                  icon,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: textStyling.bodySmall,
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: IconButton(
                  onPressed: () =>
                      DefaultTabController.of(context).animateTo(index),
                  icon: const Icon(CupertinoIcons.arrow_right),
                  iconSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
