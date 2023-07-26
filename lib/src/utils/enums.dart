enum YouCanPayBalanceHistorySortField {
  amount,
  causer_type,
}

enum YouCanPaySortOrder {
  asc,
  desc,
}

enum YouCanPayTransfersSortField {
  amount,
  created_at,
}

enum YouCanPayWithdrawalSortField {
  amount,
  paid_at,
  created_at,
}

enum YouCanPayInvoicesSortField {
  amount,
  name,
  active,
  status,
  due_by,
  created_at,
}

enum YouCanPayNetworkingClientMethod {
  get,
  post,
  put,
}

enum YouCanPayStatsInterval {
  today,
  yesterday,
  thisWeek,
}

enum YouCanPayPaymentsMethod {
  bank_account,
  cashplus,
}
