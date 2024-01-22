
import 'package:dnl_ui/main/profile_overview.dart';
import 'package:dnl_ui/main/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class GenrePage extends StatefulWidget {
  final String genre;
  const GenrePage({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  String _genre = "Alternative";

  @override
  void initState() {
    _genre = widget.genre;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 255, 255, 255),
          // padding:  EdgeInsets.only(top: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 55,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Image.asset(
                                "assets/icons/previous_icon.png",
                                width: 20,
                                height: 20,
                              ),
                              iconSize: 20,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Text(
                              _genre,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                "assets/icons/setting.png",
                                width: 20,
                                height: 20,
                              ),
                              iconSize: 20,
                              onPressed: () {
                                print("hi");
                              },
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                  ],
                ),
                // GenreList(),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const ProfileOverview(userID: "1")));
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                      ),
                      child: Dismissible(
                        key: Key("item"),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/avatars/1.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 15,
                                left: 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.5),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: Container(
                                        // width: 80,
                                        // width: double.infinity,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 6.0,
                                            top: 4.0,
                                            right: 8.0,
                                            bottom: 4.0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/location.png",
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            const Text(
                                              "1mi away",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: Container(
                                      width: 80,
                                      // width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                  bottom: 24,
                                  left: 20,
                                  child: Text(
                                    "Jessica Parker, 24",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )),
                              const Positioned(
                                  bottom: 12,
                                  left: 20,
                                  child: Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                    size: 12,
                                  )),
                              const Positioned(
                                  bottom: 6,
                                  left: 36,
                                  child: Text(
                                    "Recently Active",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        // Perform "Like" action
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Ask for Dance?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const BottomNavBar(
                  selectedIndex: 0,
                ),
              ]),
        ),
      ),
    );
  }
}
