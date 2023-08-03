import 'package:equatable/equatable.dart';
import 'package:youcan_pay/src/models/payments/expiry_date.dart';

/// {@template card}
/// The payment card holder, it contains the card number, the card holder name, the cvv and the expire date.
///
/// Will be used to pay with a card.
/// {@endtemplate}
class YouCanPayCard extends Equatable {
  /// The card holder's number (16 digits).
  final int creditCard;

  /// The card holder's name.
  final String cardHolderName;

  /// The card's cvv (3 digits).
  final int cvv;

  /// {@macro expire_date}
  /// The card's expire date.
  final YouCanPayExpireDate expireDate;

  /// {@macro card}
  YouCanPayCard({
    required this.creditCard,
    required this.cardHolderName,
    required this.cvv,
    required this.expireDate,
  });

  factory YouCanPayCard.testingNo3dsSuccessCard([String cardHolderName = '']) {
    return _baseTestCard(
      creditCard: 4242424242424242,
      cardHolderName: cardHolderName,
    );
  }

  factory YouCanPayCard.testing3dsSuccessCard([String cardHolderName = '']) {
    return _baseTestCard(
      creditCard: 4000000000003220,
      cardHolderName: cardHolderName,
    );
  }

  factory YouCanPayCard.testing3dsRejectedCard([String cardHolderName = '']) {
    return _baseTestCard(
      creditCard: 4000008400001629,
      cardHolderName: cardHolderName,
    );
  }

  factory YouCanPayCard.testingNo3dsNoFundsCard([String cardHolderName = '']) {
    return _baseTestCard(
      creditCard: 4000000000000077,
      cardHolderName: cardHolderName,
    );
  }

  static YouCanPayCard _baseTestCard({
    required int creditCard,
    required String cardHolderName,
  }) {
    return YouCanPayCard(
      creditCard: creditCard,
      cardHolderName: cardHolderName,
      cvv: 112,
      expireDate: YouCanPayExpireDate(month: 12, year: 2024),
    );
  }

  @override
  List<Object?> get props => [
        creditCard,
        cardHolderName,
        cvv,
        expireDate,
      ];
}
