import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/routes/app_routes.dart';

import 'bindings/initial_bindings.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';

// 此处代码仅用于上传数据到Google数据库
/* Future<void> main() async {
  //WidgetsFlutterBinding();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen()));
} */

void main() async {
  // 此行代码的作用是，等待所有Binding执行完成
  WidgetsFlutterBinding();
  InitialBindings().dependencies();
  // 使用任何 Firebase 产品之前调用 ，必须
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Firebase.initializeApp();
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
