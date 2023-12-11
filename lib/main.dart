import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test3_21nov/router/app_router.dart';
import 'package:test3_21nov/store/store_data_hive.dart';
import 'package:test3_21nov/store/store_data_mobx.dart';
import 'package:test3_21nov/ui/dashBoardPage/dash_board_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  debugPrint("Path is : ${directory.path}");
  Hive.openBox<DataModel>("user_box");
  Hive.registerAdapter(DataModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
        );
      },
      // child: MaterialApp(
      //   title: "Practical test-3",
      //   home: DashBoardScreen(),
      // ),
    );
  }
}
Add product=Add();
