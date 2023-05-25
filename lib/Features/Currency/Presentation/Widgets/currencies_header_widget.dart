import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrenciesHeaderWidget extends StatelessWidget {
  const CurrenciesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      padding: EdgeInsets.only(left: 4.w, right: 8.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(4.h), topLeft: Radius.circular(4.h)),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "CURRENCY".translate(context),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Text(
            "BUY".translate(context),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 14.w,
          ),
          Text(
            "SELL".translate(context),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
