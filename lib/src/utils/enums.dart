enum YouCanPayBalanceHistorySortField {
  amount,
  causerType;

  String get snakeCasedName => camelToSnake(name);
}

enum YouCanPaySortOrder {
  asc,
  desc;

  String get snakeCasedName => camelToSnake(name);
}

enum YouCanPayTransfersSortField {
  amount,
  createdAt;

  String get snakeCasedName => camelToSnake(name);
}

enum YouCanPayWithdrawalSortField {
  amount,
  paidAt,
  createdAt;

  String get snakeCasedName => camelToSnake(name);
}

enum YouCanPayInvoicesSortField {
  amount,
  name,
  active,
  status,
  dueBy,
  createdAt;

  String get snakeCasedName => camelToSnake(this.name);
}

enum YouCanPayNetworkingClientMethod {
  get,
  post,
  put;

  String get snakeCasedName => camelToSnake(name);
}

enum YouCanPayStatsInterval {
  today,
  yesterday,
  thisWeek,
}

enum YouCanPayPaymentsMethod {
  bankAccount,
  cashplus;

  String get snakeCasedName => camelToSnake(name);
}

String camelToSnake(String name) {
  return name
      .replaceAllMapped(
          RegExp(r'(?<!^)(?=[A-Z])'), (match) => '_${match.group(0)}')
      .toLowerCase();
}
