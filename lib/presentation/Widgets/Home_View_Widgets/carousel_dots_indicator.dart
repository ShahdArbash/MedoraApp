import 'package:flutter/material.dart';

class CarouselDotsIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final ValueChanged<int>? onDotTapped;

  const CarouselDotsIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.onDotTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final isActive = index == currentIndex;

        return GestureDetector(
          onTap: () => onDotTapped?.call(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 18 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}
