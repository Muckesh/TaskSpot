import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.height,
      required this.isCompleted,
      required this.taskName,
      required this.color});
  final double height;
  final bool isCompleted;
  final String taskName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: height * 0.08,
      decoration: BoxDecoration(
        color: const Color(0xff0A155A),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          // Checkbox
          isCompleted
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff3D47AF),
                    // border: Border.all(
                    //     color: Colors.red, width: 3.0),
                  ),
                  height: 30,
                  width: 30,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.red,
                    border: Border.all(color: color, width: 3.0),
                  ),
                  height: 30,
                  width: 30,
                ),
          // Sizedbox
          const SizedBox(
            width: 20,
          ),
          // Task name
          Text(
            taskName,
            style: TextStyle(
              decorationThickness: 2.0,
              decorationColor: Colors.white,
              color: Colors.white,
              fontSize: 18.0,
              decoration: isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
