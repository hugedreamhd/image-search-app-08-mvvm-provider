import 'package:flutter/cupertino.dart';
import '../model/image_model.dart';
import '../repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final repository = PixabayImageItemRepository();

  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageItems = await repository.getImageItems(query);

    _isLoading = false;
    notifyListeners();
  }
}
