import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class VideoPhotoPage extends StatefulWidget {
  const VideoPhotoPage({Key? key}) : super(key: key);

  @override
  _VideoPhotoPageState createState() => _VideoPhotoPageState();
}

class _VideoPhotoPageState extends State<VideoPhotoPage> {
  int _value = 0;
  final title6 = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  final text1 = TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold);
  final visibleText = TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
  bool firstValue = false;

  ImagePicker picker = ImagePicker();
  List<File> imagePaths = [];

  Future<void> _pickImageOrVideo() async {
    PickedFile? pickedFile = await picker.getImage(source: ImageSource.gallery);
    // Handle the picked image or video as needed
    if (pickedFile != null) {
      // Do something with the picked image or video
      // For example, you can add it to the list
      setState(() {
        imagePaths.add(File(pickedFile.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      imagePaths.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 60,
            height: 60,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset("assets/icons/icon6.pnp"),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Add your videos and photos",
            style: GoogleFonts.manrope(textStyle: title6),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: _pickImageOrVideo,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                // color: Color(0xFFE94057),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset("assets/icons/attach1.png"),
                  const SizedBox(height: 10),
                  Text(
                    "Tap to add your photo or videos. First image will be your profile photo.",
                    style: GoogleFonts.manrope(
                      textStyle: title6.copyWith(
                        color: Color(0xFF94898B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Display attached images or videos
          for (int i = 0; i < imagePaths.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Display attached image or video
                          Image.file(
                            imagePaths[i],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          // Add close (cross) icon to remove the attached image or video
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () => _removeImage(i),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
