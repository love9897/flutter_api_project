import 'package:flutter/material.dart';
import 'package:flutter_api_project/userDataModel.dart';

import 'package:get_storage/get_storage.dart';

class UserDetail extends StatelessWidget {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    Users user = ModalRoute.of(context)!.settings.arguments as dynamic;
    ;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Details'),
        ),
        body: Center(
          child: Container(
            // color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Name:${user.name}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Age: ${storage.read('age')}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Gender: ${storage.read('gender')}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
