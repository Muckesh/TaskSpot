import 'package:flutter/material.dart';

enum Category {
  Business,
  Personal,
  Health,
  Education,
  Entertainment,
  Others,
}

extension CategoryExtension on Category {
  String get displayName {
    switch (this) {
      case Category.Business:
        return "Business";
      case Category.Personal:
        return "Personal";
      case Category.Health:
        return "Health";
      case Category.Education:
        return "Education";
      case Category.Entertainment:
        return "Entertainment";
      case Category.Others:
        return "Others";
    }
  }

  Color get color {
    switch (this) {
      case Category.Business:
        return Colors.blue;
      case Category.Personal:
        return Colors.green;
      case Category.Health:
        return Colors.red;
      case Category.Education:
        return Colors.orange;
      case Category.Entertainment:
        return Colors.purple;
      case Category.Others:
        return Colors.grey;
    }
  }
}

class Task {
  final String taskName;
  final Category taskCategory;
  late bool isCompleted;
  final DateTime createdAt;

  Task({
    required this.taskName,
    required this.taskCategory,
    required this.isCompleted,
    required this.createdAt,
  });
}
