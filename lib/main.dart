import 'package:currency_and_gold_app/Core/Localization/app_localization.dart';
import 'package:currency_and_gold_app/Core/Routes/routes_configuration.dart';
import 'package:currency_and_gold_app/Core/Themes/app_themes.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/StateManagements/curruncy/currency_bloc.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/StateManagements/last%20update%20date%20cubit/last_update_date_cubit.dart';
import 'package:currency_and_gold_app/Features/Global/Cubit/LanguageCubit/language_cubit.dart';
import 'package:currency_and_gold_app/Features/Global/cubit/ModeCubit/mode_cubit.dart';
import 'package:currency_and_gold_app/Features/Gold/Presentation/StateManagement/gold/gold_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'Core/Dependencies Injection/dependencies_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  di.sl<CurrencyBloc>()..add(GetAllCurrenciesEvent()),
            ),
            BlocProvider(
              create: (_) => di.sl<GoldBloc>()..add(GetAllGoldEvent()),
            ),
            BlocProvider(
              create: (_) => di.sl<LastUpdateDateCubit>(),
            ),
            BlocProvider(
              create: (_) => di.sl<ModeCubit>(),
            ),
            BlocProvider(
              create: (_) => di.sl<LanguageCubit>()..getSavedLanguageCode(),
            ),
          ],
          child: BlocBuilder<ModeCubit, ModeState>(
            builder: (context, state) {
              return BlocBuilder<LanguageCubit, LanguageChangedState>(
                builder: (context, languagestate) {
                  return MaterialApp.router(
                    theme: state is IsLightState
                        ? AppThemes.light
                        : AppThemes.dark,
                    locale: Locale(languagestate.languageCode),
                    supportedLocales: [
                      Locale("en"),
                      Locale("ar"),
                      Locale("sv")
                    ],
                    localizationsDelegates: [
                      AppLocalization.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    localeResolutionCallback: (devicelocale, supportedLocales) {
                      if (devicelocale != null) {
                        return devicelocale;
                      } else {
                        for (var local in supportedLocales) {
                          if (devicelocale!.languageCode ==
                              local.languageCode) {
                            return local;
                          }
                        }
                        return Locale("en");
                      }
                    },
                    debugShowCheckedModeBanner: false,
                    routeInformationParser:
                        AppRoutes().router.routeInformationParser,
                    routeInformationProvider:
                        AppRoutes().router.routeInformationProvider,
                    routerDelegate: AppRoutes().router.routerDelegate,
                  );
                },
              );
            },
          )),
    );
  }
}
