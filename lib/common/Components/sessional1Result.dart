import 'package:flutter/material.dart';
import 'package:stigma/common/Components/container.dart';

class Sessional1Result extends StatelessWidget {
  const Sessional1Result({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 22, right: 15, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subject-Wise Marks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            ContainerBuilder.buildFlexContainer(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 234, 233, 233),
                width: 1,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 8,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Semester 1",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "Mathematics",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Marks: 85/100",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/Maths.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ContainerBuilder.buildFlexContainer(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 234, 233, 233),
                width: 1,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 8,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Semester 1",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "Physics",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Marks: 78/100",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/Physics.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ContainerBuilder.buildFlexContainer(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 234, 233, 233),
                width: 1,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 8,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Semester 1",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "Chemistry",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Marks: 92/100",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/Chemistry.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ContainerBuilder.buildFlexContainer(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 234, 233, 233),
                width: 1,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 8,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Semester 1",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "English",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Marks: 88/100",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/English.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ContainerBuilder.buildFlexContainer(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 234, 233, 233),
                width: 1,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 8,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Semester 1",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "Computer Science",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Marks: 85/100",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/Computer_science.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "GPA Calculation",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 3),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total", style: TextStyle(color: Colors.grey[700])),
                      Text(
                        "Credits :",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text("20"),
                    ],
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total", style: TextStyle(color: Colors.grey[700])),
                      Text(
                        "Points :",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text("180"),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("GPA ", style: TextStyle(color: Colors.grey[700])),
                      Text("9.0"),
                    ],
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ispum ", style: TextStyle(color: Colors.grey[700])),
                      Text("9.0"),
                    ],
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ipsum", style: TextStyle(color: Colors.grey[700])),
                      Text("9.0"),
                    ],
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
