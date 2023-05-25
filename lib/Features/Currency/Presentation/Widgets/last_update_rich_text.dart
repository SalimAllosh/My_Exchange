import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/StateManagements/last%20update%20date%20cubit/last_update_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LastUpdateRichText extends StatelessWidget {
  final DateTime dateTime;
  const LastUpdateRichText({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.EEEE().add_yMd().add_jm();

    context.read<LastUpdateDateCubit>().getLastUpdateDate();
    return BlocBuilder<LastUpdateDateCubit, LastUpdateDateState>(
      builder: (context, state) {
        return RichText(
          text: TextSpan(
            text: "LAST_UPDATE_DATE".translate(context),
            style: Theme.of(context).textTheme.displayMedium,
            children: <TextSpan>[
              if (state is LoadedLastUpdateDateState)
                TextSpan(
                    text:
                        "${format.format(DateTime.parse(state.lastUpdateDate))}",
                    style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        );
      },
    );
  }
}
