import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/questions_paper/data_uploader.dart';
import 'package:study_app/firebase_ref/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  final DataUploader _controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
              _controller.loadingStatus.value == LoadingStatus.completed
                  ? "Uploading completed"
                  : "Uploading...",
            )),
      ),
    );
  }
}
