import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrencyItem extends StatelessWidget {
  final String code;
  final String currency;
  final String sell;
  final String buy;
  final String flag;
  const CurrencyItem(
      {super.key,
      required this.code,
      required this.currency,
      required this.sell,
      required this.buy,
      required this.flag});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SizedBox(
          width: 1,
          child: Text(
            code,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      leading: Container(
        width: 20.w,
        height: 10.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.h),
          image: DecorationImage(
            image: NetworkImage(flag),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) => Icon(
              Icons.image,
              size: 10.h,
            ),
          ),
        ),
      ),
      subtitle: SizedBox(
        width: 10.w,
        child: Text(
          currency,
          style: Theme.of(context).textTheme.displayMedium,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
      ),
      trailing: Wrap(
        spacing: 12.w,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Text(
            buy,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            sell,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
