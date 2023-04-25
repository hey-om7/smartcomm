import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return PageView.builder(
          controller: PageController(
            viewportFraction: 0.3,
            initialPage: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            final int currentPage = index % 4;
            return Transform.scale(
              scale: Curves.easeInOut.transform(_animationController.value),
              child: Image.network(
                // Replace with your own image URLs
                'https://picsum.photos/200?image=$currentPage',
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
