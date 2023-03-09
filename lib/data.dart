import 'dart:async';

import 'package:change_notifier/item.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier{

  bool isLoading = true;


  late final ValueNotifier<bool> notifier = ValueNotifier(true);

  late List<Item> _list;

 List<Item> get list => _list;

Data(){
  _list = [];
}

  void addListItem(Item item){
    _list.add(item);
    notifyListeners();
  }

  void resetList(){
    _list.clear();
    isLoading = true;
    notifyListeners();
  }

  Future<void> createItem(String name, int price)
  async {
       await Future.delayed(Duration(seconds: 1));


       getLateItem();
    notifier.value = false;

    Item item = Item(name, price);
    addListItem(item);

  }


  Future<void> getLateItem() async {
    isLoading = false;
    notifyListeners();
  }





Future<List<Item>> getFutureItem() async {

      return _list;

  }




}

