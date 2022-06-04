import 'package:core_reader/src/api/core.dart';
import 'package:flutter/material.dart';

import 'package:core_reader/src/api/models/models.dart';
import 'package:core_reader/src/views/widgets/widgets.dart';

class SourceActivity extends StatefulWidget {
  final Source source;

  const SourceActivity(this.source, {Key? key}) : super(key: key);

  @override
  State<SourceActivity> createState() => _SourceActivityState();
}

class _SourceActivityState extends State<SourceActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.source.name ?? ''),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
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
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
    );
  }
}
