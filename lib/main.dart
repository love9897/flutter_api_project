import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    title: "Awsomeapp",
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var stringResponse;
  var listResponse;
  var MapResponse;
  var Listoffacts;

  Future fetchData() async {
    http.Response response;
    response = await http.get(
      Uri.parse('https://thegrowingdeveloper.org/apiview?id=2'),
    );
    if (response.statusCode == 200) {
      setState(() {
        MapResponse = json.decode(response.body);
        Listoffacts = MapResponse['facts'];
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("APi from internet")),
      body: MapResponse == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    MapResponse['category'].toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network(Listoffacts[index]['image_url']),
                            Text(
                              Listoffacts[index]['title'].toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Listoffacts[index]['description'].toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: Listoffacts == null ? 0 : Listoffacts.length,
                  ),
                ],
              ),
            ),
    );
  }
}

//  body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     children: [
      //       Container(
      //         alignment: Alignment.center,
      //         // padding: EdgeInsets.all(0),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(10),
      //             gradient:
      //                 LinearGradient(colors: [Colors.red, Colors.orange])),
      //         height: 100,
      //         width: 100,
      //         // color: Color.fromARGB(255, 137, 77, 77),
      //         child: const Text('Widgets'),
      //       ),
      //       SizedBox(width: 40),
      //       Container(
      //         alignment: Alignment.center,
      //         // padding: EdgeInsets.all(0),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10.0),
      //           gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
      //         ),
      //         height: 100,
      //         width: 100,
      //         // color: Color.fromARGB(255, 137, 77, 77),
      //         child: const Text('Properties'),
      //       ),
      //     ],
      //   ),
      // ),