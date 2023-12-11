// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_data_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Add on AddProduct, Store {
  late final _$dataAtom = Atom(name: 'AddProduct.data', context: context);

  @override
  ObservableList<DataModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<DataModel> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$AddProductActionController =
      ActionController(name: 'AddProduct', context: context);

  @override
  void addDetail(DataModel singleData) {
    final _$actionInfo =
        _$AddProductActionController.startAction(name: 'AddProduct.addDetail');
    try {
      return super.addDetail(singleData);
    } finally {
      _$AddProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchDetail() {
    final _$actionInfo = _$AddProductActionController.startAction(
        name: 'AddProduct.fetchDetail');
    try {
      return super.fetchDetail();
    } finally {
      _$AddProductActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
