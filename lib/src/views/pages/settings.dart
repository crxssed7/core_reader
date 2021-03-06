import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Widget> elements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(LineIcons.cog),
        title: const Text(
          "Settings",
        ),
        elevation: 0,
      ),
      body: const Text("Settings"),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}