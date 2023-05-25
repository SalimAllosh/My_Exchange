import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardItem extends StatelessWidget {
  final goldImage;
  final goldName;
  final goldBuyPrice;
  final goldSellPrice;

  const CardItem({
    super.key,
    required this.goldImage,
    required this.goldName,
    required this.goldBuyPrice,
    required this.goldSellPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(219, 241, 239, 239),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromARGB(136, 204, 202, 202)),
          borderRadius: BorderRadius.circular(4.w)),
      child: Row(
        children: [
          Container(
            height: 20.h,
            width: 20.h,
            margin: EdgeInsets.only(left: 4.w, top: 4.w, bottom: 4.w),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(goldImage), fit: BoxFit.cover)),
          ),
          Container(
            width: 50.w,
            height: 20.h,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(goldName,
                      softWrap: false,
                      style: Theme.of(context).textTheme.displayLarge,
                      overflow: TextOverflow.fade),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Buy",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        goldBuyPrice,
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        goldSellPrice,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        "33400",
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
