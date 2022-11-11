import 'package:flutter/material.dart';

import 'modeltodoitemclass.dart';

class TodoAppProvider with ChangeNotifier {
  final List<TodoItems> _addtodo = <TodoItems>[];

  List<TodoItems> get addtodo => _addtodo;


  final List<TodoItems> _todoing=<TodoItems>[];
  List<TodoItems> get todoing=>_todoing;
//insid floting action button
  void addnewitem(TodoItems todoItems) {
    _addtodo.add(todoItems);
    notifyListeners();
  }

  void checktodoing(TodoItems todoItems){
    _todoing.add(todoItems);
    notifyListeners();
  }

  void unchektodoin(TodoItems todoItems){
    _todoing.remove(todoItems);
    notifyListeners();
  }

   void removefromtodoing(TodoItems todoItems){
    _todoing.remove(todoItems);
    notifyListeners();
   }

   void addalltotodoing(TodoItems todoItems){
      _todoing.addAll(todoing);
      notifyListeners();

   }

}
