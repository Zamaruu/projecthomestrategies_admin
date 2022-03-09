class ApiResponse {
  late String? message;
  final int statusCode;
  final dynamic object;
  late bool? hasError;

  ApiResponse(this.statusCode, this.message, this.object, this.hasError);

  ApiResponse.success(this.statusCode, this.object, {this.message}) {
    hasError = false;
  }

  ApiResponse.error(this.statusCode, this.message, {this.object}) {
    hasError = true;
  }

  @override
  String toString() {
    return "Statuscode: $statusCode,\nMessage: $message,\nHat Fehler: $hasError,\nObjekt: $object";
  }
}
