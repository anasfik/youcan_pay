import 'package:youcan_pay/src/models/account/account_config.dart';
import 'package:youcan_pay/src/models/account/login.dart';

import 'package:youcan_pay/src/models/account/register.dart';
import 'package:youcan_pay/src/networking/headers.dart';

import '../../base/youcan_pay_account_base.dart';
import '../../base/youcan_pay_module.dart';
import '../../models/account/logout.dart';
import '../../models/account/refresh.dart';
import '../../models/account/stats.dart';
import '../../models/account/user_informations.dart';
import '../../networking/client.dart';
import '../../networking/endpoint.dart';
import '../../utils/consts.dart';
import '../../utils/enums.dart';

final class YouCanPayAccounts implements YouCanPayModule, YouCanPayAccountBase {
  static final YouCanPayAccounts _instance = YouCanPayAccounts._();
  static YouCanPayAccounts get instance => _instance;
  YouCanPayAccounts._();

  @override
  Type get type => runtimeType;

  @override
  Future<LoginResponse> login({
    required String emailOrPhone,
    required String password,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<LoginResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.login,
      ]),
      body: {
        'email_or_phone': emailOrPhone,
        'password': password,
      },
      method: YouCanPayNetworkingClientMethod.post,
      onSuccess: (map) {
        return LoginResponse.fromMap(map);
      },
    );
  }

  @override
  Future<YouCanUserInformations> me({
    required String token,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<
        YouCanUserInformations>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.me,
      ]),
      body: {
        'token': token,
      },
      method: YouCanPayNetworkingClientMethod.get,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return YouCanUserInformations.fromMap(map['data']);
      },
    );
  }

  @override
  Future<RegisterResponse> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<RegisterResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.register,
      ]),
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': password,
      },
      method: YouCanPayNetworkingClientMethod.post,
      onSuccess: (map) {
        return RegisterResponse.fromMap(map);
      },
    );
  }

  @override
  Future<LogoutResponse> logout({
    required String token,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<LogoutResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.logout,
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.post,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return LogoutResponse();
      },
    );
  }

  @override
  Future<RefreshResponse> refreshToken({
    required String token,
  }) {
    return YouCanPayNetworkingClient.sendFormRequestFromJson<RefreshResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.refresh,
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.post,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return RefreshResponse.fromMap(map);
      },
    );
  }

  @override
  Future<StatsResponse> stats({
    required String token,
    required DateTime fromDate,
    required DateTime toDate,
    required YouCanPayStatsInterval interval,
  }) {
    return YouCanPayNetworkingClient.sendJsonRequestFromJson<StatsResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.stats,
        '?from_date=${fromDate.toIso8601String()}',
        '&to_date=${toDate.toIso8601String()}',
        '&interval=${interval.name}',
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.get,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return StatsResponse.fromMap(map);
      },
    );
  }

  @override
  Future<RegisterResponse> updateAccount({
    required String token,
    String? firstName,
    String? lastName,
    String? adress,
  }) {
    return YouCanPayNetworkingClient.sendJsonRequestFromJson<RegisterResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.me,
      ]),
      body: {
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        if ((adress != null)) 'address': adress,
      },
      method: YouCanPayNetworkingClientMethod.put,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return RegisterResponse.fromMap(map);
      },
    );
  }

  @override
  Future<RegisterResponse> updatePassword({
    required String token,
    required String currentPassword,
    required String newPassword,
  }) {
    return YouCanPayNetworkingClient.sendJsonRequestFromJson<RegisterResponse>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.me,
        YouCanPayConstants.endpoints.password,
      ]),
      body: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
      method: YouCanPayNetworkingClientMethod.put,
      customHeaders:
          HeadersBuilder().addAcceptJsonHeader().addTokenHeader(token).headers,
      onSuccess: (map) {
        return RegisterResponse.fromMap(map);
      },
    );
  }

  @override
  Future<YouCanPayAccountConfig> accounfConfig({
    required String pubKey,
  }) {
    return YouCanPayNetworkingClient.sendJsonRequestFromJson<
        YouCanPayAccountConfig>(
      endpoint: YouCanPayEndpointBuilder()([
        YouCanPayConstants.endpoints.getAccountConfigs,
        pubKey,
      ]),
      body: {},
      method: YouCanPayNetworkingClientMethod.get,
      customHeaders: HeadersBuilder().addAcceptJsonHeader().headers,
      onSuccess: (map) {
        return YouCanPayAccountConfig.fromMap(map);
      },
    );
  }
}
