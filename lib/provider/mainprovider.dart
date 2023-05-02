
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

TextEditingController _age = TextEditingController();
TextEditingController _gender = TextEditingController();
var storage = GetStorage();

class homeprovider extends ChangeNotifier {
  void saveUsers() {
    // save users to local storage

    storage.write('age', _age.text);
    storage.write('gender', _gender.text);
    notifyListeners();
  }

  late String triling = 'Logout';

  String get trail => triling;

  void changetologin() {
    triling = 'Login';
    storage.erase();
    notifyListeners();
  }

  void _changetologout() {
    triling = 'Logout';
    notifyListeners();
  }

  void showdialog(context, argument) {
    //dialogbox for age and gender
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter your age and gender'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _age,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _gender,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('Done'),
            onPressed: () {
              Navigator.pop(context);
              saveUsers();
              _changetologout();
              Navigator.pushNamed(context, '/second', arguments: argument);
            },
          ),
        ],
      ),
    );

    notifyListeners();
  }
}
