import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_todo_app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      padding: EdgeInsets.symmetric(horizontal: 20),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: height! * 0.8,
      // color: Colors.green,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemBuilder: (context, index) {
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
                    children: const [
                      FlutterLogo(size: 50),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Work',
                          style: TextStyle(
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('61Task',
                            style: TextStyle(
                                // fontSize: 30,
                                fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
