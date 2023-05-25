import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:currency_and_gold_app/Core/Widgets/loading_widget.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/Widgets/last_update_rich_text.dart';
import 'package:currency_and_gold_app/Features/Gold/Presentation/StateManagement/gold/gold_bloc.dart';
import 'package:currency_and_gold_app/Features/Gold/Presentation/Widgets/error_message_widget.dart';
import 'package:currency_and_gold_app/Features/Gold/Presentation/Widgets/gold_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class GoldPage extends StatefulWidget {
  const GoldPage({super.key});

  @override
  State<GoldPage> createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  @override
  Widget build(BuildContext context) {
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
        child: BlocBuilder<GoldBloc, GoldState>(
          builder: (context, state) {
            if (state is LoadingGoldState) {
              return LoadingWidget();
            } else if (state is LoadedGoldState) {
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<GoldBloc>(context).add(GetAllGoldEvent());
                  },
                  child: Container(
                    child: ListView(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                left: 4.w, right: 4.w, top: 4.w),
                            child:
                                LastUpdateRichText(dateTime: DateTime.now())),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 4.w, left: 4.w),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.golds.length,
                            itemBuilder: (context, index) => CardItem(
                                goldImage: state.golds[index].image,
                                goldName: state.golds[index].title,
                                goldBuyPrice: state.golds[index].buyPrice,
                                goldSellPrice: state.golds[index].price),
                          ),
                        )
                      ],
                    ),
                  ));
            } else if (state is ErrorLoadingGoldState) {
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<GoldBloc>(context, listen: false)
                        .add(GetAllGoldEvent());
                  },
                  child: ListView(
                    padding: EdgeInsets.only(top: 20.h, left: 2.w, right: 2.w),
                    children: [
                      Center(child: Text(state.message.translate(context))),
                    ],
                  ));
            } else {
              return ErrorMessageWidget(message: "un known message from gold");
            }
          },
        ),
      ),
    );
  }
}
