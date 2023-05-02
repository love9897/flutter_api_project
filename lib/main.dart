import 'package:flutter/material.dart';
import 'package:flutter_api_project/provider/MainProvider.dart';
import 'package:flutter_api_project/homepage.dart';
import 'package:flutter_api_project/userdetails.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future main() async {
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => homeprovider())],
      child: MaterialApp(
        title: "Awsomeapp",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (context) => Homepage(),
          '/second': (context) => UserDetail(),
        },
      ),
    ),
  );
}
