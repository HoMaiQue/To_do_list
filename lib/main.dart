import 'package:flutter/material.dart';
import 'package:to_do_list/model/task.model.dart';
import 'package:to_do_list/widget/cart_body_widget.dart';
import 'package:to_do_list/widget/modal_widget.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Task> taskList = [];

  void _handleAddTask(String name) {
    final newTask = Task(DateTime.now().toString(), name);
    setState(() {
      taskList.add(newTask);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      taskList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ToDoList",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: taskList
              .map(
                  (task) => CardBody(index: taskList.indexOf(task),item: task, deleteTask: _handleDeleteTask))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return ModalWidget(addTask: _handleAddTask);
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
