import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InsideCall extends StatefulWidget {
  @override
  _InsideCallState createState() => _InsideCallState();
}

class _InsideCallState extends State<InsideCall> {
  bool isMicOn = true;
  bool isVideoOn = true;
  bool isVolumeVisible = false;
  bool isVolumeOn = true;
  bool isCommentShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background image (caller's video)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/incall_background.jpeg'), // Replace with the actual image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Current user's video at top right
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/profile1.png'), // Replace with the actual image asset
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Mic and Video icons
          Positioned(
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration:
                         BoxDecoration(color: Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(24)),
                    width: 48,
                    height: 48,
                    child: IconButton(
                      icon: isMicOn
                          ? SvgPicture.asset('assets/icons/mic-on.svg')
                          : SvgPicture.asset('assets/icons/mic-off.svg'),
                      onPressed: () {
                        setState(() {
                          isMicOn = !isMicOn;
                        });
                      },
                    )),
                    const SizedBox(width: 20),
                Container(
                    width: 48,
                    height: 48,
                    decoration:
                         BoxDecoration(color: Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(24)),
                    child: IconButton(
                      icon: isVolumeOn
                          ? const Icon(
                              CupertinoIcons.volume_up,
                              color: Colors.white,
                            )
                          : const Icon(
                              CupertinoIcons.volume_off,
                              color: Colors.white,
                            ),
                      onPressed: () {
                        setState(() {
                          isVolumeOn = !isVolumeOn;
                        });
                      },
                    )),
                    const SizedBox(width: 20),
                Container(
                  width: 48,
                  height: 48,
                  decoration:
                       BoxDecoration(color: Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(24)),
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.bubble_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isCommentShow = !isCommentShow;
                      });
                    },
                  ),
                ),
               const SizedBox(width: 20),
                Container(
                  width: 48,
                  height: 48,
                  decoration:
                      BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(24)),
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isCommentShow = !isCommentShow;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Volume icon and control container

          // Volume control container
        ],
      ),
    );
  }
}
