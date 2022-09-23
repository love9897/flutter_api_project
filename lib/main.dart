import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Awsomeapp",
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Awesome App")),
      body: Container(
        color: Color.fromARGB(255, 184, 172, 172),
        child: Center(child: const Text('hi flutter')),
      ),
    );
  }
}
