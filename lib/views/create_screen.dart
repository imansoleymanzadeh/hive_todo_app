// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';

class CreateEditProjectScreen extends StatefulWidget {
  const CreateEditProjectScreen({Key? key}) : super(key: key);

  @override
  State<CreateEditProjectScreen> createState() => _CreateEditProjectScreenState();
}

class _CreateEditProjectScreenState extends State<CreateEditProjectScreen> {
  TextEditingController todoDatacontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    DateTime _dateTime=DateTime.now();

    _selectedTodoData(BuildContext context)async{
      var _picker=await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(21000)
    );
    if(_picker!=null){
      setState(() {
        _dateTime=_picker;
        todoDatacontroller.text=DateFormat('yyy-MM-dd').format(_picker); 
      });
    }
    
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:const Text(
          "New Task",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon:const Icon(
                CupertinoIcons.multiply,
                color: Colors.black,
                size: 32,
              )),
        ],
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
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
            const  Text(
                "what are you planning?",
                style: TextStyle(color: Color.fromARGB(255, 82, 70, 70), fontSize: 18),
                textAlign: TextAlign.start,
              ),
            const  SizedBox(
                height: 12,
              ),
              TextFormField(
                minLines:
                    7, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: 12,
                
                decoration: InputDecoration(
                    hintText: "masseage",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
      
              ),
             const  SizedBox(height: 32,),
              TextField(
                decoration: InputDecoration(
                  hintText: "title",
                  prefixIcon:const Icon(CupertinoIcons.bag
                  
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
             const SizedBox(height: 32,),
              TextField(
                controller: todoDatacontroller,
                 decoration: InputDecoration(
                  // labelText: "date",
                  hintText: "Pick a Data",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  prefixIcon: InkWell(
                    onTap: (){
                      _selectedTodoData(context);
                    },
                    child:const Icon(CupertinoIcons.calendar),
                  )
                 ),
              ),
             const SizedBox(height: 32,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Add note",
                  prefixIcon:const Icon(CupertinoIcons.cube
                  
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
             const SizedBox(height: 32,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Category",
                  prefixIcon:const Icon(CupertinoIcons.create
                  
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
              const SizedBox(height: 32,),
              SizedBox(
                width: double.infinity,
                height:50,
                child: ElevatedButton(
                  
                  onPressed: (){},
                child:const Text("Create")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
