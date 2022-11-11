import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providerclass.dart';
import 'package:intl/intl.dart';

import 'modeltodoitemclass.dart';

class Todoaddingpage extends StatefulWidget {
  const Todoaddingpage({Key? key}) : super(key: key);

  @override
  State<Todoaddingpage> createState() => _TodoaddingpageState();
}

class _TodoaddingpageState extends State<Todoaddingpage> {
  TextEditingController taskcontoller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  @override
  void initState() {
    datecontroller.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add new todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: taskcontoller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Enter task'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: datecontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'take date',
                suffixIcon: Icon(Icons.calendar_month),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickdate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                );
                if (pickdate != null) {
                  print(datecontroller);
                  String foramtedate =
                      DateFormat('MM-yyyy-dd').format(pickdate);
                  print(foramtedate);
                  setState(() {
                    datecontroller.text =
                        foramtedate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 3,
              color: Colors.red,
              child: TextButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onPressed: () {
                  if (taskcontoller.text.isEmpty ||
                      datecontroller.text.isEmpty) {
                    return null;
                  } else {
                    Provider.of<TodoAppProvider>(context, listen: false)
                        .addnewitem(TodoItems(
                            todoaction: taskcontoller.text,
                            tododate: datecontroller.text,
                            todostsus: false));
                  }
                  Navigator.pop(context);
                  taskcontoller.text = "";
                  datecontroller.text = '';
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
