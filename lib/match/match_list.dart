import 'dart:ui';


import 'package:dnl_ui/match/match_page.dart';
import 'package:flutter/material.dart';

class MatchList extends StatefulWidget {
  const MatchList({Key? key}) : super(key: key);

  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  List<MatchPerson> matches = [
    MatchPerson(
        name: 'Jessica',
        age: 21,
        image: 'assets/avatars/1.png',
        isLiked: true,
        isMatched: false,
        isFavorite: false),
    MatchPerson(
        name: 'Anna',
        age: 19,
        image: 'assets/avatars/2.png',
        isLiked: true,
        isMatched: true,
        isFavorite: true),
    MatchPerson(
        name: 'Elsa',
        age: 23,
        image: 'assets/avatars/3.png',
        isLiked: true,
        isMatched: false,
        isFavorite: true),
    MatchPerson(
        name: 'Jane',
        age: 22,
        image: 'assets/avatars/4.png',
        isLiked: true,
        isMatched: true,
        isFavorite: false),
    MatchPerson(
        name: 'Joyce',
        age: 24,
        image: 'assets/avatars/5.png',
        isLiked: true,
        isMatched: true,
        isFavorite: false),
    MatchPerson(
        name: 'Katelin',
        age: 20,
        image: 'assets/avatars/6.png',
        isLiked: true,
        isMatched: false,
        isFavorite: true),
    MatchPerson(
        name: 'Mozelle',
        age: 22,
        image: 'assets/avatars/7.png',
        isLiked: true,
        isMatched: true,
        isFavorite: true),
    MatchPerson(
        name: 'Elza',
        age: 23,
        image: 'assets/avatars/8.png',
        isLiked: true,
        isMatched: false,
        isFavorite: true),
    MatchPerson(
        name: 'Gerda',
        age: 26,
        image: 'assets/avatars/9.jpg',
        isLiked: true,
        isMatched: true,
        isFavorite: false),
  ];

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
        child: RawScrollbar(
          thumbColor: const Color(0xFFEB9BA6),
          radius: const Radius.circular(23),
          thickness: 6,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
            child: buildList(),
          ),
        ),
      ),
    );
  }

  Column buildList() {
    int cnt = matches.length;
    int rcnt = cnt ~/ 2 + cnt % 2;

    List<Column> cols = [];

    for (int r = 0; r < rcnt; r++) {
      cols.add(Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left column
              Container(
                width: 160,
                height: 200,
                decoration: const BoxDecoration(
                    color: Color(0xC8E94057),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Image.asset(
                        matches[r * 2].image,
                        width: 160,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 130,
                        left: 20,
                        child: Text(
                          "${matches[r * 2].name}, ${matches[r * 2].age}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 160,
                        left: 0,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                border: const Border(
                                  right: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 160,
                        left: 80,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                border: const Border(
                                  left: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //dislike button
                      Positioned(
                          top: 157,
                          left: 18,
                          child: IconButton(
                            icon: Image.asset(
                              "assets/icons/dislike.png",
                              width: 20,
                              height: 20,
                            ),
                            iconSize: 20,
                            onPressed: () {
                              showDislikeAlert();
                            },
                          )),
                      //like button
                      if (matches[r * 2].isFavorite)
                        Positioned(
                          top: 157,
                          right: 18,
                          child: IconButton(
                            icon: Image.asset(
                              "assets/icons/like_red.png",
                              width: 20,
                              height: 20,
                            ),
                            iconSize: 20,
                            onPressed: () {
                              // showLikeAlert();
                            },
                          ),
                        ),
                      if (!matches[r * 2].isFavorite)
                        Positioned(
                            top: 157,
                            right: 18,
                            child: IconButton(
                              icon: Image.asset(
                                "assets/icons/like_white.png",
                                width: 20,
                                height: 20,
                              ),
                              iconSize: 20,
                              onPressed: () {
                                showLikeAlert();
                              },
                            )),
                      //match badge
                      if (matches[r * 2].isMatched)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 255, 0, 0),
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              //right column
              if (r * 2 + 1 < cnt)
                Container(
                  width: 160,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xC8E94057),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(
                          matches[r * 2 + 1].image,
                          width: 160,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 130,
                          left: 20,
                          child: Text(
                            "${matches[r * 2 + 1].name}, ${matches[r * 2 + 1].age}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 160,
                          left: 0,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  border: const Border(
                                    right: BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 160,
                          left: 80,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  border: const Border(
                                    left: BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //dislike button
                        Positioned(
                          top: 157,
                          left: 18,
                          child: IconButton(
                            icon: Image.asset(
                              "assets/icons/dislike.png",
                              width: 20,
                              height: 20,
                            ),
                            iconSize: 20,
                            onPressed: () {
                              showDislikeAlert();
                            },
                          ),
                        ), //like button
                        if (matches[r * 2 + 1].isFavorite)
                          Positioned(
                            top: 157,
                            right: 18,
                            child: IconButton(
                              icon: Image.asset(
                                "assets/icons/like_red.png",
                                width: 20,
                                height: 20,
                              ),
                              iconSize: 20,
                              onPressed: () {
                                // showLikeAlert();
                              },
                            ),
                          ),
                        if (!matches[r * 2 + 1].isFavorite)
                          Positioned(
                            top: 157,
                            right: 18,
                            child: IconButton(
                              icon: Image.asset(
                                "assets/icons/like_white.png",
                                width: 20,
                                height: 20,
                              ),
                              iconSize: 20,
                              onPressed: () {
                                showLikeAlert();
                              },
                            ),
                          ),
                        if (matches[r * 2 + 1].isMatched)
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ));
    }
    return Column(
      children: [
        for (Column col in cols) col,
      ],
    );
  }

  void showDislikeAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Are you sure you want to dislike?',
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Perform "OK" action
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
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
                      'Dislike',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showLikeAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Are you sure you want to dislike?',
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Perform "OK" action
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
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
                      'Like',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
