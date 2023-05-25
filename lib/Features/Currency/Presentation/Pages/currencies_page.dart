import 'package:currency_and_gold_app/Core/Constants/app_constants.dart';
import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:currency_and_gold_app/Core/Widgets/loading_widget.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/StateManagements/curruncy/currency_bloc.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/Widgets/currencies_header_widget.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/Widgets/currency_item.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/Widgets/last_update_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class CurrnciesPage extends StatefulWidget {
  const CurrnciesPage({super.key});

  @override
  State<CurrnciesPage> createState() => _CurrnciesPageState();
}

class _CurrnciesPageState extends State<CurrnciesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        if (state is LoadingCurrenciesState) {
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
              child: LoadingWidget(),
            ),
          );
        } else if (state is LoadedCurrenciesState) {
          AppConstants.currenciesList = state.currenciesList;

          return Container(
              child: _BuildPageBody(currencies: state.currenciesList));
        } else if (state is ErrorLoadingCurrenciesState) {
          return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<CurrencyBloc>(context)
                    .add(GetAllCurrenciesEvent());
              },
              child: Container(
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
                  child: ListView(
                      padding:
                          EdgeInsets.only(top: 20.h, left: 2.w, right: 2.w),
                      children: [Text(state.message.translate(context))]),
                ),
              ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}

// ignore: must_be_immutable
class _BuildPageBody extends StatefulWidget {
  List<Currency> currencies;
  _BuildPageBody({
    required this.currencies,
  });

  @override
  State<_BuildPageBody> createState() => _BuildPageBodyState();
}

class _BuildPageBodyState extends State<_BuildPageBody> {
  List<Currency> foundedUsers = [];

  @override
  void initState() {
    foundedUsers = widget.currencies;
    super.initState();
  }

  void _search(String code) {
    if (code == "") {
      foundedUsers = widget.currencies;
      setState(() {});
      return;
    } else {
      foundedUsers = widget.currencies.where((element) {
        if (element.code.contains(code.toUpperCase())) {
          return true;
        }
        return false;
      }).toList();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<CurrencyBloc>(context).add(GetAllCurrenciesEvent());
      },
      child: Container(
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return StickyHeader(
                    header: Container(),
                    content: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LastUpdateRichText(
                              dateTime: DateTime.now(),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            TextField(
                              onChanged: (value) {
                                _search(value);
                              },
                              decoration: InputDecoration(
                                hintText: "SEARCH".translate(context),
                                prefixIcon: const Icon(Icons.search),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2.h)),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: "EXPLAIN_TEXT_P1".translate(context),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "EXPLAIN_TEXT_P2".translate(context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  TextSpan(
                                      text:
                                          "EXPLAIN_TEXT_P3".translate(context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  );
                } else {
                  return StickyHeader(
                    header: CurrenciesHeaderWidget(),
                    content: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: foundedUsers.length,
                      itemBuilder: (context, index) => CurrencyItem(
                          code: foundedUsers[index].code,
                          currency: foundedUsers[index].currency,
                          sell: foundedUsers[index].sell,
                          buy: foundedUsers[index].buy,
                          flag: foundedUsers[index].flag),
                    ),
                  );
                }
              },
            )),
      ),
    );
  }
}
