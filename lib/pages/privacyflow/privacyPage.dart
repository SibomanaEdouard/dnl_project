import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  int _value = 0;
  final title6 = GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700);
  final text1 = GoogleFonts.inter(fontSize: 17.0, fontWeight: FontWeight.bold);
  final visibleText = GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500);
  bool firstValue = false;

  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: Icon(Icons.chevron_left), 
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
    
    
      body: 
      SingleChildScrollView(child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Personally Identifiable Information that You Provide to Us",
              style: title6.copyWith(fontSize: 20),
            ),
            SizedBox(height: 40),
            Text(
              "We do not collect personally identifiable information e.g., name, e-mail address, contact or similar information unless you choose to provide it to us. If you voluntarily provide us with personal information, for example by sending an e-mail or by filling out a form and submitting it through our Website, we may use that information only to respond to your message and to help us provide you with the information or services that you request. To the extent that we process your personal information based on your consent, you may withdraw your consent at any time as stated below.",
              style: title6.copyWith(fontSize: 15),
            ),
            SizedBox(height: 20),
            Text(
              "Account Registration Information",
              style: title6.copyWith(fontSize: 20),
            ),
            SizedBox(height: 40),
            Text(
              "In some instances, use of the Clients on Isotope and Services may require that you disclose certain personal information for identification, including a unique email address and demographic information (including, for example, ZIP code, age, sex, job industry, job title, and income) to register.",
              style: title6.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),)
      
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PrivacyPage(),
  ));
}
