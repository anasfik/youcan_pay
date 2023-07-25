import 'package:youcan_pay/src/models/account/login.dart';

import 'package:youcan_pay/src/models/account/register.dart';

import '../../base/youcan_pay_account_base.dart';
import '../../base/youcan_pay_module.dart';
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
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<YouCanUserInformations> me({
    required String token,
  }) {
    // TODO: implement me
    throw UnimplementedError();
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
  Future<LoginResponse> logout({
    required String token,
  }) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> refreshToken({
    required String token,
  }) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future stats({
    required String token,
    required DateTime fromDate,
    required DateTime toDate,
    required String interval,
  }) {
    // TODO: implement stats
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponse> updateAccount({
    required String token,
    required String firstName,
    required String lastName,
    required String adress,
  }) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponse> updatePassword({
    required String token,
    required String currentPassword,
    required String newPassword,
  }) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
