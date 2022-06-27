import 'package:flutter/material.dart';

class CreateEditProjectScreen extends StatelessWidget {
  const CreateEditProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: SizedBox(
            width: width * 0.9,
            height: height * 0.9,
            child: Card(
              elevation: 12,
              child: SingleChildScrollView(
                child: Container(
                  height: height * .7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.7,
                        child: TextFormField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ), 
                      SizedBox(
                        width: width * 0.7,
                        child: TextFormField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ), 
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        height: height,
                        color: Colors.green,
                      ),

                    
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
