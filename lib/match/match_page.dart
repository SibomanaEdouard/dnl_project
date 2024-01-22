import 'dart:async';

import 'package:dnl_ui/main/widgets/bottom_navigation_bar.dart';
import 'package:dnl_ui/match/match_list.dart';
import 'package:dnl_ui/match/no_match.dart';
import 'package:flutter/material.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  late Timer _timer;
  int cnt = 0;
  bool matchfound = false;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        cnt++;
        if (cnt == 3) {
          _timer.cancel();
          matchfound = true;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        SizedBox(
                          height: 66,
                        ),
                        Text(
                          'Matches',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, top: 0, right: 20, bottom: 0),
                          child: Text(
                            'This is a list of people who have liked you and your matches.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    // MatchList(),
                    // NoMatch(),

                    matchfound == true ? const MatchList() : const NoMatch(),

                    const BottomNavBar(selectedIndex: 1),
                  ],
                ))));
  }
}

class MatchPerson {
  String name;
  int age;
  String image;
  bool isLiked;
  bool isMatched;
  bool isFavorite;
  MatchPerson(
      {this.name = "",
      this.age = 0,
      this.image = "",
      this.isLiked = false,
      this.isMatched = false,
      this.isFavorite = false});
}
