// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
   ExpenseScreen({Key? key}) : super(key: key);
var stringListReturnedFromApiCall = ["first", "second", "third", "fourth", "..."];

    // This list of controllers can be used to set and get the text from/to the TextFields
    var textEditingControllers = <TextEditingController>[];

    var textFields = <TextField>[];

dynamicTest(){
   stringListReturnedFromApiCall.forEach((str) {
      var textEditingController = new TextEditingController(text: str);
      textEditingControllers.add(textEditingController);
      return textFields.add(new TextField(controller: textEditingController));
    });
}


  // const name({Key? key}) : super(key: key);
  Widget test(String fieldLabel) {
    return Padding(
     padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      // ignore: prefer_const_literals_to_create_immutables
      child: Row(children: <Widget>[
        const Expanded(child: Text("sSaSa"),),
        // ignore: unnecessary_const
        const Expanded(child:  const TextField(
          keyboardType: TextInputType.text,
        )
        )
       
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey),
              ), // Set border width
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 50,
                    child: Image.asset('assets/images/userAvatar.png',
                        fit: BoxFit.contain)),
                Column(
                  children: [
                    SizedBox(
                     // width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("D00020B17",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          Text("D00020B17",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          test("Fuel")
        ]),
      ),
    );
  }
}
