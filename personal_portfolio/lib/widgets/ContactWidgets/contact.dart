// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'contactCard.dart';
import 'package:emailjs/emailjs.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  bool enableButton = false;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController subjectController = TextEditingController(text: "");
  TextEditingController messageController = TextEditingController(text: "");
  ScrollController scrollbarController = ScrollController();

  downloadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "CV";
    anchorElement.click();
  }

  Future<void> sendEmail() async {
    Map<String, dynamic> emailParams = {
      "email": emailController.text.trim(),
      "subject": subjectController.text.trim(),
      "message": messageController.text.trim(),
    };
    try {
      await EmailJS.send(
          "service_mty8a7q",
          "template_agihpf2",
          emailParams,
          const Options(
              publicKey: "QuZv2yNU-CGx2ZkSC",
              privateKey: "U5Vk5nJsvc3YQ3N-OpSdk"));
    } catch (error) {
      print(error.toString());
    }
    _showSimpleDialog();
  }

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            title: Text(
              'Success!',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            children: [
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "E-mail sent succesfully, thanks for reaching out!",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(height: 10),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(width: 20, color: coloring.tertiary),
                        borderRadius: BorderRadius.circular(150)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: const Image(
                          image: AssetImage("assets/images/me.jpg")),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Card(
                    color: coloring.primary,
                    elevation: 50,
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Contact Me",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                                "Get my information, socials, and where you can find me",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    color: coloring.primary,
                    elevation: 50,
                    child: SizedBox(
                      width: 1000,
                      height: 300,
                      child: RawScrollbar(
                        thumbColor: coloring.inversePrimary,
                        thumbVisibility: true,
                        scrollbarOrientation: ScrollbarOrientation.right,
                        controller: scrollbarController,
                        child: SingleChildScrollView(
                          controller: scrollbarController,
                          child: Form(
                            key: _formKey,
                            onChanged: (() {
                              setState(() {
                                enableButton =
                                    _formKey.currentState!.validate();
                              });
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                              child: Column(
                                children: [
                                  const Text(
                                    "Contact me from here!",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      icon: const Icon(CupertinoIcons.person),
                                      labelText: "Your E-mail",
                                      labelStyle: TextStyle(
                                          color: coloring.inversePrimary),
                                      iconColor: coloring.inversePrimary,
                                    ),
                                    style: TextStyle(
                                        color: coloring.inversePrimary),
                                    cursorColor: coloring.tertiary,
                                    controller: emailController,
                                    validator: ((value) {
                                      if (value!.isEmpty) {
                                        return 'Email is required';
                                      } else if (!value.contains('@')) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    }),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      icon: const Icon(CupertinoIcons.pencil),
                                      labelText: "Subject",
                                      labelStyle: TextStyle(
                                          color: coloring.inversePrimary),
                                      iconColor: coloring.inversePrimary,
                                    ),
                                    style: TextStyle(
                                        color: coloring.inversePrimary),
                                    cursorColor: coloring.tertiary,
                                    controller: subjectController,
                                    validator: ((value) {
                                      if (value!.isEmpty) {
                                        return 'Subject is required';
                                      }
                                      return null;
                                    }),
                                  ),
                                  TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Your Message",
                                        labelStyle: TextStyle(
                                          color: coloring.inversePrimary,
                                        ),
                                        iconColor: coloring.inversePrimary,
                                      ),
                                      style: TextStyle(
                                        color: coloring.inversePrimary,
                                      ),
                                      cursorColor: coloring.tertiary,
                                      maxLines: 2,
                                      controller: messageController,
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          setState(() {
                                            enableButton = true;
                                          });
                                          return 'Message is required';
                                        }
                                        return null;
                                      })),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ElevatedButton.icon(
                                      onPressed:
                                          enableButton ? sendEmail : null,
                                      icon: const Icon(
                                          CupertinoIcons.arrow_right_square),
                                      label: const Text("Send"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: coloring.primary,
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: Column(
                        children: [
                          const Text(
                            "Download My CV",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const Icon(
                            CupertinoIcons.book_circle_fill,
                            size: 200,
                          ),
                          ElevatedButton.icon(
                              onPressed: () {
                                downloadFile("assets/documents/DiegoSu-CV.pdf");
                              },
                              icon: const Icon(
                                  CupertinoIcons.download_circle_fill),
                              label: const Text("Download Now"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ContactCard(
                        name: "Email",
                        value: "diego.su@hotmail.com",
                        icon: CupertinoIcons.mail_solid),
                    ContactCard(
                        name: "Discord",
                        value: "diegosu.29",
                        icon: SimpleIcons.discord),
                    ContactCard(
                      name: "Instagram",
                      value: "diegosug",
                      icon: SimpleIcons.instagram,
                      link: "https://www.instagram.com/diegosug/",
                    ),
                    ContactCard(
                      name: "GitHub",
                      value: "DiegoSuG29",
                      icon: SimpleIcons.github,
                      link: "https://github.com/DiegoSuG29",
                    ),
                    ContactCard(
                      name: "Linked In",
                      value: "Diego Sú Gómez",
                      icon: SimpleIcons.linkedin,
                      link:
                          "https://www.linkedin.com/in/diego-s%C3%BA-g%C3%B3mez-455427227/",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
