import 'package:demo1/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFloatingActionButton extends GetView<Controller> {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.bottomSheet(
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
          backgroundColor: Colors.lightBlue),
      child: const Icon(Icons.add),
    );
  }
}
