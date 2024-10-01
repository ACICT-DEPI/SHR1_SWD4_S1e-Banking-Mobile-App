import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/colors.dart';
import '../../../core/widgets/custom_app_button.dart';
import '../../../generated/l10n.dart';
import '../../authentication/presentation/views/login_view.dart';
import 'widgets/onboarding_page.dart';

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
    final double widthFactor = MediaQuery.of(context).size.width / 411;
    final double heightFactor = MediaQuery.of(context).size.height / 890;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                OnboardingPage(
                  imagePath: "assets/images/Onboarding_1.svg",
                  title: S.of(context).FastestPayment,
                  description: S.of(context).FastestPaymentDescription,
                ),
                OnboardingPage(
                  imagePath: "assets/images/Onboarding_2.svg",
                  title: S.of(context).SecurePlatform,
                  description: S.of(context).SecurePlatformDescription,
                ),
                OnboardingPage(
                  imagePath: "assets/images/Onboarding_3.svg",
                  title: S.of(context).PayingEverything,
                  description: S.of(context).PayingEverythingDescription,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40 * heightFactor,
                  horizontal: 16 * widthFactor,
                ),
                child: CustomAppButton(
                  title: _currentPage == 2
                      ? S.of(context).GetStarted
                      : S.of(context).Next,
                  onPressed: () {
                    if (_currentPage < 2) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 320 * heightFactor,
              left: 150 * widthFactor,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
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
