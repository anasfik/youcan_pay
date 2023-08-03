import 'package:equatable/equatable.dart';

/// {@template expire_date}
/// Represents the expire date of a card.
/// {@endtemplate}
class YouCanPayExpireDate extends Equatable {
  /// The month of the expire date.
  final int month;

  /// The year of the expire date.
  final int year;

  /// Creates a new instance of the [YouCanPayExpireDate] class.
  ///
  /// {@macro expire_date}
  YouCanPayExpireDate._({
    required this.month,
    required this.year,
  });

  factory YouCanPayExpireDate({
    required int month,
    required int year,
  }) {
    int yearToUse = year;
    final yearAsString = yearToUse.toString();

    final isValidMonth = month <= 12;
    final isValidYear = yearAsString.length == 4 || yearAsString.length == 2;

    assert(isValidMonth && isValidYear, "Invalid expire date");

    if (yearAsString.length == 4) {
      yearToUse = int.parse(yearAsString.substring(2));
    }

    return YouCanPayExpireDate._(
      month: month,
      year: yearToUse,
    );
  }

  factory YouCanPayExpireDate.fromDateTime(DateTime dateTime) {
    return YouCanPayExpireDate(
      month: dateTime.month,
      year: dateTime.year,
    );
  }
  @override
  List<Object?> get props => [year, month];

  @override
  String toString() {
    return "$month/$year";
  }
}
