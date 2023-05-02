import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends GetView<ProductController> {
  static const pageId = '/ProductScreen';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonLoader(
        isLoad: controller.loader.value,
        body: Scaffold(
          //key: controller.scaffoldKey,
          appBar: CommonAppBar(
            title: "Product Screen",
            leadingIcon: ImagePath.arrowBack,
            leadingOnTap: () {
               Get.back();
            },
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Product List",
                      style: CustomTextStyle.headingText,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                      itemBuilder: (context, index) {
                        return controller.resultDataList.value.categories!.isNotEmpty
                            ? Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  //mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    dataList(
                                        "createdAt : ",
                                        controller.resultDataList.value.categories![index].createdAt.toString()),
                                    dataList(
                                        "Status : ",
                                        controller.resultDataList.value.categories![index].status.toString()),
                                    dataList(
                                        "Category : ",
                                        controller.resultDataList.value.categories![index].slug.toString()),

                                    CommonButton(
                                      onPress: (){},
                                      name: "Add to Cart",
                                      color: ColorConfig.colorGreenText,
                                    )
                                  ],
                                ),

                              )
                            : const Center(child: Text("No data Found"));
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 18,
                              childAspectRatio: 0.7),
                      itemCount: controller.resultDataList.value.categories!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dataList(title, description) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),
          ),
        ),
        Flexible(
          child: Text(description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
        ),
      ],
    );
  }
}
