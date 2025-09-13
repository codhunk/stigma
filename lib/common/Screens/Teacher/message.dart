import 'package:flutter/material.dart';

class TeacherMessagesScreen extends StatefulWidget {
  @override
  _TeacherMessagesScreenState createState() => _TeacherMessagesScreenState();
}

class _TeacherMessagesScreenState extends State<TeacherMessagesScreen> {
  List<Map<String, dynamic>> messages = [
    {
      "name": "Ethan Harper",
      "time": "10:30 AM",
      "image": "assets/images/jalandhar_raur.jpg",
      "unread": 4,
    },
    {
      "name": "Olivia Bennett",
      "time": "Yesterday",
      "image": "assets/images/jalandhar_raur.jpg",
      "unread": 1,
    },
    {
      "name": "Noah Carter",
      "time": "2 days ago",
      "image": "assets/images/jalandhar_raur.jpg",
      "unread": 0,
    },
    {
      "name": "Ava Thompson",
      "time": "3 days ago",
      "image": "assets/images/jalandhar_raur.jpg",
      "unread": 0,
    },
    {
      "name": "Liam Foster",
      "time": "4 days ago",
      "image": "assets/images/jalandhar_raur.jpg",
      "unread": 0,
    },
  ];

  void _markAsRead(int index) {
    setState(() {
      messages[index]['unread'] = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opened chat with ${messages[index]['name']}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: BackButton(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: messages.length,
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          final message = messages[index];
          return InkWell(
            onTap: () => _markAsRead(index),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(message['image']),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          message['time'],
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  if (message['unread'] > 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF5A49E3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${message['unread']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5A49E3),
        child: Icon(Icons.add, size: 28, color: Colors.white),
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("New message tapped")));
        },
      ),
    );
  }
}
