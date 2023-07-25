import 'package:equatable/equatable.dart';

import '../model.dart';

class YouCanUserInformations extends YouCanPayDataModel {
  final String id;
  final String identityId;
  final String firstName;
  final String lastName;
  final String address;
  final String postalCode;
  final String city;
  final String region;
  final String country;
  final String phone;
  final String email;
  final String balanceAmount;
  final String balanceCurrency;
  final String todayVolumeAmount;
  final String todayVolumeCurrency;
  final int type;
  final String displayBalance;
  final String typeText;

  YouCanUserInformations({
    required this.id,
    required this.identityId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.postalCode,
    required this.city,
    required this.region,
    required this.country,
    required this.phone,
    required this.email,
    required this.balanceAmount,
    required this.balanceCurrency,
    required this.todayVolumeAmount,
    required this.todayVolumeCurrency,
    required this.type,
    required this.displayBalance,
    required this.typeText,
  });

  @override
  List<Object?> get props => [
        id,
        identityId,
        firstName,
        lastName,
        address,
        postalCode,
        city,
        region,
        country,
        phone,
        email,
        balanceAmount,
        balanceCurrency,
        todayVolumeAmount,
        todayVolumeCurrency,
        type,
        displayBalance,
        typeText,
      ];

  factory YouCanUserInformations.fromMap(Map<String, dynamic> map) {
    return YouCanUserInformations(
      id: map['id'] as String,
      identityId: map['identity_id'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      address: map['address'] as String,
      postalCode: map['postal_code'] as String,
      city: map['city'] as String,
      region: map['region'] as String,
      country: map['country'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      balanceAmount: map['balance']['amount'] as String,
      balanceCurrency: map['balance']['currency'] as String,
      todayVolumeAmount: map['today_volume']['amount'] as String,
      todayVolumeCurrency: map['today_volume']['currency'] as String,
      type: map['type'] as int,
      displayBalance: map['display_balance'] as String,
      typeText: map['type_text'] as String,
    );
  }
}
