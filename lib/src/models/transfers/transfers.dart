import 'package:equatable/equatable.dart';

import 'package:youcan_pay/src/models/model.dart';
import 'package:youcan_pay/src/models/transfers/transfer.dart';

class YouCanPayTransfersPagination extends YouCanPayDataModel {
  final List<YouCanPayTransfer> data;
  final YouCanPayPaginationMetadata metadata;

  YouCanPayTransfersPagination({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object?> get props => [data, metadata];

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

class YouCanPayPaginationMetadata extends Equatable {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final dynamic links;

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
