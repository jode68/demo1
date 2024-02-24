import 'package:demo1/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MyWidget {
  void myBottonSheet(Controller controller) {
    Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: controller.nameInput,
              ),
              TextField(
                controller: controller.descInput,
              ),
              ElevatedButton(
                onPressed: () => controller.addItem(),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlue);
  }
}
