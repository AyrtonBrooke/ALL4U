import 'package:assignment/welcomepages/auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart'; //flutter pub add page_transition


class editSettingsPage extends StatefulWidget {
  @override
  _editSettingsPageState createState() => _editSettingsPageState();
}

class _editSettingsPageState extends State<editSettingsPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text('Account'),
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
              children: [
                SizedBox(height: 35,
                ),
                buildTextField("Username", "John Doe", false),
                buildTextField("Email", "example@example.com", false),
                buildTextField("Password", "*******", true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            elevation: 2,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        onPressed: () {
                        },
                        child: Text("Cancel",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2.2,
                                color: Colors.redAccent.shade100)),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        onPressed: () {
                        },
                        child: Text("Save",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2.2,
                                color: Colors.lightGreenAccent)),
                      ),
                    ]
                ),
                Divider(color: Colors.white,),
                SizedBox(height: 35,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.brown,
                          elevation: 2,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                      onPressed: () {
                      },
                        child: Text("Reset Account",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2.2,
                              color: Colors.redAccent.shade100)),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.brown,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      onPressed: () {
                      },
                      child: Text("Delete Account",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2.2,
                              color: Colors.redAccent.shade100)),
                    ),
                  ]
                )
              ],
          ),
        ),
      ),
    );
  }

    Widget buildTextField(
        String labelText, String placeholder, bool isPasswordTextField) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: TextField(
          obscureText: isPasswordTextField ? showPassword : false,
          decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                )
                : null,
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                  color: Colors.black
              )),
        ),
      );
    }
}