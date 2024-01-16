import 'package:image_search_app_08_mvvm/dto/pixabay_dto.dart';
import 'package:image_search_app_08_mvvm/model/image_model.dart';

extension ImageDtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ??
          'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
      tags: tags ?? '',
    );
  }
}
