// ignore_for_file: prefer_const_constructors

import 'package:dnl_ui/pages/messageFlow/Chat.dart';
import 'package:dnl_ui/pages/messageFlow/Message.dart';
import 'package:dnl_ui/pages/notificationFlow/notification.dart';
import 'package:dnl_ui/pages/settingFlow/setting_main.dart';
import 'package:dnl_ui/pages/subscriptionFlow/SubscriptionPage.dart';
import 'package:dnl_ui/pages/subscriptionFlow/payment/Payment.dart';
import 'package:flutter/material.dart';

import 'pages/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the welcome screen as the home page
     
      //  home: MessagePage(),
      // home:ChatScreen(),
      // home:SubscriptionPage(),
      // home: Payment(),
    
      home: NotificationPage(),
      
      // Optional: Remove the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}

