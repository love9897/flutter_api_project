import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootbundle;
import 'package:flutter_api_project/provider/MainProvider.dart';

import 'package:flutter_api_project/userDataModel.dart';

import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  Future<List<UserDataModel>> ReadJsonData() async {
    final jsondata =
        await rootbundle.rootBundle.loadString('json/userdata.json');
    final list = jsonDecode(jsondata) as List<dynamic>;

    return list.map((e) => UserDataModel.fromJson(e)).toList();
  }

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _Homepa = Homepage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final dialog = Provider.of<homeprovider>(context);

    return Scaffold(
        body: FutureBuilder(
      future: _Homepa.ReadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        } else if (snapshot.hasData) {
          var items = snapshot.data as List<UserDataModel>;

          return ListView.builder(
              itemCount: items == null ? 0 : items[0].users!.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        if (storage.read('islogged') != true &&
                            storage.read('age') != null) {
                          Navigator.pushNamed(context, '/second',
                              arguments: items[0].users![index]);
                        } else {
                          dialog.showdialog(context, items[0].users![index]);
                        }
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[0].users![index].name.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            items[0].users![index].id.toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                          child: Text(dialog.triling),
                          onPressed: () {
                            dialog.changetologin();
                          }),
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
}
