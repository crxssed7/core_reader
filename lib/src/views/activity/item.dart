import 'package:core_reader/src/views/widgets/widgets.dart';
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
    var poster = SizedBox(
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
    );

    var header = Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          poster,
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name ?? '',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    "Status: ${widget.item.status ?? "Unknown"}"
                ),
              ],
            ),
          ),
        ],
      ),
    );

    var summary = Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
    );

    var genres = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: buildGenreChips(),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name ?? ''),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header,
            summary,
            genres,
            buildChapterList(),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  List<Widget> buildGenreChips() {
    var chips = widget.item.genres?.map((genre) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(genre),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      );
    }).toList();

    if (chips != null) {
      return chips;
    } else {
      return <Widget>[];
    }
  }

  Widget buildChapterList() {
    var chapters = widget.item.chapters?.map((chapter) {
      return ChapterButton(chapter);
    }).toList();

    if (chapters != null) {
      return Column(
        children: chapters,
      );
    } else {
      return const Text("No chapters found");
    }
  }
}
