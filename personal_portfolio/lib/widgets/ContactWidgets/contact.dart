// ignore_for_file: avoid_web_libraries_in_flutter, non_constant_identifier_names

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
  ScrollController horizontalController = ScrollController();

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
      //
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
    scrollbarController.dispose();
    horizontalController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coloring = Theme.of(context).colorScheme;
    final textStyling = Theme.of(context).textTheme;
    return MediaQuery.of(context).size.width <
            MediaQuery.of(context).size.height
        ? ContactPageMobile(context, coloring, textStyling)
        : ContactPageDesktop(context, coloring, textStyling);
  }

  Padding ContactPageMobile(
      BuildContext context, ColorScheme coloring, TextTheme textStyling) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.height * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                foregroundDecoration: BoxDecoration(
                    border: Border.all(width: 20, color: coloring.tertiary),
                    borderRadius: BorderRadius.circular(150)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: const Image(image: AssetImage("assets/images/me.jpg")),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Card(
                color: coloring.primary,
                elevation: 50,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Contact Me",
                        style: textStyling.titleMedium,
                      ),
                      const Text(
                        "Get my information, socials, and where you can find me",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Card(
                color: coloring.primary,
                elevation: 50,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.45,
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
                            enableButton = _formKey.currentState!.validate();
                          });
                        }),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          child: Column(
                            children: [
                              Text(
                                "Contact me from here!",
                                style: textStyling.titleSmall,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  icon: const Icon(CupertinoIcons.person),
                                  labelText: "Your E-mail",
                                  labelStyle:
                                      TextStyle(color: coloring.inversePrimary),
                                  iconColor: coloring.inversePrimary,
                                ),
                                style:
                                    TextStyle(color: coloring.inversePrimary),
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
                                  labelStyle:
                                      TextStyle(color: coloring.inversePrimary),
                                  iconColor: coloring.inversePrimary,
                                ),
                                style:
                                    TextStyle(color: coloring.inversePrimary),
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
                                  onPressed: enableButton ? sendEmail : null,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
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
                      FittedBox(
                        child: Icon(
                          CupertinoIcons.book_circle_fill,
                          size: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          downloadFile("assets/documents/DiegoSu-CV.pdf");
                        },
                        icon: const Icon(CupertinoIcons.download_circle_fill),
                        label: const Text("Download Now"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              RawScrollbar(
                controller: horizontalController,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: SingleChildScrollView(
                  controller: horizontalController,
                  scrollDirection: Axis.horizontal,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding ContactPageDesktop(
      BuildContext context, ColorScheme coloring, TextTheme textStyling) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          children: [
            Flexible(
              flex: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                      foregroundDecoration: BoxDecoration(
                          border:
                              Border.all(width: 20, color: coloring.tertiary),
                          borderRadius: BorderRadius.circular(150)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: const Image(
                            image: AssetImage("assets/images/me.jpg")),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: Card(
                      color: coloring.primary,
                      elevation: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                "Contact Me",
                                style: textStyling.titleMedium,
                              ),
                            ),
                            const Spacer(),
                            const Flexible(
                              flex: 2,
                              child: Text(
                                  "Get my information, socials, and where you can find me",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 5),
            Flexible(
              flex: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Card(
                      color: coloring.primary,
                      elevation: 50,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.45,
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
                                    Text(
                                      "Contact me from here!",
                                      style: textStyling.titleSmall,
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
                  ),
                  Flexible(
                    child: Card(
                      color: coloring.primary,
                      elevation: 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Column(
                          children: [
                            const Flexible(
                              flex: 2,
                              child: Text(
                                "Download My CV",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            const Spacer(),
                            const Flexible(
                              flex: 8,
                              fit: FlexFit.tight,
                              child: FittedBox(
                                child: Icon(
                                  CupertinoIcons.book_circle_fill,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Flexible(
                              flex: 2,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    downloadFile(
                                        "assets/documents/DiegoSu-CV.pdf");
                                  },
                                  icon: const Icon(
                                      CupertinoIcons.download_circle_fill),
                                  label: const Text("Download Now")),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            const Flexible(
              flex: 25,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ),
          ],
        ),
      ),
    );
  }
}
