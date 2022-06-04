import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({Key? key}) : super(key: key);

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  List<Widget> elements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(LineIcons.meteor),
        title: const Text(
          "Comics",
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      ),
      body: const Text("Comics"),
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
    );
  }
}