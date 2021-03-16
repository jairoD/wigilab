import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String url;
  MyImage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          Center(child: Text('😢', style: TextStyle(color: Colors.white))),
      loadingBuilder: (BuildContext context, Widget child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
