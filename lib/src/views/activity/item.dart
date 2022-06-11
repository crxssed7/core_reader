import 'package:flutter/material.dart';

import 'package:core_reader/src/api/models/models.dart';

class ItemActivity extends StatefulWidget {
  final Item item;

  const ItemActivity(this.item, {Key? key}) : super(key: key);

  @override
  State<ItemActivity> createState() => _ItemActivityState();
}

class _ItemActivityState extends State<ItemActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name ?? ''),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 104,
                  height: 160,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Cover'),
                            content: Image.network(
                              widget.item.cover ?? '',
                            ),
                            backgroundColor: Theme.of(context).colorScheme.background,
                            scrollable: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        widget.item.cover ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: Text(
                    widget.item.name ?? '',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Summary'),
                        content: Text(widget.item.summary ?? ''),
                        backgroundColor: Theme.of(context).colorScheme.background,
                        scrollable: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  widget.item.summary ?? 'No summary',
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Status: ${widget.item.status ?? "UNKNOWN"}"),
                Text("Chapters: ${widget.item.chapters?.length}"),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
