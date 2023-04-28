import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootbundle;
import 'package:flutter_api_project/userDataModel.dart';
import 'package:flutter_api_project/userdetails.dart';

import 'package:get_storage/get_storage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  TextEditingController _age = TextEditingController();
  TextEditingController _gender = TextEditingController();
  var storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: ReadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        } else if (snapshot.hasData) {
          var items = snapshot.data as List<UserDataModel>;
          return ListView.builder(
              itemCount: items == null ? 0 : items[0].users!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      "${items[0].users![index].name.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title:
                                              Text('Enter your age and gender'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: _age,
                                                decoration: InputDecoration(
                                                    labelText: 'Age'),
                                                keyboardType:
                                                    TextInputType.number,
                                                // onChanged: (value) => user.age =
                                                //     int.tryParse(value),
                                              ),
                                              TextField(
                                                controller: _gender,
                                                decoration: InputDecoration(
                                                    labelText: 'Gender'),
                                                // onChanged: (value) =>
                                                // user.gender = value,
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text('Done'),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserDetail()));
                                                _saveUsers(); // save user data to local storage
                                                // _navigateToUserScreen(); // navigate to user screen
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 20)),
                                  Container(
                                    width: 80,
                                    height: 35,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.blue[400],
                                      ),
                                      onPressed: () {},
                                      child: Text('Signin'),
                                    ),
                                    // child: ElevatedButton(
                                    //   onPressed: () {},
                                    //   style: ElevatedButton.styleFrom(
                                    //       textStyle: TextStyle(fontSize: 18),
                                    //       shape: RoundedRectangleBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(10),
                                    //       ),
                                    //       padding: EdgeInsets.symmetric(
                                    //           vertical: 10),
                                    //       backgroundColor: Colors.blue[200]),
                                    //   child: Text('Signin'),
                                    // ),
                                  ),
                                ],
                              ),
                              Text(
                                "${items[0].users![index].id.toString()}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  void _saveUsers() {
    // save users to local storage

    storage.write('age', _age.text);
    storage.write('gender', _gender.text);
  }
}

Future<List<UserDataModel>> ReadJsonData() async {
  final jsondata = await rootbundle.rootBundle.loadString('json/userdata.json');
  final list = jsonDecode(jsondata) as List<dynamic>;

  return list.map((e) => UserDataModel.fromJson(e)).toList();
}
