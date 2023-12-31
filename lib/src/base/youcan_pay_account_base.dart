import 'package:youcan_pay/src/models/account/refresh.dart';

import '../models/account/account_config.dart';
import '../models/account/login.dart';
import '../models/account/logout.dart';
import '../models/account/register.dart';
import '../models/account/stats.dart';
import '../models/account/user_informations.dart';
import '../utils/enums.dart';

abstract interface class YouCanPayAccountBase {
  Future<RegisterResponse> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  });

  Future<LoginResponse> login({
    required String emailOrPhone,
    required String password,
  });

  Future<YouCanUserInformations> me({
    required String token,
  });

  Future<RegisterResponse> updateAccount({
    required String token,
    String? firstName,
    String? lastName,
    String? adress,
  });

  Future<RegisterResponse> updatePassword({
    required String token,
    required String currentPassword,
    required String newPassword,
  });

  Future<StatsResponse> stats({
    required String token,
    required DateTime fromDate,
    required DateTime toDate,
    required YouCanPayStatsInterval interval,
  });

  Future<RefreshResponse> refreshToken({
    required String token,
  });

  Future<LogoutResponse> logout({
    required String token,
  });

  Future<YouCanPayAccountConfig> accounfConfig({
    required String pubKey,
  });
}
