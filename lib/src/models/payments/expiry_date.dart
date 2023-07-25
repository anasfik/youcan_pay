import 'package:equatable/equatable.dart';

class YouCanPayExpireDate extends Equatable {
  final int month;
  final int year;

  YouCanPayExpireDate({
    required this.month,
    required this.year,
  }) {
    assert(month <= 12 && year.toString().length <= 4);
  }

  @override
  List<Object?> get props => [year, month];

  @override
  String toString() {
    return "$month/$year";
  }
}
