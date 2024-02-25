import 'package:demo1/controllers/controllers.dart';
import 'package:demo1/widgets/widgets.dart';
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
            const MyIconButtonOpenBottonSheet(false, 0),
            IconButton(
              onPressed: () => controller.newTitle('New Title Page'),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        floatingActionButton: const MyFABOpenBottonSheet(),
        body: ListView.builder(
          itemCount: controller.myList.length,
          itemBuilder: (context, index) {
            final myItem = controller.myList[index];
            return ListTile(
              title: Text(myItem.name),
              subtitle: Text(myItem.desc),
              trailing: IconButton(
                onPressed: () => controller.deleteItem(index),
                icon: const Icon(Icons.delete),
              ),
              leading: MyIconButtonOpenBottonSheet(true, index),
            );
          },
        ),
      );
    });
  }
}
