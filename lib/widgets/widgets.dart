import 'package:demo1/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo1/controllers/controllers.dart';

class MyFABOpenBottonSheet extends GetView<Controller> {
  const MyFABOpenBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.bottomSheet(
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: controller.nameInput,
                    autofocus: true,
                    autocorrect: false,
                  ),
                  TextField(
                    controller: controller.descInput,
                    autocorrect: false,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.addItem(),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.lightBlue);
        controller.nameInput.clear();
        controller.descInput.clear();
      },
      child: const Icon(Icons.add),
    );
  }
}

class MyIconButtonOpenBottonSheet extends GetView<Controller> {
  const MyIconButtonOpenBottonSheet(this.editMode, this.myItem, {super.key});
  final bool editMode;
  final MyModels? myItem;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (editMode) {
          controller.nameInput.text = myItem!.name;
          controller.descInput.text = myItem!.desc;
        } else {
          controller.nameInput.clear();
          controller.descInput.clear();
        }
        Get.bottomSheet(
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: controller.nameInput,
                    autofocus: true,
                    autocorrect: false,
                  ),
                  TextField(
                    controller: controller.descInput,
                    autocorrect: false,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (editMode) {
                        controller.editItem(myItem!);
                      } else {
                        controller.addItem();
                      }
                    },
                    child: Text(editMode ? 'Update' : 'Save'),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.lightBlue);
      },
      icon: Icon(editMode ? Icons.edit : Icons.add),
    );
  }
}
