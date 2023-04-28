import 'package:flutter/material.dart';
import 'package:flutter_api_project/homepage.dart';
import 'package:get_storage/get_storage.dart';

Future main() async {
  await GetStorage.init();

  runApp(
    const MaterialApp(
      title: "Awsomeapp",
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  );
}
