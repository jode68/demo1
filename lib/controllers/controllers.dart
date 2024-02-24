import 'package:demo1/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController with ControlVar, ControlTitle, ControlInput {
  @override
  void onInit() {
    final data = [
      MyModels(name: 'Paolo', desc: '1'),
      MyModels(name: 'Luca', desc: '2'),
      MyModels(name: 'Simone', desc: '3'),
      MyModels(name: 'Marco', desc: '4'),
      MyModels(name: 'Moreno', desc: '5'),
    ];
    _myList.addAll(data);
    super.onInit();
  }
}

mixin ControlVar {
  final _myList = <MyModels>[].obs;
  List<MyModels> get myList => _myList;
}

mixin ControlTitle {
  final _myTitle = 'Home Page'.obs;
  String get myTitle => _myTitle.value;

  void newTitle(String titleName) {
    _myTitle.value = titleName;
  }
}

mixin ControlInput implements ControlVar {
  final nameInput = TextEditingController();
  final descInput = TextEditingController();

  void addItem() {
    if (nameInput.text.isNotEmpty && descInput.text.isNotEmpty) {
      final data = MyModels(name: nameInput.text, desc: descInput.text);
      _myList.add(data);
      Get.back();
    }
  }

  void deleteItem(MyModels myModel) {
    _myList.remove(myModel);
  }

  void editItem(MyModels myItem) {
    final data = MyModels(name: nameInput.text, desc: descInput.text);
    int index = _myList.indexOf(myItem);
    _myList[index] = data;
    Get.back();
  }
}
