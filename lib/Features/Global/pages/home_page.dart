import 'package:currency_and_gold_app/Core/Constants/app_constants.dart';
import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:currency_and_gold_app/Core/Themes/Colors/app_color.dart';
import 'package:currency_and_gold_app/Core/Themes/FontsStyles/app_font_styles.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/Pages/currencies_page.dart';
import 'package:currency_and_gold_app/Features/Gold/Presentation/Pages/gold_page.dart';
import 'package:currency_and_gold_app/Features/Global/pages/settings_page.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/Pages/convert.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _loadItems(BuildContext context) {
    bottomNavigationBarItems = [
      CurvedNavigationBarItem(
          child: Icon(
            Icons.currency_exchange_rounded,
            color: AppColors.white,
            size: SizerUtil.height / 20,
          ),
          label: "CURRENCIES".translate(context),
          labelStyle: AppFontStyles.bottombarLabels),
      CurvedNavigationBarItem(
          child: Icon(
            Icons.calculate_rounded,
            color: AppColors.white,
            size: SizerUtil.height / 20,
          ),
          label: "CONVERTER".translate(context),
          labelStyle: AppFontStyles.bottombarLabels),
      CurvedNavigationBarItem(
          child: Icon(
            Icons.crop_3_2_rounded,
            color: AppColors.white,
            size: SizerUtil.height / 20,
          ),
          label: "GOLD".translate(context),
          labelStyle: AppFontStyles.bottombarLabels),
      CurvedNavigationBarItem(
          child: Icon(
            Icons.settings_rounded,
            color: AppColors.white,
            size: SizerUtil.height / 20,
          ),
          label: "SETTINGS".translate(context),
          labelStyle: AppFontStyles.bottombarLabels)
    ];
  }

  late List<CurvedNavigationBarItem> bottomNavigationBarItems = [];
  final pagesList = const [
    CurrnciesPage(),
    ConvertPage(),
    GoldPage(),
    SettingsPage(),
  ];

  int _pageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    _loadItems(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Image(
            image: AssetImage("assets/images/AppBarImage.png"),
            fit: BoxFit.cover),
        elevation: 0.0,
      ),
      body: _bodyBuilder(context),
      bottomNavigationBar: _bottomNavigationBarBuilder(
          context, bottomNavigationBarItems, _pageIndex, _pageController),
      floatingActionButton: _pageIndex != 3
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                _calllauncher();
              },
              child: Icon(
                Icons.phone_in_talk_rounded,
                color: AppColors.white,
                size: SizerUtil.height / 20,
              ),
            )
          : Container(),
    );
  }

  Widget _bodyBuilder(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          _pageIndex = newIndex;
          setState(() {});
        },
        children: pagesList,
      ),
    );
  }

  _calllauncher() async {
    if (await canLaunchUrl(Uri.parse(AppConstants.phoneNumber))) {
      await launchUrlString(AppConstants.phoneNumber);
    } else {
      print("Error");
    }
  }

  Widget _bottomNavigationBarBuilder(BuildContext context,
      bottomNavigationBarItems, pageIndex, PageController pageController) {
    return Sizer(
      builder: (context, orientation, deviceType) => CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Theme.of(context).colorScheme.primary,
        items: bottomNavigationBarItems,
        index: pageIndex,
        onTap: (newIndex) {
          pageController.jumpToPage(newIndex);
        },
        animationDuration: Duration(milliseconds: 500),
      ),
    );
  }
}
