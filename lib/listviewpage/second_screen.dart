import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        title: Text('Languages')
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            color: Colors.brown,
            child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("English", style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ]
            ),
          ),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("French", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Spanish", style: TextStyle(
                color: Colors.white,
            fontSize: 25,
          ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("German", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Italian", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Polish", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Russian", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Arabic", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Portuguese", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Persian", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Chinese", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Japanese", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Romanian", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
          Divider(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.brown,
              child: Text("Croatian", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ))),
        ],
      ),
    );
  }
}