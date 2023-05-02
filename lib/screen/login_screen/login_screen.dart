import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../screen.dart';

class LoginScreen extends GetView<LoginController> {
  static const pageId = '/loginScreen';

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            //titlePadding: EdgeInsets.only(left: 40),
            title: Text("Login into your account",
                style: CustomTextStyle.appBarText),
            background: Container(color: ColorConfig.colorBlack,),),
        ),
        SliverList(delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Form(
                key: controller.loginFormKey,
                  child: Column(
                    children: [
                      CommonTextField(
                      controller: controller.emailController,
                      hintText: "Enter Email",
                        borderRadius:20,
                        validator: Validator.isEmail,
                      ),
                      const SizedBox(height: 15,),
                      CommonTextField(
                        controller: controller.passwordController,
                        hintText: "Enter Password",
                        borderRadius: 20,
                        validator: Validator.isPassword,
                          suffixIcon:
                      IconButton(
                      icon: controller.hidePassword.value ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
          onPressed: () {
            controller.hidePassword.value = !controller.hidePassword.value;
          },
        ),
isObscure: controller.hidePassword.value,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        //maixnAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Theme(
                            data: ThemeData(unselectedWidgetColor: ColorConfig.colorBlack),
                            child: SizedBox(
                              width : Get.width *0.08,
                              child: Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                value: controller.isRemember.value,
                                checkColor:ColorConfig.colorWhite,

                                activeColor: ColorConfig.colorBlack,
                                onChanged: (value) {
                                  controller.isRemember.value = value!;
                                },
                              ),
                            ),
                          ),
                          Container(
                              width: Get.width * 0.30,
                              child: Text("remember_me".tr, style: CustomTextStyle.rememberText,
                                overflow: TextOverflow.ellipsis,maxLines: 2,)),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      CommonButton(
                        name: 'SIGN IN',
                        color: ColorConfig.colorBlack,
                        textStyle: CustomTextStyle.buttonText,
                        borderRadius: 20,
                        border: false,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        onPress: (){
                          FocusScope.of(context).unfocus();
                          //Get.toNamed(HomeScreen.pageId);
                          if(controller.loginFormKey.currentState!.validate()){
                            Get.toNamed(HomeScreen.pageId);
                            //controller.login(controller.emailController.text, controller.passwordController.text);
                          }
                          else{
                            debugPrint("inValid ${Validator.isEmail.toString()}");
                          }
                          //controller.clearController();
                        },
                      ),
                      SizedBox(height: 15,),
                      CommonButton(
                        name: 'FaceBook',
                        minWidth: 250,
                        image: ImagePath.fbIcon,
                        scale: 15,
                        color: ColorConfig.colorBlue,
                        textStyle: CustomTextStyle.buttonText,
                        borderRadius: 20,
                        border: false,
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                        onPress: (){
                          //controller.signInWithGoogle();
                        },
                      ),
                    ],
                  ),
              ),
            ),
          ]
        ))
      ],
    ),

    ),

          /*Scaffold(
        backgroundColor: ColorConfig.colorLightGrey,
        resizeToAvoidBottomInset: false,
        appBar: const CommonAppBar(
          title: "Login ",
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: ColorConfig.colorBlurRadius,
            boxShadow: const[
              BoxShadow(
                blurRadius: 20
              )
            ]
          ),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "Please Verify Your Account",
                  style: CustomTextStyle.headingText,
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonTextField(
                  controller: controller.emailController,
                  validator: Validator.isEmail,
                  prefixIcon: const Icon(Icons.email_rounded),
                  prefixIconColor: ColorConfig.colorBlack,
                  hintText: 'enter email',
                  borderRadius: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonTextField(
                  controller: controller.passwordController,
                  isObscure: controller.isObscure.value,
                  validator: Validator.isPassword,
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: ColorConfig.colorBlack,
                  hintText: 'enter password',
                  borderRadius: 10,
                  suffixIcon: IconButton(
                      icon: Icon(controller.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility, color: controller.isObscure.value?Colors.black26:Colors.blue),
                      onPressed: () {
                        controller.isObscure.value =
                        !controller.isObscure.value;
                      }),
                ),

                const SizedBox(height: 1),
                TextButton(
                  onPressed: () {
                    // Get.toNamed(ForgotPasswordScreen.pageId, arguments: {
                    //   "isForgot": controller.isForgot.value = true,
                    //   "isPhone": controller.isPhone.value = false,
                    // });
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password",
                      style: CustomTextStyle.linkText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CommonButton(
                  onPressed: (){
                    controller.loginWithValidation();
                  },
                  color: ColorConfig.colorPrimary,
                  height: 40,
                  child:  Text("Login", style: CustomTextStyle.buttonText,),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      // Get.toNamed(RegisterScreen.pageId);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Don't have a account? ",
                          style: TextStyle(
                              color: ColorConfig.colorBlack, fontSize: 15),
                        ),
                        Text(
                          "Register",
                          style: TextStyle(
                              color: ColorConfig.colorLightBlue, fontSize: 18),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: Get.width * 0.3, height: 1, color: ColorConfig.colorPrimary),
                    const Spacer(),
                    const Text(
                      "Sign in With",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Container(
                      width: Get.width * 0.3,
                      height: 1,
                      color: ColorConfig.colorPrimary,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButton(
                      color: Colors.black,
                      height: 55,
                      width: 10,
                      onPressed: () {
                        Common.errorSnackBar("opps!", 'This Feature is Under Development');
                      },
                      child: const Icon(
                        Icons.phone_iphone,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    *//*CommonButton(
                      color: Colors.black,
                      height: 55,
                      width: 10,
                      onPressed: () async {
                        Common.errorSnackBar("opps!", 'This Feature is Under Development');
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.google,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CommonButton(
                      color: Colors.black,
                      height: 55,
                      width: 10,
                      onPressed: () async {
                        Common.errorSnackBar("opps!", 'This Feature is Under Development');
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),*//*
                  ],
                ),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}
