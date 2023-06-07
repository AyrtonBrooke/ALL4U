import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    final bool containsCall = taskName.toLowerCase().contains('call');

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
          height: screenHeight * 0.2,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              // checkbox
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.brown,
                  checkColor: Colors.black,
                ),
              ),

              // task name
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 40,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),

              if (containsCall)
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
