
import 'package:dnl_ui/main/GenreList.dart';
import 'package:dnl_ui/main/dashboard_page.dart';
import 'package:dnl_ui/main/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app_state.dart';

// import 'package:DNL/view/main/widgets/navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
            // padding:  EdgeInsets.only(top: 20),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardPage(),
                  GenreList(),
                  BottomNavBar(selectedIndex: 0,),
                ]),
          ),
        ),
      ),
    );
  }
}
