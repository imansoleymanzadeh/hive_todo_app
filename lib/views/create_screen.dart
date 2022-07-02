import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_todo_app/controller/app_controller.dart';
import 'package:hive_todo_app/models/proeject_task_modle.dart';

import 'package:intl/intl.dart';

class CreateEditProjectScreen extends GetView<AppController> {
  const CreateEditProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProjectTask> projectTasks = [];

    // TextEditingController todoNameController = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "New Task",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                CupertinoIcons.multiply,
                color: Colors.black,
                size: 32,
              )),
        ],
      ),
      body: _projectCreateForm(projectTasks: projectTasks, width: width),
    );
  }

  SingleChildScrollView _projectCreateForm({
    required double width,
    required List<ProjectTask> projectTasks,
  }) {
    // >>>>>>>>>>>for creating project form<<<<<<<<<<<<
    TextEditingController projectstartDateTimeController =
        TextEditingController();
    TextEditingController projectEndDateTimeController =
        TextEditingController();
    TextEditingController projectNameController = TextEditingController();
    TextEditingController projectDiscriptionController =
        TextEditingController();

    // >>>>>>>>>>>for creating project form<<<<<<<<<<<<

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          24,
          23,
          24,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "what are you planning?",
              style: TextStyle(
                  color: Color.fromARGB(255, 82, 70, 70), fontSize: 18),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: projectNameController,
              decoration: InputDecoration(
                  hintText: "Project name",
                  prefixIcon: const Icon(CupertinoIcons.bag),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: projectDiscriptionController,
              decoration: InputDecoration(
                  hintText: "Project Descriptions",
                  prefixIcon: const Icon(CupertinoIcons.bag),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: projectstartDateTimeController,
              decoration: InputDecoration(
                  // labelText: "date",
                  hintText: "Project start Date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: InkWell(
                    onTap: () {
                      controller.pickDateTimeForTodo().then((value) {
                        projectstartDateTimeController.text =
                            DateFormat('yyyy-MM-dd').format(value);
                      });
                    },
                    child: const Icon(CupertinoIcons.calendar),
                  )),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: projectEndDateTimeController,
              decoration: InputDecoration(
                  // labelText: "date",
                  hintText: "Project end Date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: InkWell(
                    onTap: () {
                      controller.pickDateTimeForTodo().then((value) {
                        projectEndDateTimeController.text =
                            DateFormat('yyyy-MM-dd').format(value);
                      });
                    },
                    child: const Icon(CupertinoIcons.calendar),
                  )),
            ),
            const SizedBox(height: 20),
            _taskListView(
              width,
              projectTasks,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("Create")),
            )
          ],
        ),
      ),
    );
  }

  _taskListView(
    double width,
    List<ProjectTask> projectTasks,
  ) {
    // >>>>>>>>>>>for creating task dialog<<<<<<<<<<<<
    TextEditingController? taskNameController = TextEditingController();
    TextEditingController? taskDiscriptionController = TextEditingController();
    TextEditingController? taskStartDateController = TextEditingController();
    TextEditingController? taskEndDateController = TextEditingController();
    // >>>>>>>>>>>for creating task dialog<<<<<<<<<<<<
    return Container(
      width: width,
      height: 200,
      // color: Colors.red,
      child: ListView.builder(
        itemCount: projectTasks.length + 1,
        itemBuilder: (context, index) {
          if (index == projectTasks.length) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.dialog(_createNewTaskDialog(
                      controller,
                      taskNameController: taskNameController,
                      taskDiscriptionController: taskDiscriptionController,
                      taskStartDateController: taskStartDateController,
                      taskEndDateController: taskEndDateController,
                    ));
                  },
                  child: Container(
                      width: width,
                      height: 50,
                      color: Colors.green[50],
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.add),
                            Text('create Task'),
                          ],
                        ),
                      )),
                ));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              height: 60,
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(CupertinoIcons.cube),
                  Text(projectTasks[index].taskName!)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

SimpleDialog _createNewTaskDialog(
  controller, {
  TextEditingController? taskNameController,
  TextEditingController? taskDiscriptionController,
  TextEditingController? taskStartDateController,
  TextEditingController? taskEndDateController,
}) {
  double height = MediaQuery.of(Get.context!).size.height;
  double width = MediaQuery.of(Get.context!).size.height;
  return SimpleDialog(
    title: Text(
      'Create New Task',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    contentPadding: const EdgeInsets.all(28.0),
    children: [
      Container(
        height: height*0.4,
        width: width*0.35,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: taskNameController,
                  decoration: InputDecoration(
                    hintText: "Task name",
                    prefixIcon: const Icon(CupertinoIcons.bag),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: taskDiscriptionController,
                  decoration: InputDecoration(
                    hintText: "Task Description",
                    prefixIcon: const Icon(CupertinoIcons.bag),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: taskStartDateController,
                  decoration: InputDecoration(
                      // labelText: "date",
                      hintText: "Task Start Date",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: InkWell(
                        onTap: () {
                          controller.pickDateTimeForTodo().then((value) {
                            taskEndDateController!.text =
                                DateFormat('yyyy-MM-dd').format(value);
                          });
                        },
                        child: const Icon(CupertinoIcons.calendar),
                      )),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: taskEndDateController,
                  decoration: InputDecoration(
                    // labelText: "date",
                    hintText: "Task end Date",
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: InkWell(
                      onTap: () {
                        controller.pickDateTimeForTodo().then((value) {
                          taskEndDateController!.text =
                              DateFormat('yyyy-MM-dd').format(value);
                        });
                      },
                      child: const Icon(CupertinoIcons.calendar),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(onPressed: () {}, child: Text('create Task'))
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
