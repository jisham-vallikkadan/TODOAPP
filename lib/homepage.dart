import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/modeltodoitemclass.dart';
import 'package:todoapp/providerclass.dart';
import 'package:todoapp/todoingpage.dart';

import 'todoaddingpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  // List<TodoItems> todolist = <TodoItems>[
  //   TodoItems(todoaction: 'jsiahm', tododate: 'marcg 6', todostsus: false),
  //   TodoItems(todoaction: 'gadfra', tododate: 'marcg 6', todostsus: false),
  // ];
  @override
  Widget build(BuildContext context) {
var addtodo=  context.watch<TodoAppProvider>().addtodo;
var todoing=context.watch<TodoAppProvider>().todoing;
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Todoaddingpage(),));
          }, child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text('TODO APP'),
        actions: [
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Todoingpage(),));
          },
              child: Icon(Icons.shopping_cart)),
          Text('${todoing.length}'),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var addnew=addtodo[index];
            return Card(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          addnew.todoaction,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Checkbox(value:addnew.todostsus, onChanged: (val) {
                     if(!todoing.contains(addnew)){
                       Provider.of<TodoAppProvider>(context,listen: false).checktodoing(addnew);
                       addnew.todostsus=val;
                     }
                     else{
                       Provider.of<TodoAppProvider>(context,listen: false).unchektodoin(addnew);
                       addnew.todostsus=val;

                     }
                        }),
                      ],
                    ),
                    Row(
                      children: [Text(addnew.tododate,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: addtodo.length,
        ),
      ),


    );
  }
}
