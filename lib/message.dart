
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Friend {
String name;
 String avatar;
Friend(this.name,this.avatar);
}

class Message extends StatelessWidget {
  final String emptyImage = 'assets/images/empty_message.svg';

  List <Friend> friendLIst=[
    Friend("Anna", "assets/images/profile1.png"),
    Friend("Adil", "assets/images/profile2.png"),
    Friend("Marina", "assets/images/profile3.png"),
    Friend("Dean", "assets/images/profile4.jpeg"),
    Friend("Max", "assets/images/profile5.png")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 64, 87, 1),
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: const Color.fromRGBO(233, 64, 87, 1),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(33),
            child:const Column(children: [ Text(
              "Messages",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
            ],)
            
             
          ),
          if(friendLIst.isNotEmpty)  Row(
            children: [for (Friend friend in friendLIst) Container( width: 50, height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
             child:Image.asset(friend.avatar,
             fit: BoxFit.cover,
             )
            ) ],
          ) ,
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(top: 100.0, bottom: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: double.infinity),
                  SvgPicture.asset(emptyImage),
                  const SizedBox(height: 16.0),
                  const SizedBox(
                    width: double.infinity,
                    height: 70,
                  ),
                  const Text(
                    'You have no message yet',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
