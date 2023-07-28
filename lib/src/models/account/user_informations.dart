import '../youcan_model.dart';

/// {@template youcan_pay_user_informations}
///  A class representing the user informations.
/// {@endtemplate}
class YouCanUserInformations extends YouCanPayDataModel {
  /// The unique identifier of the user.
  final String id;

  /// The unique identifier of the user's identity.
  final String? identityId;

  /// The first name of the user.
  final String firstName;

  /// The last name of the user.
  final String lastName;

  /// The address of the user.
  final String address;

  /// The postal code of the user.
  final String postalCode;

  /// The city of the user.
  final String city;

  /// The region of the user.
  final String region;

  /// The country of the user.
  final String country;

  /// The phone number of the user.
  final String phone;

  /// The email address of the user.
  final String email;

  /// The balance amount of the user.
  final String balanceAmount;

  /// The balance currency of the user.
  final String balanceCurrency;

  /// The today volume amount of the user.
  final String todayVolumeAmount;

  /// The today volume currency of the user.
  final String todayVolumeCurrency;

  /// The type of the user.
  final int type;

  /// The display balance of the user.
  final String displayBalance;

  /// The type text of the user.
  final String typeText;

  /// Creates a new instance of the [YouCanUserInformations] class.
  ///
  /// {@macro youcan_pay_user_informations}
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

  /// Creates a new instance of the [YouCanUserInformations] class from a JSON [map].
  factory YouCanUserInformations.fromMap(Map<String, dynamic> map) {
    return YouCanUserInformations(
      id: map['id'] as String,
      identityId: map['identity_id'] as String?,
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
