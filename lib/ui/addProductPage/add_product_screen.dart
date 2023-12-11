import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:test3_21nov/main.dart';
import 'package:test3_21nov/router/app_router.gr.dart';
import 'package:test3_21nov/ui/addProductPage/widgets/base_text_form_field.dart';

import '../../store/store_data_hive.dart';
import '../../values/app_color.dart';

@RoutePage()
class AddProductScreen extends StatefulWidget {
  final bool isUpdated;
  final int? index;
  final DataModel? dataModel;

  const AddProductScreen(
      {super.key, required this.isUpdated, this.index, this.dataModel});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Box<DataModel>? userBox;
  int rate = 0;

  @override
  void initState() {
    userBox = Hive.box('user_box');
    if (widget.isUpdated == true) {
      _productNameController.text = widget.dataModel?.name ?? "";
      _launchSiteController.text = widget.dataModel?.productName ?? "";
      _dateController.text = widget.dataModel?.date ?? "";
      rate = widget.dataModel?.rating?.toInt() ?? 0;
    }
    super.initState();
  }

  final ValueNotifier<DateTime> _selectedDate =
      ValueNotifier(DateTime(2007, 1, 1, 0, 1, 1, 1));
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _launchSiteController = TextEditingController();

  //final TextEditingController _ratingController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  Future getDate() async {
    final DateFormat formatter = DateFormat("dd MMM yyyy");

    DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 2, 2, 2, 2, 2),
      firstDate: DateTime(1950),
      lastDate: DateTime(2005),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.maroon,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.maroon,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (datePicked != null) {
      _dateController.text = formatter.format(datePicked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.isUpdated == true ? "Edit Product" : "ADD Product",
          style: TextStyle(
              fontSize: 30.spMin,
              color: AppColor.creamBrown,
              fontFamily: "milton"),
        ),
        centerTitle: true,
        backgroundColor: AppColor.maroon,
        toolbarHeight: 120.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: const Radius.circular(180).r,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10).r,
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  BaseTextFormField(
                    hintText: "Enter Product Name",
                    textStyle:
                        TextStyle(fontSize: 20.spMin, color: AppColor.maroon,fontFamily: "yeseva"),
                    controller: _productNameController,
                    validator: _nameValidator,
                    read: false,
                  ),
                  20.verticalSpace,
                  BaseTextFormField(
                    controller: _launchSiteController,
                    validator: _productValidator,
                    hintText: "Launched At",
                    textStyle:
                        TextStyle(
                        fontSize: 20.spMin,
                        color: AppColor.maroon,
                        fontFamily: "yeseva"),
                    read: false,
                  ),
                  20.verticalSpace,
                  ValueListenableBuilder(
                    valueListenable: _selectedDate,
                    builder: (context, value, child) {
                      return BaseTextFormField(
                        controller: _dateController,
                        validator: _dateValidator,
                        hintText: "Select launched date",
                        textStyle: TextStyle(
                            fontSize: 20.spMin, color: AppColor.maroon,fontFamily: "yeseva"),
                        onTap: () {
                          getDate();
                        },
                        suffix: InkWell(
                          onTap: () {
                            getDate();
                          },
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: AppColor.maroon,
                          ),
                        ),
                        read: true,
                      );
                    },
                  ),
                  20.verticalSpace,
                  RatingBar.builder(
                    initialRating: rate.toDouble(),
                    itemCount: 5,
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
                    onRatingUpdate: (rating) {
                      rate = rating.toInt();
                      print(rating);
                    },
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.maroon,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(10).r,
                              bottomLeft: const Radius.circular(10).r),
                        ),
                      ),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          debugPrint(
                              "product Name:${_productNameController.text}");
                          //userBox?.add(dataModel);
                          widget.isUpdated == true
                              ? product.editDetail(
                                  widget.index ?? 0,
                                  _productNameController.text,
                                  _launchSiteController.text,
                                  _dateController.text,
                                  rate)
                              : product.addDetail(
                                  DataModel(
                                      name: _productNameController.text,
                                      productName: _launchSiteController.text,
                                      date: _dateController.text,
                                      rating: rate),
                                );
                          debugPrint("name:${userBox?.getAt(0)?.name}");
                          context.router.pop(
                            const DashBoardRoute(),
                          );
                        }
                      },
                      child: Text(
                        widget.isUpdated == true ? "Update" : "Submit Data",
                        style: TextStyle(fontSize: 20.spMin,color: AppColor.creamBrown,fontFamily: "milton"),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.maroon,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(10).r,
                              bottomRight: const Radius.circular(10).r),
                        ),
                      ),
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(fontSize: 20.spMin,color: AppColor.creamBrown,fontFamily: "milton"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Product Name";
    }
    return null;
  }

  String? _productValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Site";
    }
    return null;
  }

  String? _dateValidator(value) {
    if (value == null || value.isEmpty) {
      return "Please Select launched date";
    }
    return null;
  }
  @override
  void dispose()
  {
    _productNameController.dispose();
    _dateController.dispose();
    _productNameController.dispose();
    _launchSiteController.dispose();
    super.dispose();
  }
}
