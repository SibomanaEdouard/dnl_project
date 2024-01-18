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
      backgroundColor:  const Color(0xFFE94057),

      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor:  const Color(0xFFE94057),

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
                    width: 400, // Set the width to match input field width
                    height: 50, // Set the height to match input field height
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle "Logout" button press
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>( const Color(0xFFE94057)),
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
}
