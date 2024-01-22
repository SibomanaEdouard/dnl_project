import 'package:flutter/material.dart';

class GrideView extends StatelessWidget {
  GrideView({super.key});

  List<String> images = [
    'Alternative',
    'Classical',
    'K-Pop',
    'Techno',
    'Jazz',
    'Folk',
    'Soul',
    'Metal',
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Alternative',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Classical',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'K-Pop',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Techno',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Jazz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Folk',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Soul',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          color: Color(0xC8E94057),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Metal',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
