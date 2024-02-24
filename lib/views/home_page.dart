import 'package:demo1/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<Controller> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.myTitle),
          actions: [
            IconButton(
              onPressed: () => controller.newTitle('New Title Page'),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.myBottonSheet(controller);
            controller.nameInput.clear();
            controller.descInput.clear();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: controller.myList.length,
          itemBuilder: (context, index) {
            final myItem = controller.myList[index];
            return ListTile(
              title: Text(myItem.name),
              subtitle: Text(myItem.desc),
              trailing: IconButton(
                onPressed: () => controller.deleteItem(myItem),
                icon: const Icon(Icons.delete),
              ),
              onLongPress: () {},
            );
          },
        ),
      );
    });
  }
}
