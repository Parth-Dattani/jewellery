import 'package:get/get.dart';

import '../controller/controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController(), permanent: false);
  }

}