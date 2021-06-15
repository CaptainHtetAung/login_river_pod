import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_river_pod/usecases/login_usecase.dart';

import 'injection_container.dart';
import 'notifier/login_notifier.dart';


final loginNotifierProvider = StateNotifierProvider(
  (ref) => LoginNotifier(loginUseCase: sl<LoginUseCase>()),
);
