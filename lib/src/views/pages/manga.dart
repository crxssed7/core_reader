import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MangaPage extends StatefulWidget {
  const MangaPage({Key? key}) : super(key: key);

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  List<Widget> elements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(LineIcons.dragon),
        title: const Text(
          "Manga",
        ),
        elevation: 0,
      ),
      body: const Text("Manga"),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}