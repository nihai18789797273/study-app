import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/questions_paper/data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  final DataUploader _controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Uploading!"),
      ),
    );
  }
}
