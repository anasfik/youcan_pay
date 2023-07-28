import 'package:equatable/equatable.dart';

import 'package:youcan_pay/src/models/youcan_model.dart';
import 'package:youcan_pay/src/models/transfers/transfer.dart';

/// {@template transfers_pagination}
///  Represents the response returned by the transfers API endpoint.
/// {@endtemplate}
class YouCanPayTransfersPagination extends YouCanPayDataModel {
  /// The list of transfers.
  final List<YouCanPayTransfer> data;

  /// The pagination metadata.
  final YouCanPayPaginationMetadata metadata;

  ///  Creates a new instance of the [YouCanPayTransfersPagination] class.
  YouCanPayTransfersPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

  /// Creates a new instance of the [YouCanPayTransfersPagination] class from a JSON [map].
  factory YouCanPayTransfersPagination.fromMap(Map<String, dynamic> map) {
    return YouCanPayTransfersPagination(
      data: List<YouCanPayTransfer>.from(
        (map['data'] as List).map(
          (x) => YouCanPayTransfer.fromMap(x),
        ),
      ),
      metadata: YouCanPayPaginationMetadata.fromMap(
        map['meta']['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}

/// {@template pagination_metadata}
/// Represents the pagination metadata returned by the API.
/// {@endtemplate}
class YouCanPayPaginationMetadata extends Equatable {
  /// The total number of items.
  final int total;

  /// The number of items per page.
  final int count;

  /// The number of items per page.
  final int perPage;

  /// The current page.
  final int currentPage;

  /// The total number of pages.
  final int totalPages;

  /// The links.
  final dynamic links;

  ///  Creates a new instance of the [YouCanPayPaginationMetadata] class.
  ///
  /// {@macro pagination_metadata}
  YouCanPayPaginationMetadata({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.links,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [];

  /// Creates a new instance of the [YouCanPayPaginationMetadata] class from a JSON [map].
  factory YouCanPayPaginationMetadata.fromMap(Map<String, dynamic> map) {
    return YouCanPayPaginationMetadata(
      total: map['total'] as int,
      count: map['count'] as int,
      perPage: map['per_page'] as int,
      currentPage: map['current_page'] as int,
      totalPages: map['total_pages'] as int,
      links: map['links'] as dynamic,
    );
  }
}
