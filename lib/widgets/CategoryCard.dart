import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.height,
    required this.width,
    required this.taskCount,
    required this.taskCategory,
    required this.color,
    required this.taskCompletePercentage,
  });

  final double height;
  final double width;
  final int taskCount;
  final String taskCategory;
  final Color color;
  // task complete percentage
  final double taskCompletePercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: height * 0.12,
      width: width * 0.4,
      decoration: BoxDecoration(
        color: const Color(0xff0A155A),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // No. of Tasks
          Text(
            "$taskCount tasks",
            style: const TextStyle(
              color: Color(0xff7D80AA),
              fontSize: 14.0,
            ),
          ),
          // Category
          Text(
            taskCategory,
            style: const TextStyle(
              color: Color(0xffffffff),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Progress indicator
          // Divider(
          //   height: 2.0,
          //   color: color,
          // ),
          // Progress indicator
          LinearProgressIndicator(
            value: taskCompletePercentage,
            backgroundColor: color.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ],
      ),
    );
  }
}
