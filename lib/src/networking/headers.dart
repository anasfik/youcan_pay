class HeadersBuilder {
  final _headers = <String, String>{};

  Map<String, String> get headers => _headers;

  static final _instance = HeadersBuilder._();

  HeadersBuilder._();

  factory HeadersBuilder() => _instance;

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

  HeadersBuilder addTokenHeader() {
    // Next...
    return this;
  }
}
