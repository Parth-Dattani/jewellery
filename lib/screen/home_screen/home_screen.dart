import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../productScreen/product_screen.dart';

class HomeScreen extends GetView<HomeController> {
  static const pageId = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => CommonLoader(
        isLoad: controller.loader.value,
        body : Scaffold(
          key: controller.scaffoldKey,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: ColorConfig.colorBlack,
                          child: Image.network(controller.categoryList.value.categories![0].image.toString(),

                          ),
                        ),
                        Positioned(child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, size: 30, color: ColorConfig.colorWhite,)),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 25, color: ColorConfig.colorWhite,)),
                          ],
                        )),
                        Positioned(
                            bottom: 10, left: 10,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Winter Collection", style: CustomTextStyle.buttonText ,),
                            Text("Winter Collection > ", style: CustomTextStyle.subTitleText,),

                          ],
                        )),
                      ],
                    ),
                    const SizedBox(height: 15,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Category", style: CustomTextStyle.headingText,),
                         Text("ALL >", style: CustomTextStyle.rememberText,),
                       ],
                     ),
                    const SizedBox(height: 15,),
                    controller.categoryList != null?

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.categoryList.value.categories!.length,
                  itemBuilder:(context, index) {
                    return GestureDetector(
                      onTap: (){
                        debugPrint("sfsdf ");
                        Get.toNamed(ProductScreen.pageId,
                        arguments: {
                          "category" : controller.categoryList.value.categories![index].id
                        }
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.teal
                        ),
                        child: Center(child: Text(
                            controller.categoryList!=null ?
                            controller.categoryList.value.categories![index].slug.toString() :"dsf"
                        )),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 18,
                  ),
                )
                    : const Text("No Data Found"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
