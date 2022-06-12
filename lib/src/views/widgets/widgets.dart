import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:core_reader/src/api/core.dart';
import 'package:core_reader/src/api/models/models.dart';
import 'package:core_reader/src/views/activity/item.dart';

class ItemResult extends StatelessWidget {
  final Result item;

  const ItemResult(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        // Get the item details
        CoreClient.getItemDetails(item.detail ?? '').then((value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemActivity(value),
          ),
        ));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              item.cover ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(175, 0, 0, 0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                item.name ?? '',
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------

class ChapterButton extends StatelessWidget {
  final ChapterResult chapter;
  const ChapterButton(this.chapter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(chapter.name ?? ''),
            IconButton(
              onPressed: () {},
              icon: const Icon(LineIcons.download),
            )
          ],
        ),
      ),
    );
  }
}
