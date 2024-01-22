import 'package:flutter/material.dart';

class NoMatch extends StatefulWidget {
  const NoMatch({Key? key}) : super(key: key);

  @override
  _NoMatchState createState() => _NoMatchState();
}

class _NoMatchState extends State<NoMatch> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/empty_matches@2x.png",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You have no matches yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
