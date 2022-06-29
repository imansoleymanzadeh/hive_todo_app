// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

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
    TextEditingController projectstartDateTimeController =
        TextEditingController();
    TextEditingController projectTitileController = TextEditingController();
    TextEditingController projectEndDateTimeController =
        TextEditingController();

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
      body: SingleChildScrollView(
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
              Container(
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
                            onTap: (){},
                            child: Container(
                              width: width,
                              height: 50,
                              color: Colors.green[50],
                              child:Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    
                                   Icon(CupertinoIcons.add),
                                    Text('create Task'), 
                                  ],
                                ),
                              )
                          
                            ),
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
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Create")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
