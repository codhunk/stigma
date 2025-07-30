

import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class MessagesInfo {
  final String picture;
  final String name;
  final String messagesUpdation;
  final String onTime;
  final int numberOfMessages;
  final String fullMessage; // Added a full message field for the expanded view

  MessagesInfo({
    required this.picture,
    required this.name,
    required this.messagesUpdation,
    required this.onTime,
    required this.numberOfMessages,
    required this.fullMessage, // Constructor updated to include full message
  });
}

List<MessagesInfo> messagesList = [
  MessagesInfo(
    picture: "Male06.png",
    name: "Jalandhar Raur",
    messagesUpdation: "You receive the message 1 hr ago",
    onTime: "10:30 PM",
    numberOfMessages: 2,
    fullMessage:
        "Here is the full message content for Jalandhar Raur. It's a detailed message with more information.",
  ),
  MessagesInfo(
    picture: "Female16.png",
    name: "Shilajit Acharjee",
    messagesUpdation: "You received the message on Wednesday",
    onTime: "01:10 PM",
    numberOfMessages: 2,
    fullMessage:
        "Here is the full message content for Shilajit Acharjee. More details about the message.",
  ),
  MessagesInfo(
    picture: "Male06.png",
    name: "Anmol Rana",
    messagesUpdation: "Just now",
    onTime: "02:35 PM",
    numberOfMessages: 2,
    fullMessage:
        "Here is the full message content for Anmol Rana. More details about the message.",
  ),
  MessagesInfo(
    picture: "Female16.png",
    name: "Vikash Yadav",
    messagesUpdation: "18 February",
    onTime: "11:32 PM",
    numberOfMessages: 2,
    fullMessage:
        "Here is the full message content for Vikash Yadav. More details about the message.",
  ),
];

class _ChatScreenState extends State<ChatScreen> {
  // List to keep track of expanded states for each message
  List<bool> expandedState = List.generate(
    messagesList.length,
    (index) => false,
  );

  // List to keep track of read status of each message
  List<bool> messageReadState = List.generate(
    messagesList.length,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        title: Text(
          "Messages",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Inter',
          ),
        ),
        toolbarHeight: 70.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    MessagesInfo message = messagesList[index];

                    return GestureDetector(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            expandedState[index] = !expandedState[index];
                            // Mark the message as read when tapped
                            messageReadState[index] = true;
                          });
                        }
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // First Column: Picture (Logo)
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: Image(
                                        image: AssetImage(
                                          dark
                                              ? AppImages.darkAppLogo
                                              : AppImages.lightAppLogo,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  // Second Column: Name and Message Update
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message.name,
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          message.messagesUpdation,
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 13,
                                            color: Colors.black.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Third Column: On Time and Number of Messages
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        message.onTime,
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Display number of messages only if the message is not read
                                      if (!messageReadState[index])
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Color(0xff800020),
                                          child: Text(
                                            message.numberOfMessages.toString(),
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),

                              // Expanded Section
                              if (expandedState[index]) ...[
                                SizedBox(height: 10),
                                Text(
                                  message.fullMessage,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
