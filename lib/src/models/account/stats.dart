import 'package:equatable/equatable.dart';

import '../model.dart';

/// {@template youcan_pay_stats_response}
/// A class representing the response of a statistics query.
///
/// This class extends the [YouCanPayDataModel] class, which provides a base
/// implementation for data models in the YouCanPay application.
/// {@endtemplate}
class StatsResponse extends YouCanPayDataModel {
  /// The start date of the statistics query.
  final DateTime fromDate;

  /// The end date of the statistics query.
  final DateTime toDate;

  /// The total revenue for the given time period.
  final String totalRevenue;

  /// A list of paid transactions grouped by date.
  final List<PaidTransactionsByDate> paidTransactionsByDates;

  /// A list of acceptance rates grouped by date.
  final List? acceptanceRatesByDates;

  /// A list of credit cards grouped by bank name.
  final List? creditCardsGroupedByBankName;

  /// A list of credit cards grouped by brand.
  final List? creditCardsGroupedBrand;

  /// A list of credit cards grouped by country.
  final List? creditCardsGroupedByCountry;

  /// Creates a new instance of the [StatsResponse] class.
  ///
  /// {@macro youcan_pay_stats_response}
  StatsResponse({
    required this.fromDate,
    required this.toDate,
    required this.totalRevenue,
    required this.paidTransactionsByDates,
    required this.acceptanceRatesByDates,
    required this.creditCardsGroupedByBankName,
    required this.creditCardsGroupedBrand,
    required this.creditCardsGroupedByCountry,
  });

  /// Creates a new instance of the [StatsResponse] class from a JSON [map].
  factory StatsResponse.fromMap(Map<String, dynamic> map) {
    return StatsResponse(
      fromDate: DateTime.parse(map['fromDate']),
      toDate: DateTime.parse(map['toDate']),
      totalRevenue: map['totalRevenue'] as String,
      paidTransactionsByDates: List<PaidTransactionsByDate>.from(
          map['paidTransactionsByDates']
              .map((x) => PaidTransactionsByDate.fromMap(x))),
      acceptanceRatesByDates: List<dynamic>.from(map['acceptanceRatesByDates']),
      creditCardsGroupedByBankName: map['creditCardsGroupedByBankName'] != null
          ? List<dynamic>.from(map['creditCardsGroupedByBankName'])
          : null,
      creditCardsGroupedBrand: map['creditCardsGroupedBrand'] != null
          ? List<dynamic>.from(map['creditCardsGroupedBrand'])
          : null,
      creditCardsGroupedByCountry:
          List<dynamic>.from(map['creditCardsGroupedByCountry']),
    );
  }

  @override
  List<Object?> get props => [
        fromDate,
        toDate,
        totalRevenue,
        paidTransactionsByDates,
        acceptanceRatesByDates,
        creditCardsGroupedByBankName,
        creditCardsGroupedBrand,
        creditCardsGroupedByCountry,
      ];
}

/// {@template paid_transactions_by_date}
/// A class representing a paid transaction for a particular date..
/// {@endtemplate}
class PaidTransactionsByDate extends Equatable {
  /// The date of the paid transaction.
  final DateTime date;

  /// The total amount of the paid transaction.
  final int totalAmount;

  /// Creates a new instance of the [PaidTransactionsByDate] class.
  ///
  /// {@macro paid_transactions_by_date}
  PaidTransactionsByDate({
    required this.date,
    required this.totalAmount,
  });

  /// Creates a new instance of the [PaidTransactionsByDate] class from a JSON [map].
  factory PaidTransactionsByDate.fromMap(Map<String, dynamic> map) {
    return PaidTransactionsByDate(
      date: DateTime.parse(map['date']),
      totalAmount: map['totalAmount'] as int,
    );
  }

  @override
  List<Object?> get props => [date, totalAmount];
}
