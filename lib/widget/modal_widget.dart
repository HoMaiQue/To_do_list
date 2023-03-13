import 'package:flutter/material.dart';

class ModalWidget extends StatelessWidget {
  ModalWidget({super.key, required this.addTask});
  final Function addTask;
  TextEditingController controller = TextEditingController();
  void _handleOnClick(BuildContext context) {
    final newName = controller.text;
    if (newName.isEmpty) return;
    addTask(newName);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Your Task"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => _handleOnClick(context),
                  child: const Text(
                    "Add Task",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                  )))
        ]),
      ),
    );
  }
}
