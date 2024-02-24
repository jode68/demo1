import 'package:demo1/models/models.dart';
import 'package:demo1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController with ControlTitle, ControlInput, MyWidget, MyVar {
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

mixin MyVar {
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

mixin ControlInput implements MyVar {
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

  void editItem(MyModels myModel, int index) {
    nameInput.text = myModel.name;
    descInput.text = myModel.desc;
    final data = MyModels(name: nameInput.text, desc: descInput.text);
    _myList[index] = data;
    Get.back();
  }
}
