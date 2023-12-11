import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:test3_21nov/store/store_data_hive.dart';

part 'store_data_mobx.g.dart';

class Add = AddProduct with _$Add;

abstract class AddProduct with Store {
  @observable
  ObservableList<DataModel> data = ObservableList<DataModel>();

  @action
  void addDetail(DataModel singleData) {
    Box<DataModel>? productBox;
    if (!data.any(
      (item) => singleData.name?.toUpperCase() == item.name?.toUpperCase(),
    )) {
      productBox = Hive.box("user_box");
      productBox.add(singleData);
      fetchDetail();
    }
  }

  @action
  void fetchDetail() {
    Box<DataModel>? fetchBox;
    fetchBox = Hive.box("user_box");
    data = fetchBox.values.toList().cast<DataModel>().asObservable();
  }

  void deleteDetail(int deleteIndex) {
    Box<DataModel>? deleteBox;
    deleteBox = Hive.box("user_box");
    deleteBox.deleteAt(deleteIndex);
    data.removeAt(deleteIndex);
  }

  void editDetail(int index, String newName, String newSite, String newDate,
      int ratingBar) {
    Box<DataModel>? box = Hive.box("user_box");
    box.putAt(
      index,
      DataModel(
          name: newName,
          productName: newSite,
          date: newDate,
          rating: ratingBar),
    );
    fetchDetail();
  }

  Future<void> sortName() async {
    Box<DataModel>? sortNameBox = Hive.box("user_box");
    List<DataModel> item = sortNameBox.values.toList();
    item.sort((a, b) {
      return (a.name ?? "").compareTo(b.name ?? "");
    });
    await sortNameBox.clear();
    await sortNameBox.addAll(item);
    fetchDetail();
  }

  Future<void> sortProductSite() async {
    Box<DataModel>? sortNameBox = Hive.box("user_box");
    List<DataModel> item = sortNameBox.values.toList();
    item.sort((a, b) {
      return (a.productName ?? "").compareTo(b.productName ?? "");
    });
    await sortNameBox.clear();
    await sortNameBox.addAll(item);
    fetchDetail();
  }

  Future<void> sortDate() async {
    Box<DataModel>? sortNameBox = Hive.box("user_box");
    List<DataModel> item = sortNameBox.values.toList();
    item.sort((a, b) {
      return (a.date ?? "").compareTo(b.date ?? "");
    });
    await sortNameBox.clear();
    await sortNameBox.addAll(item);
    fetchDetail();
  }

  Future<void> sortRating() async {
    Box<DataModel>? sortNameBox = Hive.box("user_box");
    List<DataModel> item = sortNameBox.values.toList();
    item.sort((a, b) {
      return (a.rating ?? 0).compareTo(b.rating ?? 0);
    });
    await sortNameBox.clear();
    await sortNameBox.addAll(item);
    fetchDetail();
  }
}
