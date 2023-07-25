import 'package:equatable/equatable.dart';
import 'package:youcan_pay/src/models/model.dart';

class StatsResponse extends YouCanPayDataModel {
  final DateTime fromDate;
  final DateTime toDate;
  final String totalRevenue;
  final List<PaidTransactionsByDate> paidTransactionsByDates;
  final List? acceptanceRatesByDates;
  final List? creditCardsGroupedByBankName;
  final List? creditCardsGroupedBrand;
  final List? creditCardsGroupedByCountry;

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

class PaidTransactionsByDate extends Equatable {
  final DateTime date;
  final int totalAmount;

  PaidTransactionsByDate({
    required this.date,
    required this.totalAmount,
  });

  factory PaidTransactionsByDate.fromMap(Map<String, dynamic> map) {
    return PaidTransactionsByDate(
      date: DateTime.parse(map['date']),
      totalAmount: map['totalAmount'],
    );
  }

  @override
  List<Object?> get props => [date, totalAmount];
}
