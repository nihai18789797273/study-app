import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/bindings/initial_bindings.dart';
import 'package:study_app/routes/app_routes.dart';

import 'controllers/theme_controller.dart';

// 此处代码仅用于上传数据到Google数据库
/* Future<void> main() async {
  //WidgetsFlutterBinding();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen()));
} */

void main() {
  // 此行代码的作用是，等待所有Binding执行完成
  WidgetsFlutterBinding();
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 设置主题颜色
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
