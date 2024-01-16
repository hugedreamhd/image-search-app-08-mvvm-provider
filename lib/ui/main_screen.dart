import 'package:flutter/material.dart';
import 'package:image_search_app_08_mvvm/ui/image_item_widget.dart';
import 'package:image_search_app_08_mvvm/ui/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  final mainViewModel = MainViewModel();

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.orange,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.orangeAccent,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: '입력하세요',
                  suffixIcon: IconButton(
                    onPressed: () {
                      mainViewModel.searchImage(
                        searchTextEditingController.text,
                      );
                    },
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              mainViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: mainViewModel.imageItems.length,
                        itemBuilder: (context, index) {
                          final imageItems = mainViewModel
                              .imageItems[index]; // final이 없으면 왜 안되지?
                          return ImageItemWidget(
                            imageItem: imageItems,
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
