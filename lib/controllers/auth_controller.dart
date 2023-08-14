import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => navigationToIntroduction());
  }

  void navigationToIntroduction() {
    Get.offAllNamed("/introduction");
  }
}
