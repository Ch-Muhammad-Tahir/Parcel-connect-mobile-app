import 'package:flutter/material.dart';
import '../../providers/on_boarding_provider.dart';
import '../../views/home_page/home_screen.dart';
import '../../views/login_screen/login_screen.dart';
import 'package:provider/provider.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_text.dart';
import 'custom_on_boarding_view/custom_on_boardibg_view.dart';

class OnBoardingMainScreen extends StatefulWidget {
  const OnBoardingMainScreen({super.key});

  @override
  State<OnBoardingMainScreen> createState() => _OnBoardingMainScreenState();
}

class _OnBoardingMainScreenState extends State<OnBoardingMainScreen> {
  bool showBlueText = false;
  bool showWhiteText = false;
  bool showTopContainer = false;
  late PageController onBoardingPageContorller;
  int currentPage = 0;
  @override
  void initState() {
    onBoardingPageContorller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    onBoardingPageContorller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: GetScreenSize.getScreenWidth(context) * 1.8,
                child: Consumer<OnBoardingProvider>(
                  builder: (context, provider, child) {
                    return PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: onBoardingPageContorller,
                        itemCount: provider.title.length,
                        itemBuilder: (context, index) {
                          print(index);
                          if (index == 0) {
                            showWhiteText = true;
                            showTopContainer = true;
                          } else {
                            showWhiteText = false;
                            showTopContainer = false;
                          }

                          if (index == 1) {
                            showBlueText = true;
                          } else {
                            showBlueText = false;
                          }
                          if (index == 2) {
                            showTopContainer = true;
                          }
                          return CustomOnBoaringViewWidget(
                            showTopContainer: showTopContainer,
                            showWhiteText: showWhiteText,
                            centerImage: provider.centerImages[index],
                            showBlueText: showBlueText,
                            topShapeImage: provider.topTopShape[index],
                            discriptions: provider.discription[index],
                            title: provider.title[index],
                          );
                        });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreenWidget()),
                          );
                        },
                        child: CustomText(
                            text: "Skip",
                            color: Colors.blue,
                            size: GetScreenSize.getScreenWidth(context) * 0.04,
                            maxline: 1,
                            fontWeight: FontWeight.w500)),
                    TextButton(
                        onPressed: () {
                          onBoardingPageContorller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: CustomText(
                            text: "Next",
                            color: Colors.blue,
                            size: GetScreenSize.getScreenWidth(context) * 0.04,
                            maxline: 1,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
