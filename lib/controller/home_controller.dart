import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/model.dart';
import '../screen/screen.dart';
import '../services/service.dart';
import 'controller.dart';

class HomeController extends BaseController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<CategoryResponse> categoryList = CategoryResponse().obs;

  @override
  void onInit() {
    loader.value = true;
    getCategory();
    super.onInit();
  }


  Future<void> logOut() async {
    const CircularProgressIndicator();
    Get.offAndToNamed(LoginScreen.pageId);
  }

  void getCategory() async {
    loader.value = true;
    var response = await RemoteServices.getCategory();
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      //var data = jsonData["categories"];
      categoryList.value =  CategoryResponse.fromJson(jsonData);

         loader.value = false;
    }
    else{
      loader.value = false;
    }
  }

}


