import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medoraapp/presentation/Cubits/Promotions/promotions_cubit.dart';
import 'package:medoraapp/presentation/Cubits/Promotions/promotions_state.dart';
import 'package:medoraapp/presentation/Widgets/Home_View_Widgets/carousel_dots_indicator.dart';

class PromotionsSlider extends StatefulWidget {
  const PromotionsSlider({super.key});

  @override
  State<PromotionsSlider> createState() => _PromotionsSliderState();
}

class _PromotionsSliderState extends State<PromotionsSlider> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier(0);
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionsCubit, PromotionsState>(
      builder: (context, state) {
        if (state is PromotionsLoading || state is PromotionsInitial) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (_, __) => Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 3,
            ),
          );
        }

        if (state is PromotionsSuccessful) {
          return Column(
            children: [
              CarouselSlider(
                items: state.promotions.map((promotion) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(promotion.image, fit: BoxFit.cover),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                promotion.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                promotion.description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                carouselController: _controller,

                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    _currentIndexNotifier.value = index;
                  },
                ),
              ),

              const SizedBox(height: 12),

              ValueListenableBuilder<int>(
                valueListenable: _currentIndexNotifier,
                builder: (context, currentIndex, _) {
                  return CarouselDotsIndicator(
                    itemCount: state.promotions.length,
                    currentIndex: currentIndex,
                    onDotTapped: (index) {
                      _controller.animateToPage(index);
                    },
                  );
                },
              ),
            ],
          );
        }

        if (state is PromotionsFailure) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
