import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:core_reader/src/api/core.dart';
import 'package:core_reader/src/api/models/models.dart';
import 'package:core_reader/src/views/activity/source.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<Widget> elements = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(LineIcons.search),
            title: const Text(
              "Discover",
            ),
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 8, 8, 8),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Comics"),
                Tab(text: "Manga"),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: const TabBarView(
            children: [ComicSources(), MangaSources()],
          ),
          backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        ));
  }
}

// -----------------------------------------------------------------------------

class ComicSources extends StatefulWidget {
  const ComicSources({Key? key}) : super(key: key);

  @override
  State<ComicSources> createState() => _ComicSourcesState();
}

class _ComicSourcesState extends State<ComicSources> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>>(
      future: CoreClient.getSources(SourceType.comics),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => SourceElement(snapshot.data![index]),
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        }
      },
    );
  }
}

// -----------------------------------------------------------------------------

class MangaSources extends StatefulWidget {
  const MangaSources({Key? key}) : super(key: key);

  @override
  State<MangaSources> createState() => _MangaSourcesState();
}

class _MangaSourcesState extends State<MangaSources> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>>(
      future: CoreClient.getSources(SourceType.manga),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => SourceElement(snapshot.data![index]),
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        }
      },
    );
  }
}

// -----------------------------------------------------------------------------

class SourceElement extends StatefulWidget {
  final Source source;

  const SourceElement(this.source, {Key? key}) : super(key: key);

  @override
  State<SourceElement> createState() => _SourceElementState();
}

class _SourceElementState extends State<SourceElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SourceActivity(widget.source)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image(
              image: Image.network(widget.source.logo!).image,
              width: 50.0,
              height: 50.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Text(
                    widget.source.name ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Text(
                    widget.source.url ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
