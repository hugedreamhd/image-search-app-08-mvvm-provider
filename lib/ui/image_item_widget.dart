import 'package:flutter/material.dart';
import 'package:image_search_app_08_mvvm/model/image_model.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageItem imageItem;

  const ImageItemWidget({
    super.key,
    required this.imageItem,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageItem.imageUrl,//주소는 왜 오류가 났지?
        fit: BoxFit.cover,
      ),
    );
  }
}
