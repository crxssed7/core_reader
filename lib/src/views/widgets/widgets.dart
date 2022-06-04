import 'package:flutter/material.dart';

import 'package:core_reader/src/api/models/models.dart';

class ItemResult extends StatelessWidget {
  final Result item;

  const ItemResult(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tap");
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(150, 0, 0, 0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
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
