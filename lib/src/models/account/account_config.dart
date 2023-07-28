import 'package:youcan_pay/src/models/youcan_model.dart';

/// {@template youcanpay_account_config}
/// Youcan Pay account config model.
/// {@endtemplate}
class YouCanPayAccountConfig extends YouCanPayDataModel {
  /// Weither or not the account accepts Youcan Pay wallet.
  final bool acceptsYouCanPayWallet;

  /// Weither or not the account accepts credit cards.
  final bool acceptsCreditCards;

  /// Weither or not the account accepts cashplus.
  final bool acceptsCashPlus;

  /// Weither or not the account accepts cashplus.
  final bool cashPlusTransactionEnabled;

  /// Weither or not the account accepts cashplus transactions.
  final bool walletTransactionEnabled;

  /// Weither or not the help center is enabled.
  final bool helpCenterEnabled;

  /// Weither or not the payments are active.
  final bool paymentsActive;

  /// Creates a [YouCanPayAccountConfig] instance.
  ///
  /// {@macro youcanpay_account_config}
  YouCanPayAccountConfig({
    required this.acceptsYouCanPayWallet,
    required this.acceptsCreditCards,
    required this.acceptsCashPlus,
    required this.cashPlusTransactionEnabled,
    required this.walletTransactionEnabled,
    required this.helpCenterEnabled,
    required this.paymentsActive,
  });

  /// Creates a [YouCanPayAccountConfig] from a JSON [map].
  factory YouCanPayAccountConfig.fromMap(Map<String, dynamic> map) {
    return YouCanPayAccountConfig(
      acceptsYouCanPayWallet: map['acceptsYouCanPayWallet'],
      acceptsCreditCards: map['acceptsCreditCards'],
      acceptsCashPlus: map['acceptsCashPlus'],
      cashPlusTransactionEnabled: map['cashPlusTransactionEnabled'],
      walletTransactionEnabled: map['walletTransactionEnabled'],
      helpCenterEnabled: map['helpCenterEnabled'],
      paymentsActive: map['account']['payments_active'],
    );
  }

  @override
  List<Object?> get props => [
        acceptsYouCanPayWallet,
        acceptsCreditCards,
        acceptsCashPlus,
        cashPlusTransactionEnabled,
        walletTransactionEnabled,
        helpCenterEnabled,
        paymentsActive,
      ];
}
