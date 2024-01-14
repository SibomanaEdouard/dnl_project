import 'dart:ui';
import 'package:dnl_ui/components/InsideCall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool isCalling = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/call_background.jpeg',
            fit: BoxFit.cover,
          ),
          // Blur effect using BackdropFilter
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 22.5, sigmaY: 22.5),
            child: Container(
              color: Colors.black.withOpacity(0.1),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/profile3.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Alan",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  Column(
children: [
  Container(),
  if(isCalling) const Text(
                    "Calling....",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )
  
  else const Text(
                    "Video call....",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
  
  ],
                  ),
                  
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 54),
                        child: IconButton(
                          icon: SvgPicture.asset('assets/icons/mic-off.svg'),
                          onPressed: () => {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 54),
                        child: IconButton(
                          icon: SvgPicture.asset('assets/icons/camera-off.svg'),
                          onPressed: () => {},
                        ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/icons/switch-camera.svg'),
                        onPressed: () => {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffed442c),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset('assets/icons/reject-call.svg'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      if (!isCalling)
                        Container(
                          
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(top: 40,left: 52),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xff1ED760),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset('assets/icons/accept-call.svg'),
                            onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return InsideCall();
                          }),
                        ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
