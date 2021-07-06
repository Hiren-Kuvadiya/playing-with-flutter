import 'package:flutter/material.dart';
import 'package:flutter_app/utils/MyDimensions.dart';

class RoundedCornerImage extends StatelessWidget {
  final String imageUrl;

  const RoundedCornerImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 400,
        width: 400,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            )),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(4, 8),
            ),
          ],
        ),

      ),
    );
  }

}
