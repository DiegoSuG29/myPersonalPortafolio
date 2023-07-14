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
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return Container(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            alignment: Alignment.topLeft,
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
                            color: Colors.black87),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5, right: 5),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Close",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff999999),
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
                        color: Color(0xfff8f8f8),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text: widget.school,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                                wordSpacing: 1)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(text: widget.description),
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
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.done ? Colors.grey.shade100 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image(
              image: AssetImage(widget.img),
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                widget.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: () => _showModal(context),
              icon: const Icon(CupertinoIcons.add_circled_solid),
              iconSize: 25,
            )
          ],
        ),
      ),
    );
  }
}
