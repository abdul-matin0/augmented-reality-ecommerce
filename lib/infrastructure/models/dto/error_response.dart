/// Error Response
class ErrorResponse {
  int? status;
  bool? success;
  Error? error;
  dynamic message;

  ErrorResponse({this.status, this.success, this.error});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Error {
  String? code;
  dynamic message;
  Fields? fields;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;

    return data;
  }
}

class Fields {
  List<String>? errorDetails;

  Fields({this.errorDetails});

  Fields.fromJson(Map<String, dynamic> json) {
    errorDetails = json.values
        .firstWhere((value) => value != null, orElse: () => null)
        ?.cast<String>();
  }
}
