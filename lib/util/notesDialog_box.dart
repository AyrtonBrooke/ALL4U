import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final titleController;
  final paraController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.titleController,
    required this.paraController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    return AlertDialog(
      backgroundColor: Colors.brown[300],
      content: Container(
        height: 400,
        child: Column(
          children: [
            // get user input
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Add a Title", labelStyle: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,
                  color: Colors.white
                )),
              ),
            TextFormField(
              controller: paraController,
              minLines: 1,
              maxLines: 6,
              decoration: InputDecoration(
                  labelText: "Start writing...", labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 10),

                // cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}