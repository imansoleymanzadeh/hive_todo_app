import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DetaileScreen extends StatelessWidget {
  const DetaileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          //appbar Todo
          Appbartodo(size: size),

          //body_todo
          BodyTodo(size: size)
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Appbartodo extends StatelessWidget {
  const Appbartodo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      color: Colors.blue,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, top: 50.0),
              child: const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.paste_rounded,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 48.0, top: 12.0),
              child: const Text(
                "All",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 47.0,
                ),
                child: const Text(
                  "0 Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}

class BodyTodo extends StatelessWidget {
  const BodyTodo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height,
      margin: EdgeInsets.only(top: size.height * 0.45),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 20, 0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: const Text('abolfazl'),
                subtitle: const Text('20:30 : 1383/4/27'),
                trailing: Checkbox(
                  value: index % 2 == 0 ? false : true,
                  onChanged: (value) {},
                ));
          },
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const Text(
        //       "Late",
        //       style: TextStyle(fontSize: 17),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       width: double.infinity,
        //       height: size.height / 12.2,
        //       decoration:
        //           BoxDecoration(borderRadius: BorderRadius.circular(10)),
        //       child: ListTile(
        //         title: const Text("Call Max"),
        //         subtitle: const Text(
        //           "20:15 april 29",
        //           style: TextStyle(color: Colors.red, fontSize: 18),
        //         ),
        //         trailing: Checkbox(
        //           value: true,
        //           onChanged: (value) {},
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     const Text(
        //       "today",
        //       style: TextStyle(fontSize: 17),
        //     ),
        //     CheckBoxTodo(size: size),
        //     CheckBoxTodo(size: size),
        //   ],
        // ),
      ),
    );
  }
}

// class CheckBoxTodo extends StatelessWidget {
//   const CheckBoxTodo({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: size.height / 12.2,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         title: const Text("Call Max"),
//         subtitle: const Text(
//           "19:15 ",
//           style:
//               TextStyle(color: Color.fromARGB(255, 82, 79, 78), fontSize: 18),
//         ),
//         trailing: Checkbox(
//           value: true,
//           onChanged: (value) {},
//         ),
//       ),
//     );
//   }
// }
