class HeadersBuilder {
  final _headers = <String, String>{};
  String? _token;
  Map<String, String> get headers => _headers;

  String get token {
    assert(_token != null);

    return _token!;
  }

  static final _instance = HeadersBuilder._();

  HeadersBuilder._();

  factory HeadersBuilder({
    String? token,
  }) {
    return _instance;
  }

  HeadersBuilder addHeader({
    required String key,
    required String value,
    bool overwrite = false,
  }) {
    if (_headers.containsKey(key) && !overwrite) {
      throw Exception('Header $key already exists');
    } else {
      _headers[key] = value;
    }

    return this;
  }

  HeadersBuilder addAcceptJsonHeader() {
    return addHeader(
      key: 'Accept',
      value: 'application/json',
      overwrite: true,
    );
  }

  HeadersBuilder addTokenHeader([String? token]) {
    final tokenToUse = token ?? this.token;
    return addHeader(
      key: "Authorization",
      value: "Bearer $tokenToUse",
    );
  }
}
