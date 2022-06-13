import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:core_reader/src/api/models/models.dart';

class Reader extends StatefulWidget {
  final Chapter chapter;
  final SourceType sourceType;
  const Reader(this.chapter, this.sourceType, {Key? key}) : super(key: key);

  @override
  State<Reader> createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  bool showAppBar = false;

  @override
  Widget build(BuildContext context) {
    bool rightToLeft = false;
    if (widget.sourceType == SourceType.manga) {
      rightToLeft = true;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: showAppBar ? AppBar(
        title: Text(widget.chapter.name ?? ''),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: const Icon(LineIcons.plane),
          )
        ],
      ) : null,
      body: GestureDetector(
        onTap: () {
          setState(() {
            showAppBar = !showAppBar;
          });
        },
        child: PhotoViewGallery.builder(
          itemCount: widget.chapter.images?.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                  widget.chapter.images?[index] ?? '# TODO: Not found URL'),
              // Contained = the smallest possible size to fit one dimension of the screen
              minScale: PhotoViewComputedScale.contained,
              // Covered = the smallest possible size to fit the whole screen
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          reverse: rightToLeft,
        ),
      ),
    );
  }
}
