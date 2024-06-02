import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskspot/cubit/task_cubit.dart';
import 'package:taskspot/models/task_model.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    final ValueNotifier<Category> _selectedCategory =
        ValueNotifier(Category.Business);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0A155A),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color(0xffD103FC),
            onPressed: () {
              BlocProvider.of<TaskCubit>(context).addTask(
                taskController.text.trim(),
                _selectedCategory.value,
              );
              Navigator.pop(context);
            },
            label: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Task",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.upcoming,
                  color: Colors.white,
                )
              ],
            )),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff0A155A),
          leading: null,
          actions: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.only(right: 16.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xffBBC2D8),
                    width: 2.0,
                  ),
                ),
                child: const Icon(
                  Icons.close,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text field
                TextField(
                  controller: taskController,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter new task",
                    hintStyle: TextStyle(
                      color: Color(0xffBBC2D8),
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                //

                const SizedBox(
                  height: 100.0,
                ),
                // Chips

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // chip
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: Color(0xffBBC2D8),
                          width: 2.0,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Icon
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 30,
                            color: Color(0xffBBC2D8),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Today
                          Text(
                            "Today",
                            style: TextStyle(color: Color(0xffBBC2D8)),
                          ),
                        ],
                      ),
                    ),
                    //

                    // const SizedBox(
                    //   width: 50.0,
                    // ),

                    // category

                    ValueListenableBuilder<Category>(
                        valueListenable: _selectedCategory,
                        builder: (context, value, child) {
                          return DropdownButton<Category>(
                            underline: const SizedBox.shrink(),
                            value: value,
                            dropdownColor: const Color(0xff0A155A),
                            onChanged: (Category? newValue) {
                              _selectedCategory.value = newValue!;
                            },
                            items: Category.values
                                .map<DropdownMenuItem<Category>>(
                                    (Category category) {
                              return DropdownMenuItem<Category>(
                                value: category,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffBBC2D8),
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.all(5.0),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          // color: Color(0xff4F74FF),
                                          color: category.color,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      category.displayName,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    // Container(
                                    //   width: 24,
                                    //   height: 24,
                                    //   decoration: BoxDecoration(
                                    //       color: category.color,
                                    //       shape: BoxShape.circle,
                                    //       border: Border.all(
                                    //           color: const Color(0xffBBC2D8),
                                    //           width: 2.0)),
                                    // ),
                                    // const SizedBox(width: 8),
                                    // Text(
                                    //   category.displayName,
                                    //   style: const TextStyle(color: Colors.white),
                                    // ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }),

                    // Container(
                    //   height: 50,
                    //   width: 50,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: const Color(0xffBBC2D8),
                    //       width: 2.0,
                    //     ),
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child: Container(
                    //     margin: const EdgeInsets.all(10.0),
                    //     height: 30,
                    //     width: 30,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xff4F74FF),
                    //       borderRadius: BorderRadius.circular(50),
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
