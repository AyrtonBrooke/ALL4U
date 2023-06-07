import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesTile extends StatelessWidget {
  final String noteTitle;
  final String noteDesc;
  Function(BuildContext)? deleteFunction;

  NotesTile({
    super.key,
    required this.noteTitle,
    required this.noteDesc,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(25),
            )
          ],
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // task name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  noteTitle,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8,right: 8),
                child: Text(
                  noteDesc,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}