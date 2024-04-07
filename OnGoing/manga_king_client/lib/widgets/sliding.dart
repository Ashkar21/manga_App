import 'dart:async';
import 'package:flutter/material.dart';

// Sliding Photos
class SlidingPhotos extends StatefulWidget {
  const SlidingPhotos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SlidingPhotosState createState() => _SlidingPhotosState();
}

class _SlidingPhotosState extends State<SlidingPhotos> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<String> _imageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/manga-king-16cdd.appspot.com/o/Regressing%20with%20the%20King%E2%80%99s%20Power%2FImages%2FRegressingwith_theKingsPowerBanner14.png?alt=media&token=8ee5c1cb-3734-49d2-89f1-010183fab903',
    'https://firebasestorage.googleapis.com/v0/b/manga-king-16cdd.appspot.com/o/The%20Return%20of%20the%20Crazy%20Demon%2Fimages%2FCrazyDemon_Banner.png?alt=media&token=762e8bfb-8d33-49c7-908c-dde66c4935db',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Timer.periodic(const Duration(seconds: 8), (timer) {
      if (_currentPage < _imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 5000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: _controller,
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //On click
            },
            child: Image.network(
              _imageUrls[index],
              fit: BoxFit.fitHeight,
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
