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
  YouCanPayExpireDate({
    required this.month,
    required this.year,
  }) {
    assert(month <= 12 && year.toString().length <= 4);
  }

  factory YouCanPayExpireDate.fromDateTime(DateTime dateTime) {
    return YouCanPayExpireDate(
      month: dateTime.month,
      year: int.parse(dateTime.year.toString().substring(2)),
    );
  }
  @override
  List<Object?> get props => [year, month];

  @override
  String toString() {
    return "$month/$year";
  }
}
