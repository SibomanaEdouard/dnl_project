import 'package:flutter/material.dart';

class User {
  String name;
  String avatar;

  User(this.name, this.avatar);
}

class SettingMain extends StatelessWidget {
  final String emptyImage = 'assets/images/proSet.png';

  List<User> userList = [
    User("Jenifer Smith", "assets/images/proSet.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE94057),
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: const Color(0xFFE94057),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: const Color(0xFFE94057),
              padding: const EdgeInsets.all(33),
              child: Column(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  if (userList.isNotEmpty)
                    Container(
                      height: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (User user in userList)
                            Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 70,
                                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      user.avatar,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  user.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  SizedBox(height: 10),
                  _buildExpansionTile('My Profile', [
                    _buildInputField('Name', 'Enter your name...'),
                    _buildInputField('Bio', 'Enter your bio...'),
                  ]),
                  SizedBox(height: 10),
                  _buildExpansionTile('My Subscription', [
                    _buildInputField('Subscription Type', 'Enter subscription type...'),
                    _buildInputField('Subscription Expiry', 'Enter subscription expiry...'),
                  ]),
                  SizedBox(height: 10),
                  _buildExpansionTile('Notifications', [
                    _buildInputField('Notification Settings', 'Configure notification settings...'),
                  ]),
                  SizedBox(height: 10),
                  _buildExpansionTile('Privacy Policy & Conditions', [
                    _buildInputField('Privacy Policy', 'Read and accept the privacy policy...'),
                  ]),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle "Logout" button press by showing the confirmation dialog
                        _showLogoutConfirmationDialog(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE94057)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, List<Widget> children) {
    return Theme(
      data: ThemeData.dark(),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFD1939B),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          children: children,
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String placeholder) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Log out"),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {
                // Close button pressed, close the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: Container(
          width: 300, // Adjust the width as needed
          child: Text("Are you sure you want to log out?"),
        ),
        contentPadding: EdgeInsets.all(20.0), // Adjust padding as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        actions: [
          SizedBox(width: 8.0), // Add spacing between close icon and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Cancel button pressed, close the dialog
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: const Color(0xFFE94057), width: 2.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: const Color(0xFFE94057),
                  ),
                ),
              ),
              SizedBox(width: 8.0), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Logout button pressed, navigate to the home page
                  Navigator.of(context).pop(); // Close the dialog
                  // Navigate to the home page (Replace it with your actual home page route)
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE94057)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: const Color(0xFFE94057), width: 2.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),
                ),
                child: Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}


}
