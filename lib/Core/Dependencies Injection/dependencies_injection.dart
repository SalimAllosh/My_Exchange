import 'package:currency_and_gold_app/Core/NetworkChecker/internet_connection_checker.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/DataSources/local_data_source.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/DataSources/remote_data_source.dart';
import 'package:currency_and_gold_app/Features/Currency/Data/Repositories/currency_repository.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Repositories/currency_repository.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Usecases/get_all_currency_usecase.dart';
import 'package:currency_and_gold_app/Features/Currency/Domain/Usecases/get_update_date.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/StateManagements/curruncy/currency_bloc.dart';
import 'package:currency_and_gold_app/Features/Currency/Presentation/StateManagements/last%20update%20date%20cubit/last_update_date_cubit.dart';
import 'package:currency_and_gold_app/Features/Global/Cubit/LanguageCubit/language_cubit.dart';
import 'package:currency_and_gold_app/Features/Global/cubit/ModeCubit/mode_cubit.dart';
import 'package:currency_and_gold_app/Features/Gold/Data/DataSources/remote_data_source.dart';
import 'package:currency_and_gold_app/Features/Gold/Data/Repository/gold_repository_imp.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Repository/gold_repository.dart';
import 'package:currency_and_gold_app/Features/Gold/Domain/Usecase/get_gold_usecase.dart';
import 'package:currency_and_gold_app/Features/Gold/Presentation/StateManagement/gold/gold_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //-------------Blocs----------------

  sl.registerFactory(() => CurrencyBloc(getAllCurrencyUsecase: sl()));
  sl.registerFactory(() => GoldBloc(getGoldUsecase: sl()));

  //--------Cubits
  sl.registerFactory(() => LastUpdateDateCubit(getLastUpdateDateUsecase: sl()));
  sl.registerFactory(() => ModeCubit(sharedPreferences: sl()));

  sl.registerFactory(() => LanguageCubit());

  //----------Usecases---------------

  sl.registerLazySingleton(
      () => GetAllCurrencyUsecase(currencyRepository: sl()));
  sl.registerLazySingleton(() => GetGoldUsecase(goldRepository: sl()));
  sl.registerLazySingleton(
      () => GetLastUpdateDateUsecase(currencyRepository: sl()));

  //------------Repositories------------

  sl.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImp(
      remoteDataSource: sl(), localDataSource: sl(), networkInfoImp: sl()));

  sl.registerLazySingleton<GoldRepository>(
      () => GoldRepositoryImp(remoteDataSource: sl(), networkInfoImp: sl()));

  //-------- DataSources -------
  sl.registerLazySingleton<GoldRemoteDataSource>(
      () => GoldRemoteDataSourceWithClient(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSouceWithSharedPreferances(sharedPreferences: sl()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceWithHttp(client: sl()));

  //------ Internet Connection ------
  sl.registerLazySingleton(() => NetworkInfo);
  sl.registerLazySingleton(
      () => NetworkInfoImp(internetConnectionChecker: sl()));
  //----- External ------
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}


/*



  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(internetConnectionChecker: sl()));



*/ 
