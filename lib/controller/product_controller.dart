import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/model.dart';
import '../services/service.dart';
import '../utils/utils.dart';
import 'controller.dart';

class ProductController extends BaseController{

  final List<String> imgList = [
    "https://picsum.photos/seed/picsum/200/300",
    "https://picsum.photos/200/300?grayscale",
    "https://picsum.photos/200/300/?blur",
    "https://picsum.photos/200/300/?blur=2",
  ];

  Rx<CategoryResponse> resultDataList = CategoryResponse().obs;
  RxList<CategoryResponse> cartList = <CategoryResponse>[].obs;
  String? category = 'jewelery';
  Rx<int> quantity = 1.obs;

  @override
  void onInit() {
    category = Get.arguments["category"];
    productsApi(category);
    super.onInit();
  }

  void productsApi(category) async {
    try {
      loader.value = true;
      var response = await RemoteServices.productApi(category);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        resultDataList.value =  CategoryResponse.fromJson(jsonData);
        loader.value = false;
      }
      else {
        loader.value = false;
      }
    } catch (e) {
      debugPrint("Error :- ${e.toString()}");
    }
  }

}