// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:test3_21nov/store/store_data_hive.dart' as _i5;
import 'package:test3_21nov/ui/addProductPage/add_product_screen.dart' as _i1;
import 'package:test3_21nov/ui/dashBoardPage/dash_board_screen.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddProductScreen(
          key: args.key,
          isUpdated: args.isUpdated,
          index: args.index,
          dataModel: args.dataModel,
        ),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashBoardScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddProductScreen]
class AddProductRoute extends _i3.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({
    _i4.Key? key,
    required bool isUpdated,
    int? index,
    _i5.DataModel? dataModel,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AddProductRoute.name,
          args: AddProductRouteArgs(
            key: key,
            isUpdated: isUpdated,
            index: index,
            dataModel: dataModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static const _i3.PageInfo<AddProductRouteArgs> page =
      _i3.PageInfo<AddProductRouteArgs>(name);
}

class AddProductRouteArgs {
  const AddProductRouteArgs({
    this.key,
    required this.isUpdated,
    this.index,
    this.dataModel,
  });

  final _i4.Key? key;

  final bool isUpdated;

  final int? index;

  final _i5.DataModel? dataModel;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, isUpdated: $isUpdated, index: $index, dataModel: $dataModel}';
  }
}

/// generated route for
/// [_i2.DashBoardScreen]
class DashBoardRoute extends _i3.PageRouteInfo<void> {
  const DashBoardRoute({List<_i3.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
