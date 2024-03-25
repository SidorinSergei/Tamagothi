import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TamagothiGallery extends StatefulWidget {
  final List<String> images;
  final Function(int) onSkinDoubleTapped;
  final List<int> purchasedSkins;
  final List<int> prices;

  TamagothiGallery({
    super.key,
    required this.images,
    required this.onSkinDoubleTapped,
    required this.purchasedSkins,
    required this.prices,
  });

  @override
  _TamagothiGalleryState createState() => _TamagothiGalleryState();
}

class _TamagothiGalleryState extends State<TamagothiGallery> {
  final PageController _pageController = PageController();
  ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int currentPage = _pageController.page?.round() ?? 0;
      if (currentPage != _currentPage.value) {
        _currentPage.value = currentPage;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView( // Makes the entire column scrollable
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.3),
          Container(
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.4,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: () => widget.onSkinDoubleTapped(index),
                  child: Image.asset(widget.images[index]),
                );
              },
            ),
          ),
          SizedBox(height: screenSize.height * 0.1),
          ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (context, value, child) {
              // Check if 'prices' list contains a price for the current page
              String priceText = (value < widget.prices.length) ? "${widget.prices[value]}₴" : "N/A";
              bool isPurchased = widget.purchasedSkins.contains(value);
              return Column(
                children: [
                  Text(
                    isPurchased ? "Куплен" : priceText,
                    style: TextStyle(fontSize: screenSize.height * 0.05, fontWeight: FontWeight.bold, color: Colors.orange[200]),
                  ),
                  if (isPurchased)
                    Icon(Icons.check, size: screenSize.height * 0.07, color: Colors.green),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
