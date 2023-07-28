import 'package:youcan_pay/src/models/payments/pay_response.dart';

/// {@template verification3ds_pay_response}
/// The response of the verification 3ds payment.
/// {@endtemplate}
class Verification3dsPayResponse extends PayResponse {
  /// The transaction id of the payment.
  final String transactionId;

  /// The redirect url to the 3ds page.
  final String? redirectUrl;

  /// The return url to the merchant website.
  final String? returnUrl;

  /// Creates a new [Verification3dsPayResponse] instance.
  ///
  /// {@macro verification3ds_pay_response}
  Verification3dsPayResponse({
    required this.transactionId,
    this.redirectUrl,
    this.returnUrl,
  });

  /// Creates a new [Verification3dsPayResponse] instance from a ma[p].
  factory Verification3dsPayResponse.fromMap(Map<String, dynamic> map) {
    return Verification3dsPayResponse(
      redirectUrl: map['redirect_url'] as String?,
      returnUrl: map['return_url'] as String?,
      transactionId: map['transaction_id'] as String,
    );
  }

  @override
  List<Object?> get props => [
        transactionId,
        redirectUrl,
        returnUrl,
      ];
}
