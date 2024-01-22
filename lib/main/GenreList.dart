
import 'package:dnl_ui/main/GenrePage.dart';
import 'package:flutter/material.dart';

class GenreList extends StatefulWidget {
  const GenreList({Key? key}) : super(key: key);

  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  List<String> genres = [
    'Alternative',
    'Classical',
    'K-Pop',
    'Techno',
    'Jazz',
    'Indie',
    'Blues',
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
          thumbColor: Color(0xFFEB9BA6),
          radius: const Radius.circular(23),
          thickness: 6,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
            child: buildList(),
          ),
        ),
      ),
    );
  }

  Column buildList() {
    int cnt = genres.length;
    int rcnt = cnt ~/ 2 + cnt % 2;

    List<Column> cols = [];

    for (int r = 0; r < rcnt; r++) {
      cols.add(Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left column
              GestureDetector(
                onTap: () {
                  gotoGenre(genres[2 * r]);
                },
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: const BoxDecoration(
                    // color: Color(0xC8E94057),

                    color: Color(0xC8E94057),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/${genres[2 * r]}.png',
                      height: 28,
                      fit: BoxFit.fitHeight,
                    ),
                    // child: Text(
                    //   genres[2 * r],
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ),
                ),
              ),

              //right column
              if (r * 2 + 1 < cnt)
                GestureDetector(
                  onTap: () {
                    gotoGenre(genres[2 * r + 1]);
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                        color: Color(0xC8E94057),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/${genres[2 * r + 1]}.png',
                          height: 28,
                          fit: BoxFit.fitHeight,
                        )
                        // child: Text(
                        //   genres[2 * r + 1],
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.white,
                        //   ),
                        // ),
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

  void gotoGenre(String genre) {
    print(genre);
    if (genre != "") {
      Navigator.of(context).push<void>(
        MaterialPageRoute(
            builder: (context) => GenrePage(
                  genre: genre,
                )
            // const BottomNavigationBarExampleApp()
            ),
      );
    }
  }
}
