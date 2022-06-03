// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key, this.title}) : super(key: key);

  final title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var stringListReturnedFromApiCall = [
    {
      "ExpenseTypeId": "1",
      "ExpenseTypeCode": "DME00000000001",
      "ExpenseDescription": "Fuel",
      "Min": "149",
      "Max": "10000"
    },
    {
      "ExpenseTypeId": "2",
      "ExpenseTypeCode": "DME00000000002",
      "ExpenseDescription": "Toll Expense",
      "Min": "1",
      "Max": "500"
    },
    {
      "ExpenseTypeId": "3",
      "ExpenseTypeCode": "DME00000000003",
      "ExpenseDescription": "Vehicle Repair",
      "Min": "500",
      "Max": "5000"
    },
    {
      "ExpenseTypeId": "4",
      "ExpenseTypeCode": "DME00000000004",
      "ExpenseDescription": "Misc",
      "Min": "100",
      "Max": "500"
    },
    {
      "ExpenseTypeId": "5",
      "ExpenseTypeCode": "DME00000000005",
      "ExpenseDescription": "Meal",
      "Min": "50",
      "Max": "500"
    },
    {
      "ExpenseTypeId": "6",
      "ExpenseTypeCode": "DME00000000006",
      "ExpenseDescription": "Other",
      "Min": "111",
      "Max": "222"
    }
  ];
  List<TextEditingController> textEditingControllers = [];
  List<Map<String, dynamic>> _values = [];
  int totalBill = 0;
  @override
  void initState() {
    super.initState();
    _values = [];
    for (var i = 0; i < stringListReturnedFromApiCall.length; i++) {
      var textEditingController = TextEditingController();
      textEditingControllers.add(textEditingController);
    }
    // stringListReturnedFromApiCall.forEach((String str) {
    //   var textEditingController = TextEditingController();
    //   textEditingControllers.add(textEditingController);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // dispose textEditingControllers to prevent memory leaks
    for (TextEditingController textEditingController
        in textEditingControllers) {
      textEditingController.dispose();
    }
  }

// ignore: non_constant_identifier_names
  Widget FooterComponent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Expanded(
          child: Text(
            "Total",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
        Expanded(
          child: Container(
            height: 35,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: Colors.black),
              bottom: BorderSide(width: 1.0, color: Colors.grey),
            )),
            child: Column(
              children: [
                Text(
                  "$totalBill",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
        )
      ])),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Expensefields() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
      // ignore: prefer_const_literals_to_create_immutables
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: stringListReturnedFromApiCall.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Expanded(
                  child: Text(
                    stringListReturnedFromApiCall[index]["ExpenseDescription"]
                        .toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                Expanded(
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: textEditingControllers[index],
                        onChanged: (val){
                          _onUpdate(index, val);
                        })
                        )
              ]),
            );
          },
        ),
      ),
    );
  }

  _onUpdate(int index, String val) async {
    int foundKey = -1;
    for (var map in _values) {
      if (map.containsKey("id")) {
        if (map["id"] == index) {
          foundKey = index;
          textEditingControllers[index].value;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      "id": index,
      "value": val,
    };
    _values.add(json);
    calculateSum();
  }

  calculateSum() {
    var sum = 0;
    for (var i = 0; i < _values.length; i++) {
      if (_values[i]["value"] != "") {
        sum += int.parse(_values[i]["value"]);
      }
    }
    setState(() {
      totalBill = sum;
    });

    // print("Sum : $sum");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Management'),
      ),
      body: SingleChildScrollView(
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
        Expensefields(),
        FooterComponent(),
        ElevatedButton(
            onPressed: () {
              print(_values);
            },
            child: Text("Login"))
      ])),
    );
  }
}
