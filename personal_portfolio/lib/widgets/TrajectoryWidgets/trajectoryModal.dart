// ignore_for_file: file_names, avoid_web_libraries_in_flutter

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class TrajectoryModal extends StatefulWidget {
  const TrajectoryModal(
      {super.key,
      required this.job,
      required this.name,
      required this.school,
      required this.img,
      required this.years,
      this.gpa = "",
      this.done = false,
      required this.location,
      this.description = "",
      this.link = ""});

  final bool job;
  final String name;
  final String school;
  final String img;
  final String years;
  final String gpa;
  final bool done;
  final String location;
  final String link;
  final String description;

  @override
  State<TrajectoryModal> createState() => _TrajectoryModalState();
}

class _TrajectoryModalState extends State<TrajectoryModal> {
  _showModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        final coloring = Theme.of(context).colorScheme;
        return Container(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: coloring.tertiary,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Close",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: coloring.inversePrimary,
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                text: widget.school,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  wordSpacing: 1,
                                  color: coloring.inversePrimary,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage(widget.img),
                            width: 100,
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.location_solid),
                                Text(
                                  widget.location,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.calendar),
                                Text(
                                  widget.years,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: widget.job
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: widget.description,
                                            style: TextStyle(
                                                color:
                                                    coloring.inversePrimary)),
                                        textAlign: TextAlign.justify,
                                      )
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "GPA: ",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        widget.gpa,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                          ),
                          widget.link == ""
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            html.window
                                                .open(widget.link, 'new tab');
                                          },
                                          icon: const Icon(CupertinoIcons.link))
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    return Card(
      color: coloring.tertiary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: FittedBox(
                child: Image(
                  image: AssetImage(widget.img),
                  width: MediaQuery.of(context).size.height * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: IconButton(
                onPressed: () => _showModal(context),
                icon: const Icon(CupertinoIcons.add_circled_solid),
                iconSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
