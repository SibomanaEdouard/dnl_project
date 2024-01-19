import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class NotificationState {
  String title;
  bool selected;
  NotificationState(this.title, this.selected);
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController bioController = TextEditingController();
  List<NotificationState> newMessages = [
    NotificationState("Push notifications", false),
    NotificationState("In-app notifications", false),
    NotificationState("Email", false)
  ];

  List<NotificationState> newMatches = [
    NotificationState("Push notifications", false),
    NotificationState("In-app notifications", false),
    NotificationState("Email", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              const Text(
                "New Matches",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              for (NotificationState notification in newMatches)
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 17),
                      decoration:
                          const BoxDecoration(color: Color(0xfff8f8f8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notification.title,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Switch(
                          activeTrackColor: Color(0xffe94057),
                            activeColor: Colors.white,
                            value: notification.selected,
                            onChanged: (bool value) {
                              setState(() {
                                notification.selected = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                  ],
                  
                ),
                 SizedBox(height: 20,),
              const Text(
                "New messages",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              for (NotificationState notification in newMessages)
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 17),
                      decoration:
                          const BoxDecoration(color: Color(0xfff8f8f8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notification.title,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Switch(
                          activeTrackColor: Color(0xffe94057),
                            activeColor: Colors.white,
                            value: notification.selected,
                            onChanged: (bool value) {
                              setState(() {
                                notification.selected = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}



