import 'package:flutter/material.dart';
import 'dart:html' as html;

class ContactCard extends StatelessWidget {
  const ContactCard(
      {super.key,
      required this.name,
      required this.value,
      required this.icon,
      this.link = ""});

  final String name;
  final String value;
  final IconData icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    return Card(
      color: coloring.primary,
      elevation: 50,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, bottom: 7),
              child: Row(
                children: [
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            link == ""
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                        onPressed: () {
                          html.window.open(link, 'new tab');
                        },
                        child: const Text("Visit")),
                  )
          ],
        ),
      ),
    );
  }
}
