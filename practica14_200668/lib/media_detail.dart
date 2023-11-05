import 'package:practica14_200668/common/MediaProvider.dart';
import 'package:practica14_200668/model/Media.dart';
import 'package:flutter/material.dart';
import 'package:practica14_200668/cast_scroller.dart';
import 'package:flutter/painting.dart';
import 'dart:ui' as ui;

class MediaDetail extends StatelessWidget {
  final Media media;
  final MediaProvider provider;
  MediaDetail(this.media, this.provider);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            media.getPosterUrl(),
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 400.0,
                    height: 400.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(media.getPosterUrl())),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: Offset(0.0, 10.0))
                      ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            media.title,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'oswald'),
                          ),
                        ),
                        Text(
                          '${media.voteAverage.toString()}/10',
                        )
                      ],
                    )),
                Column(
                  children: <Widget>[
                    Text(
                      media.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 15,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'oswald'),
                    )
                  ],
                ),
                CastController(provider, media.id)
              ],
              
              ),
            ),
          )
        ],

      ),
    );
  }
}
