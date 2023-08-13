import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
}

void uploadData() async {
  final manifestContent = await DefaultAssetBundle.of(Get.context!)
      .loadString("AssetManifest.json");
  json.encode(manifestContent);
}
