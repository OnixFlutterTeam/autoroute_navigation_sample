class ErrorResponse500 {
  ErrorResponse500({
    required int statusCode,
    required String message,
  }) {
    _statusCode = statusCode;
    _message = message;
  }

  ErrorResponse500.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
  }

  late int _statusCode;
  late String _message;

  int get statusCode => _statusCode;

  String get message => _message;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    return map;
  }
}
