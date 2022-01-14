class ErrorResponse {
  ErrorResponse({
    required int statusCode,
    required List<String> message,
    required String error,
  }) {
    _statusCode = statusCode;
    _message = message;
    _error = error;
  }

  ErrorResponse.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'] != null ? json['message'].cast<String>() : [];
    _error = json['error'];
  }

  late int _statusCode;
  late List<String> _message;
  late String _error;

  int get statusCode => _statusCode;

  List<String> get message => _message;

  String get error => _error;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    map['error'] = _error;
    return map;
  }
}
