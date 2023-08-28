import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe02_exe03/models/tenor_gif_model.dart';

class ListTileGif extends StatelessWidget {
  ListTileGif({super.key, required this.tenorGif});

  TenorGifModel tenorGif;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Image.network(
              tenorGif.imageURL,
              fit: BoxFit.contain,
            ),
          ),
          Text(tenorGif.imageTitle)
        ],
      ),
    );
  }
}
