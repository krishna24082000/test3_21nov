import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:popover/popover.dart';
import 'package:test3_21nov/main.dart';
import 'package:test3_21nov/router/app_router.gr.dart';
import 'package:test3_21nov/ui/dashBoardPage/widgets/base_button.dart';
import 'package:test3_21nov/ui/dashBoardPage/widgets/menu_items.dart';
import 'package:test3_21nov/values/app_color.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../store/store_data_hive.dart';

enum SampleItem { sortByName, sortByLaunchSite, sortByDate, sortByRating }

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    super.key,
  });

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  SampleItem? selectedMenu;
  Box<DataModel>? userBox;

  @override
  void initState() {
    userBox = Hive.box('user_box');
    product.fetchDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 20, top: 50).r,
        ),
        toolbarHeight: 120.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: const Radius.circular(180).r,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.maroon,
        title: Text(
          "User DashBoard",
          style: TextStyle(
              fontSize: 30.spMin,
              color: AppColor.creamBrown,
              fontFamily: "milton"),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopupMenuButton<SampleItem>(
              initialValue: selectedMenu,
              icon: Icon(
                Icons.menu,
                color: AppColor.maroon,
                size: 40,
              ),
              // Image.asset(
              //   "assets/images/menug.gif",
              //   height: 80.h,
              //   width: 70.h,
              // ),
              // Callback that sets the selected popup menu item.
              onSelected: (SampleItem item) {
                selectedMenu = item;
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                PopupMenuItem<SampleItem>(
                  textStyle: TextStyle(
                      fontSize: 20.spMin,
                      color: AppColor.maroon,
                      fontFamily: "milton"),
                  value: SampleItem.sortByName,
                  child: const Text('Sort By Name'),
                  onTap: () {
                    product.sortName();
                  },
                ),
                PopupMenuItem<SampleItem>(
                  textStyle: TextStyle(
                      fontSize: 20.spMin,
                      color: AppColor.maroon,
                      fontFamily: "milton"),
                  value: SampleItem.sortByLaunchSite,
                  child: const Text('sort By LaunchSite'),
                  onTap: () {
                    product.sortProductSite();
                  },
                ),
                PopupMenuItem<SampleItem>(
                  textStyle: TextStyle(
                      fontSize: 20.spMin,
                      color: AppColor.maroon,
                      fontFamily: "milton"),
                  value: SampleItem.sortByDate,
                  child: const Text('sort By Date'),
                  onTap: () {
                    product.sortDate();
                  },
                ),
                PopupMenuItem<SampleItem>(
                  textStyle: TextStyle(
                      fontSize: 20.spMin,
                      color: AppColor.maroon,
                      fontFamily: "milton"),
                  value: SampleItem.sortByRating,
                  child: const Text('sort By Rating'),
                  onTap: () {
                    product.sortRating();
                  },
                ),
              ],
            ),
            10.verticalSpace,
            Expanded(
              child: Observer(
                builder: (BuildContext context) {
                  return ListView.builder(
                    itemCount: product.data.length,
                    itemBuilder: (context, index) {
                      final list = product.data[index];
                      return product.data.isEmpty?const Text("Empty"):Padding(
                        padding: const EdgeInsets.only(
                                bottom: 10, left: 20, right: 30)
                            .r,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            border: Border(
                              top: BorderSide(
                                  width: 2, color: AppColor.borderColor),
                              bottom: BorderSide(
                                  width: 5, color: AppColor.borderColor),
                            ),
                          ),
                          child: Column(
                            children: [
                              10.verticalSpace,
                              Text(
                                "Name is ${list.name}",
                                style: TextStyle(
                                    color: AppColor.borderColor,
                                    fontFamily: "yeseva",
                                    fontSize: 20.spMin),
                              ),
                              5.verticalSpace,
                              Text(
                                "Site is ${list.productName}",
                                style: TextStyle(
                                    color: AppColor.borderColor,
                                    fontFamily: "cabin",
                                    fontSize: 18.spMin),
                              ),
                              5.verticalSpace,
                              Text(
                                "Date is  ${list.date}",
                                style: TextStyle(
                                    color: AppColor.borderColor,
                                    fontFamily: "cabin",
                                    fontSize: 18.spMin),
                              ),
                              5.verticalSpace,
                              RatingBar.builder(
                                initialRating:
                                    product.data[index].rating?.toDouble() ??
                                        0.0,
                                itemCount: 5,
                                ignoreGestures: false,
                                tapOnlyMode: false,
                                itemBuilder: (context, index) {
                                  switch (index) {
                                    case 0:
                                      return Icon(
                                        Icons.sentiment_very_dissatisfied,
                                        color: AppColor.red,
                                      );
                                    case 1:
                                      return Icon(
                                        Icons.sentiment_dissatisfied,
                                        color: AppColor.redAccent,
                                      );
                                    case 2:
                                      return Icon(
                                        Icons.sentiment_neutral,
                                        color: AppColor.amber,
                                      );
                                    case 3:
                                      return Icon(
                                        Icons.sentiment_satisfied,
                                        color: AppColor.lightParrot,
                                      );
                                    case 4:
                                      return Icon(
                                        Icons.sentiment_very_satisfied,
                                        color: AppColor.green,
                                      );
                                    default:
                                      return Container();
                                  }
                                },
                                onRatingUpdate: (double value) {},
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _alertBox(index);
                                    },
                                    child: Image.asset(
                                      "assets/images/dusbin.gif",
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  20.horizontalSpace,
                                  GestureDetector(
                                    onTap: () {
                                      context.router.push(
                                        AddProductRoute(
                                          isUpdated: true,
                                          index: index,
                                          dataModel: product.data[index],
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      "assets/images/editicon.gif",
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30).r,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          focusElevation: 0,
          onPressed: () {
            context.router.push(
              AddProductRoute(isUpdated: false),
            );
          },
          child: Image.asset(
            "assets/images/addicon.gif",
            height: 90.h,
            width: 60.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future<void> _alertBox(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.backColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).r,
            side: BorderSide(width: 3, color: AppColor.maroon),
          ),
          title: Text(
            'Alert',
            style: TextStyle(color: AppColor.red, fontFamily: "milton"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Delete Record??',
                  style: TextStyle(
                      color: AppColor.maroon,
                      fontFamily: "yeseva",
                      fontSize: 15.spMin),
                ),
                Text(
                  'Would you like to Delete this record?',
                  style: TextStyle(
                      color: AppColor.maroon,
                      fontFamily: "yeseva",
                      fontSize: 15.spMin),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: AppColor.maroon,
                        fontFamily: "milton",
                        fontSize: 15.spMin),
                  ),
                  onPressed: () {
                    product.deleteDetail(index);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: AppColor.maroon,
                        fontFamily: "milton",
                        fontSize: 15.spMin),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

}
