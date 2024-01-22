import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileOverview extends StatefulWidget {
  final String userID;

  const ProfileOverview({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  _ProfileOverviewState createState() => _ProfileOverviewState();
}

class _ProfileOverviewState extends State<ProfileOverview> {
  String _userID = "";

  void initState() {
    _userID = widget.userID;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: RawScrollbar(
            thumbColor: const Color(0xFFEB9BA6),
            radius: const Radius.circular(23),
            thickness: 6,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: Image.asset(
                      "assets/avatars/1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: const Color.fromARGB(255, 194, 166, 166),
                        child: const Column(
                          children: [
                            Text(
                              "Jessica Parker, 24",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Jessica Parker, 24",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Jessica Parker, 24",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
