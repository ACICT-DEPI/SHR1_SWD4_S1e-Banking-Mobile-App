import 'package:bank_app/features/onboardingScreen/ui/widgets/OnboardingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/colors.dart';
import '../../../core/widgets/custom_app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                OnboardingPage(
                  imagePath: "assets/images/Onboarding_1.svg",
                  title: "Fastest Payment in \nthe world",
                  description: "Integrate multiple payment methods\n to help you up the process quickly",
                ),
                OnboardingPage(
                  imagePath: "assets/images/Onboarding_2.svg",
                  title: "The most Secure\n Platform for Customers",
                  description: "Built-in Fingerprint, face recognition\n and more, keeping you completely safe",
                ),
                OnboardingPage(
                  imagePath: "assets/images/Onboarding_3.svg",
                  title: "Paying for Everything is\n Easy and Convenient",
                  description: "Built-in Fingerprint, face recognition\n and more, keeping you completely safe",
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: CustomAppButton(
                  title: _currentPage == 2 ? "Get Started" : "Next",
                  onPressed: () {
                    if (_currentPage < 2) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } else {
                      // Navigate to home screen
                      /////////////////////////
                      /////////////////////////
                      /////////////////////////
                    }
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 320,
              left: 150,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.blue,
                  dotHeight: 7,
                  dotWidth: 7,
                ),
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
