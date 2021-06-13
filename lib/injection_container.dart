import 'package:get_it/get_it.dart';
import 'package:login_river_pod/data_source/login_data_source.dart';
import 'package:login_river_pod/data_source/login_service_provider.dart';
import 'package:login_river_pod/repositories/login_repository.dart';

import 'network/network.dart';
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<NetworkProvider>(NetworkProviderDioImpl());
  sl.registerSingleton<LoginService>(LoginServiceImpl(networkProvider: sl()));
  sl.registerSingleton<LoginRemoteDataSource>(LoginRemoteDataSourceImpl(loginService: sl()));
  sl.registerSingleton<LoginRepository>(LoginRepositoryImpl(sl()));
  sl.registerSingleton<NetworkProvider>(NetworkProviderDioImpl());


}
