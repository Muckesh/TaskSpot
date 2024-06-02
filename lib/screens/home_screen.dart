import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskspot/cubit/task_cubit.dart';
import 'package:taskspot/models/task_model.dart';
import 'package:taskspot/widgets/CategoryCard.dart';
import 'package:taskspot/widgets/CustomListTile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff3450A1),
      // Appbar
      appBar: AppBar(
        title: const Text(
          "T A S K S P O T",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xff3450A1),
      ),

      // floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffD103FC),
        onPressed: () {
          Navigator.pushNamed(context, '/create-task');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Text
                  const Text("What's up, John!",
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  const SizedBox(height: 16.0),
                  // Categories
                  const Text("CATEGORIES",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    height: height * 0.12, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Category.values.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CategoryCard(
                            color: Category.values[index].color,
                            height: height,
                            width: width,
                            taskCount: context
                                .read<TaskCubit>()
                                .getTaskCountByCategory(Category.values[index]),
                            taskCategory: Category.values[index].displayName,
                            taskCompletePercentage: context
                                .read<TaskCubit>()
                                .calculateTaskCompletePercentage(
                                  Category.values[index],
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Today's Tasks
                  const Text("TODAY'S Tasks",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length, // specify the number of items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<TaskCubit>(context)
                                .checkTask(index);
                          },
                          child: CustomListTile(
                            height: height,
                            isCompleted: tasks[index].isCompleted,
                            taskName: tasks[index].taskName,
                            color: tasks[index].taskCategory.color,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
