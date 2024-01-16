import 'package:image_search_app_08_mvvm/mapper/image_mapper.dart';
import 'package:image_search_app_08_mvvm/model/image_model.dart';
import 'package:image_search_app_08_mvvm/source/image_source.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems (String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = ImageItemApi();

  @override
  Future<List<ImageItem>> getImageItems (String query) async {
    final dto = await _api.getImageResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}