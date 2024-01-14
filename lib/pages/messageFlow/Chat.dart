import 'package:dnl_ui/components/call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Friend {
  String name;
  String status;

  Friend(this.name, this.status);
}

class Message {
  String description;
  DateTime date;
  Friend sender;
  Friend receiver;

  Message(this.sender, this.receiver, this.description, this.date);
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = []; // List to store chat messages
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: true, // Set this to true to show the back button
      
        title: const Row(
          children: [
             CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile1.png'),
            ),
            SizedBox(width: 10),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                Text('Active now', style: TextStyle(color: Color(0xff797c7b),fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/call.svg'),
            onPressed: () {
             Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CallScreen();
                          }),
                        );
            },
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/video_call.svg'),
            onPressed: () {
              // Handle video call button press
            },
          ),
        ],
      ),
      body:Container(padding: EdgeInsets.only(left: 10,right: 10),child:    Column(
        children: [
          // Chat messages display (you can replace this with your actual chat widget)
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                Message message = messages[index];

                // Check if the current message has the same sender as the previous one
                bool showProfile = true;
                if (index > 0 && messages[index - 1].sender == message.sender) {
                  showProfile = false;
                }

                if (message.sender.name == 'User Nam') {
                  // Message sent by the current user
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(
                        bottom: 8.0,
                        left: MediaQuery.of(context).size.width * 0.55,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.45,
                      ),
                      decoration:const BoxDecoration(
                        color:Color(0xffeb9ba6),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.description,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  // Message sent by another user
                  return ListTile(
                    leading: showProfile
                        ? const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile2.png'),
                          )
                        : null,
                    title: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.45,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showProfile)
                            Text(
                              message.sender.name,
                              style:const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration:const BoxDecoration(
                        color:Color(0xfff2f7fb),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            message.description,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                        ],
                      ),
                    ),
                    subtitle: Text(
                    
                      '${message.date.toLocal().hour}:${message.date.toLocal().minute}',
                    ),
                  );
                }
              },
            ),
          ),

          Container(
            padding: EdgeInsets.all(8.0),
          
            child: Row(
              children: [
                Container(
                  child: Expanded(
                      child: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      contentPadding: EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xffdddddd),
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset('assets/icons/send.svg'),
                        onPressed: () {
                          // Handle send button press
                          if (_textFieldController.text != null &&
                              _textFieldController.text != "") {
                            sendMessage(_textFieldController.text);
                          }
                        },
                      ),
                    ),
                    onSubmitted: (messageText) {
                      // Handle sending message when the user presses Enter
                      if (messageText.isNotEmpty) {
                        sendMessage(messageText);
                      }
                    },
                  )),
                ),

                IconButton(
                  icon: SvgPicture.asset('assets/icons/camera.svg'),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/mic.svg'),
                  onPressed: () {
                    // Handle mic button press
                  },
                ),
                // Camera icon
              ],
            ),
          ),
        ],
      ), )
   
    );
  }

  void sendMessage(String messageText) {
    // Get the current date and time
    DateTime currentDate = DateTime.now();

    // Create a sample friend (you can replace this with your own logic)
    Friend currentUser = Friend('User Name', 'Active');
    Friend otherUser = Friend('Friend Name', 'Active');

    // Create a new message
    Message newMessage = Message(
      currentUser,
      otherUser,
      messageText,
      currentDate,
    );

    // Add the new message to the list
    setState(() {
      messages.add(newMessage);
    });
  }
}
