import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/services/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/model.dart';
import '../screen/screen.dart';
import '../utils/utils.dart';
import 'controller.dart';

class LoginController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  RxBool hidePassword = true.obs;
  RxBool isRemember = false.obs;

  void loginWithValidation() {
    if (loginFormKey.currentState!.validate()) {
      login(emailController.value.text, passwordController.value.text);
    } else {
      debugPrint("inValid ${Validator.isEmail.toString()}");
    }
  }

  void login(email, password) async {
    var response = await  RemoteServices.loginApi(email, password);
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      print("JsonData : $jsonData");
      Common.errorSnackBar("Login","You have SuccessFully Login");
      loader.value = true;
      Get.toNamed(HomeScreen.pageId);
    }
    else{
      Common.errorSnackBar("Login Failed", "Invalid Login");
    }
  }

  void clearController(){
    emailController.clear();
    passwordController.clear();
  }

}
