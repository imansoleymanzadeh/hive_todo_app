import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_todo_app/controller/home_screen_controller.dart';
import 'package:hive_todo_app/models/proeject_task_modle.dart';
import 'package:hive_todo_app/models/project_model.dart';
import 'package:hive_todo_app/models/project_status_model.dart';
import 'package:hive_todo_app/routes/app_routes.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.creatEditScreenRoute);
        },
        child: const Icon(CupertinoIcons.add),
      ),
      body: Column(
        children: [
          _appBar(width: width, height: height),
          _body(width: width, height: height)
        ],
      ),
    );
  }

  _appBar({double? width, double? height}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: width,
      height: height! * 0.2,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_outlined,
              size: 40,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Lists',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1),
            ),
          )
        ],
      ),
    );
  }

  _body({double? width, double? height}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: height! * 0.8,
      // color: Colors.green,
      child: GetBuilder<HomeController>(builder: (controller) {
        if (controller.errorMessage != null) {
          return Center(child: Text(controller.errorMessage!));
        }
        if (controller.allProjects.isEmpty) {
          return const Center(
            child: Text('you have no Project create one ")'),
          );
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: controller.allProjects.length,
            itemBuilder: (BuildContext context, int index) {
              Project project = controller.allProjects[index];
              String projectStatus = controller.allProjects[index].projectStatus
                  .toString()
                  .split('.')
                  .last;
              return InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.detailScreenRoute);
                },
                child: Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const FlutterLogo(size: 50),
                            Chip(
                              label: Text(projectStatus),
                              // backgroundColor:projectStatus=='done'?Colors.green?projectStatus=='end'?Colors.red?projectStatus='inProgracess'?Colors.orange:Colors.grey ,
                              backgroundColor:
                                  _chipBackGroudColorBuilder(projectStatus),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            project.name!,
                            style: const TextStyle(
                              fontSize: 30,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('${project.taskList!.length}Tasks',
                              style: const TextStyle(
                                  // fontSize: 30,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

  _chipBackGroudColorBuilder(String status) {
    switch (status) {
      case 'done':
        return Colors.green;
      case 'end':
        return Colors.orange;
      case 'expired':
        return Colors.red;
      case 'inProgracess':
        return Colors.blue;
    }
  }
}
