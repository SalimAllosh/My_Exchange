import 'package:currency_and_gold_app/Core/Constants/app_constants.dart';
import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/Modules/currency_model.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Entities/currency.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/Widgets/last_update_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  final List<Currency> currencies = AppConstants.currencies;

  late final Currency initBuyCurrency;
  late final Currency initSellCurrency;

  final TextEditingController buyTextController = TextEditingController();
  final TextEditingController sellTextController = TextEditingController();

  late Currency buyCurrency;
  late Currency sellCurrency;

  bool isEnabled = false;

  @override
  void initState() {
    if (AppConstants.currenciesList.length > 0) {
      initBuyCurrency = currencies.singleWhere(
        (element) => element.code == "SEK",
        orElse: () => CurrencyModel(
            code: "code",
            currency: "currency",
            sell: "sell",
            buy: "buy",
            flag: "flag"),
      );

      initSellCurrency = currencies.singleWhere(
        (element) => element.code == "USD",
        orElse: () => CurrencyModel(
            code: "code",
            currency: "currency",
            sell: "sell",
            buy: "buy",
            flag: "flag"),
      );

      buyCurrency = initBuyCurrency;
      sellCurrency = initSellCurrency;

      if (currencies.length > 0) {
        isEnabled = true;
      }
      buyTextController.text = "1";
      sellTextController.text =
          convertCurrency(sellCurrency, buyCurrency, 1, false);
    } else {
      buyCurrency = Currency(
          code: "SEK",
          currency: "Sweden Krona",
          sell: "1",
          buy: "1",
          flag: "https://mychangeab.se/flags/SEK.png");
      sellCurrency = Currency(
          code: "SEK",
          currency: "Sweden Krona",
          sell: "1",
          buy: "1",
          flag: "https://mychangeab.se/flags/SEK.png");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1.h),
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.w),
            topRight: Radius.circular(4.w),
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LastUpdateRichText(dateTime: DateTime.now()),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "BUY".translate(context),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 2.w, 2.w, 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  border: Border.all(
                      width: 2, color: Theme.of(context).colorScheme.primary)),
              child: ListTile(
                leading: Container(
                  height: 15.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(buyCurrency.flag),
                        fit: BoxFit.cover),
                  ),
                ),
                title: DropdownButton(
                  isExpanded: true,
                  isDense: false,
                  value: buyCurrency.code,
                  onChanged: (currencyCode) {
                    changeCurrency(currencyCode, true);
                  },
                  items: List.generate(
                    currencies.length,
                    (index) => DropdownMenuItem(
                      value: currencies[index].code,
                      child: Text(currencies[index].code),
                    ),
                  ),
                ),
                subtitle: Text(buyCurrency.currency,
                    style: Theme.of(context).textTheme.displayMedium,
                    overflow: TextOverflow.ellipsis),
                trailing: SizedBox(
                    width: 20.w,
                    child: TextField(
                      enabled: isEnabled,
                      controller: buyTextController,
                      onChanged: (value) {
                        setState(() {
                          sellTextController.text = convertCurrency(
                              sellCurrency,
                              buyCurrency,
                              double.parse(value),
                              false);
                        });
                      },
                      keyboardType: TextInputType.number,
                    )),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            _buildSwitchBotton(context),
            Text(
              "SELL".translate(context),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 2.w, 2.w, 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  border: Border.all(
                      width: 2, color: Theme.of(context).colorScheme.primary)),
              child: ListTile(
                leading: Container(
                  height: 15.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(sellCurrency.flag),
                        fit: BoxFit.cover),
                  ),
                ),
                title: DropdownButton(
                  isExpanded: true,
                  isDense: false,
                  value: sellCurrency.code,
                  onChanged: (currencyCode) {
                    changeCurrency(currencyCode, false);
                  },
                  items: List.generate(
                    currencies.length,
                    (index) => DropdownMenuItem(
                      value: currencies[index].code,
                      child: Text(currencies[index].code),
                    ),
                  ),
                ),
                subtitle: Text(sellCurrency.currency,
                    style: Theme.of(context).textTheme.displayMedium,
                    overflow: TextOverflow.ellipsis),
                trailing: SizedBox(
                    width: 20.w,
                    child: TextField(
                      enabled: isEnabled,
                      controller: sellTextController,
                      onChanged: (value) {
                        setState(() {
                          buyTextController.text = convertCurrency(buyCurrency,
                              sellCurrency, double.parse(value), true);
                        });
                      },
                      keyboardType: TextInputType.number,
                    )),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: OutlinedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll<Size>(Size(30.w, 8.h)),
                    side: MaterialStatePropertyAll<BorderSide>(BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.primary))),
                onPressed: () {
                  buyCurrency = initBuyCurrency;
                  sellCurrency = initSellCurrency;
                  buyTextController.text = "1";
                  sellTextController.text =
                      convertCurrency(sellCurrency, buyCurrency, 1, false);
                  setState(() {});
                },
                child: Text("CLEAR".translate(context)),
              ),
            ),
            Center(
              child: Chip(
                  label: Text(
                      "1 ${buyCurrency.code} =  ${convertCurrency(sellCurrency, buyCurrency, 1, false)} ${sellCurrency.code}")),
            ),
          ],
        )),
      ),
    );
  }

  InkWell _buildSwitchBotton(BuildContext context) {
    return InkWell(
      onTap: () {
        var temp = buyCurrency;
        buyCurrency = sellCurrency;
        sellCurrency = temp;
        setState(() {});
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(1.w),
          ),
          child: Icon(
            Icons.swap_calls,
            size: 10.w,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  void changeCurrency(String? currencyCode, bool isBuying) {
    //calling from buying
    if (isBuying) {
      //if we want to change to same currency do nothing
      if (sellCurrency.code == currencyCode) {
        return;
      }

      // if we want to change buy to code and sell is SEK berform if
      if (sellCurrency.code == "SEK") {
        buyCurrency =
            currencies.singleWhere((element) => element.code == currencyCode);
        buyTextController.text = convertCurrency(buyCurrency, sellCurrency,
            double.parse(buyTextController.text), true);

        setState(() {});
      }

      // if we want to change buy to code and sell is not SEK , Make Sell As SEK
      if (sellCurrency.code != "SEK") {
        buyCurrency =
            currencies.singleWhere((element) => element.code == currencyCode);

        sellCurrency = initBuyCurrency;

        setState(() {});
      }
    }
    //calling from selling
    else {
      if (buyCurrency.code == currencyCode) {
        return;
      }
      // if we want to change sell to code and buy is SEK berform
      if (buyCurrency.code == "SEK") {
        sellCurrency =
            currencies.singleWhere((element) => element.code == currencyCode);
        sellTextController.text = convertCurrency(sellCurrency, buyCurrency,
            double.parse(buyTextController.text), false);
        setState(() {});
      }
      // if we want to change sell to code and buy is not SEK , Make buy As SEK
      if (buyCurrency.code != "SEK") {
        sellCurrency =
            currencies.singleWhere((element) => element.code == currencyCode);
        buyCurrency = initBuyCurrency;
        sellTextController.text = convertCurrency(sellCurrency, buyCurrency,
            double.parse(buyTextController.text), false);
        setState(() {});
      }
    }
  }

  String convertCurrency(Currency currencyFrom, Currency currencyTo,
      double amount, bool isBuying) {
    // Calculate the exchange rate based on whether it's a buy or sell transaction
    double exchangeRate = isBuying
        ? double.parse(currencyTo.sell) / double.parse(currencyFrom.buy)
        : double.parse(currencyTo.buy) / double.parse(currencyFrom.sell);

    // Calculate the converted amount
    double convertedAmount = amount * exchangeRate;

    return convertedAmount.toStringAsFixed(4);
  }
}
