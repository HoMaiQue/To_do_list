import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {super.key,
      required this.item,
      required this.deleteTask,
      required this.index});
  var item;
  final Function deleteTask;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: (index % 2 == 0
              ? Color.fromARGB(233, 213, 21, 123)
              : Color.fromARGB(233, 230, 204, 217)),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            item.name,
            style: const TextStyle(
                color: Color(0xff4B4B4B),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
              onTap: () async {
                if (await confirm(context,
                    title: const Text("Thông báo"),
                    content: Text("Bạn có muốn xóa không ? "),
                    textOK: Text("Có"),
                    textCancel: Text("Không"))) {
                  deleteTask(item.id);
                  return print("pressok");
                }
                return print("presscancel");
              },
              child: const Icon(Icons.delete_outline,
                  size: 24, color: Color(0xff4B4B4B)))
        ]),
      ),
    );
  }
}
