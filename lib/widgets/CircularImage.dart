import 'package:flutter/material.dart';
import 'package:flutter_app/utils/MyDimensions.dart';

class CircularImage extends StatelessWidget {
  final String imageUrl;

  const CircularImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 5.0,
              spreadRadius: 2.0,
            )
          ],
        ),

        child: ClipOval(
          child: Image.network(
            imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

  }
}
