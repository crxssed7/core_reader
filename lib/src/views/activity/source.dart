import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:core_reader/src/api/core.dart';
import 'package:core_reader/src/api/models/models.dart';
import 'package:core_reader/src/views/widgets/widgets.dart';

class SourceActivity extends StatefulWidget {
  final Source source;

  const SourceActivity(this.source, {Key? key}) : super(key: key);

  @override
  State<SourceActivity> createState() => _SourceActivityState();
}

class _SourceActivityState extends State<SourceActivity> {
  Icon customIcon = const Icon(LineIcons.search);
  Widget? customSearchBar;

  @override
  void initState() {
    super.initState();
    customSearchBar = Text(widget.source.name ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == LineIcons.search) {
                  // Perform set of instructions.
                  customIcon = const Icon(Icons.clear);
                  customSearchBar = Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search ${widget.source.name}...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  );
                } else {
                  customIcon = const Icon(LineIcons.search);
                  customSearchBar = Text(widget.source.name ?? '');
                }
              });
            },
            icon: customIcon,
          )
        ],
        title: customSearchBar,
        elevation: 0,
      ),
      body: FutureBuilder<Information>(
        future: CoreClient.getSourceInfo(widget.source.endpoint ?? ''),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.65,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (_, index) => ItemResult(snapshot.data!.items![index]),
              itemCount: snapshot.data!.items!.length,
            );
          } else {
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          }
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
