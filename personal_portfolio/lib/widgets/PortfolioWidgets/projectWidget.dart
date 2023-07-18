import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'dart:html' as html;

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.title,
    required this.description,
    this.githubLink = "",
    this.demoLink = "",
    this.img = "NoIMG",
    required this.stack,
  });

  final String title;
  final String description;
  final String img;
  final String githubLink;
  final String demoLink;
  final List<IconData> stack;

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    return Card(
      color: coloring.primary,
      margin: const EdgeInsets.all(16.0),
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          img == "NoIMG"
              ? const Center(
                  child: Icon(
                    CupertinoIcons.folder_fill,
                    size: 200,
                  ),
                )
              : Image.asset(
                  img,
                  fit: BoxFit.contain,
                  height: 225,
                  width: 225,
                ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 275,
                  child: RichText(
                    text: TextSpan(
                        text: description,
                        style: TextStyle(
                          fontSize: 16,
                          color: coloring.inversePrimary,
                        )),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Stack: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (IconData i in stack) Icon(i),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    githubLink == ""
                        ? const SizedBox()
                        : IconButton(
                            onPressed: () {
                              html.window.open(githubLink, 'new tab');
                            },
                            icon: const Icon(SimpleIcons.github),
                            iconSize: 25,
                          ),
                    const SizedBox(width: 8.0),
                    demoLink == ""
                        ? const SizedBox()
                        : IconButton(
                            onPressed: () {
                              html.window.open(demoLink, 'new tab');
                            },
                            icon: const Icon(SimpleIcons.youtube),
                            iconSize: 25,
                          ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
