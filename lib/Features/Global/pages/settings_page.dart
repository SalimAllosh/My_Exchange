import 'package:currency_and_gold_app/Core/Constants/app_constants.dart';
import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:currency_and_gold_app/Features/Global/Cubit/LanguageCubit/language_cubit.dart';
import 'package:currency_and_gold_app/Features/Global/cubit/ModeCubit/mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool switchState =
        BlocProvider.of<ModeCubit>(context, listen: false).isDark();

    return Container(
      padding: EdgeInsets.only(top: 1.h),
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.w),
            topRight: Radius.circular(4.w),
          ),
        ),
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 2,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                leading: Icon(Icons.nightlight, color: Colors.black),
                title: Text(
                  "DARK_MODE".translate(context),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: switchState,
                  onChanged: (value) {
                    BlocProvider.of<ModeCubit>(context, listen: false)
                        .ToggleState();
                  },
                ),
              );
            } else if (index == 1) {
              return ListTile(
                  leading: Icon(Icons.translate_outlined, color: Colors.black),
                  title: Text(
                    "LANGUAGES".translate(context),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<LanguageCubit>(context,
                                    listen: false)
                                .changeLanguage("ar");
                          },
                          icon: Image.asset(
                              "assets/icons/Flag_of_the_United_Arab_Emirates.svg.png"),
                          iconSize: 7.h),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<LanguageCubit>(context,
                                    listen: false)
                                .changeLanguage("en");
                          },
                          icon: Image.asset(
                              "assets/icons/Flag_of_the_United_States.png"),
                          iconSize: 7.h),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<LanguageCubit>(context,
                                    listen: false)
                                .changeLanguage("sv");
                          },
                          icon: Image.asset(
                              "assets/icons/Flag_of_Sweden.svg.png"),
                          iconSize: 7.h),
                    ],
                  ));
            } else {
              return ListTile(
                leading: Icon(Icons.question_mark_rounded, color: Colors.black),
                title: Text(
                  "ABOUT_US".translate(context),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: ElevatedButton(
                  onPressed: () async {
                    if (await canLaunchUrlString(AppConstants.webPageAboutUs)) {
                      await launchUrlString(AppConstants.webPageAboutUs);
                    } else {
                      throw 'Could not launch ${AppConstants.webPageAboutUs}';
                    }
                  },
                  child: Icon(Icons.link),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.w),
                  )),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
