import 'package:flutter/material.dart';
import 'package:flutter_api_project/userDataModel.dart';

import 'package:get_storage/get_storage.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final storage = GetStorage();
  late Users _user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Container(
          // color: Colors.white,
          child: Column(
            children: [
              Text('Age: ${storage.read('age')}'),
              Text('Gender: ${storage.read('gender')}'),
            ],
          ),
        ),
      ),
    );
  }
}
