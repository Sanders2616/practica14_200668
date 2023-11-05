import 'package:flutter/material.dart';
// import 'package:practica14_200668/common/HttpHandler.dart';
import 'package:practica14_200668/model/Media.dart';
import 'package:practica14_200668/media_list_item.dart';
import 'package:practica14_200668/common/MediaProvider.dart';
import 'package:practica14_200668/media_detail.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String category;
  MediaList(this.provider, this.category);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = [];
      loadMedia();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var media = await widget.provider.fetchMedia(widget.category);
    setState(() {
      _media.addAll(media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8), // Establece el margen aquí
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MediaDetail(_media[index],widget.provider
                  );
                }));
              },
              child: MediaListItem(_media[index]),
            ),
          );
        },
      ),
    );
  }
}
