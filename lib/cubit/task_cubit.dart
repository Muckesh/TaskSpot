import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskspot/models/task_model.dart';

class TaskCubit extends Cubit<List<Task>> {
  TaskCubit() : super([]);

  void addTask(String taskName, Category category) {
    if (taskName.isEmpty) {
      return;
    }
    final task = Task(
        taskName: taskName,
        isCompleted: false,
        createdAt: DateTime.now(),
        taskCategory: category);

    emit([...state, task]);
  }

  void checkTask(int index) {
    state[index].isCompleted = !state[index].isCompleted;

    emit([...state]);
  }

  double calculateTaskCompletePercentage(Category category) {
    final categoryTasks =
        state.where((task) => task.taskCategory == category).toList();
    if (categoryTasks.isEmpty) {
      return 0.0;
    }
    final completedTasks =
        categoryTasks.where((task) => task.isCompleted).length;
    double percentage = completedTasks / categoryTasks.length;
    emit([...state]);
    return percentage;
  }

  int getTaskCountByCategory(Category category) {
    int taskCount = state.where((task) => task.taskCategory == category).length;
    emit([...state]);
    return taskCount;
  }
}
