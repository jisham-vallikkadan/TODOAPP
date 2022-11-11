import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providerclass.dart';

class Todoingpage extends StatefulWidget {
  const Todoingpage({Key? key}) : super(key: key);

  @override
  State<Todoingpage> createState() => _TodoingpageState();
}

class _TodoingpageState extends State<Todoingpage> {

  @override
  Widget build(BuildContext context) {
    var todoing=context.watch<TodoAppProvider>().todoing;
    return Scaffold(
      appBar: AppBar(
        title: Text('Doing'),

      ),
      body: ListView.builder(itemBuilder: (context, index) {
        var todoIng=todoing[index];
        return  Card(
          color: Colors.grey,
          child: Column(
            children: [
              ListTile(
                leading: Text(todoIng.todoaction,style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                trailing: IconButton(onPressed: (){
                  Provider.of<TodoAppProvider>(context,listen: false).removefromtodoing(todoIng);
                  todoIng.todostsus=false;
                },icon: Icon(Icons.delete)),
              )
            ],
          ),
        );
      },itemCount: todoing.length,),
    );
  }
}
