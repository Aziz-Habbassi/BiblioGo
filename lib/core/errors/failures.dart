import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  Failures({required this.errMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDrioError(DioException dioexception) {
    switch (dioexception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errMessage: "Connection timeout. Please try again",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Request timeout while sending data.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Server took too long to respond.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errMessage: "Invalid security certificate from the server.",
        );
      case DioExceptionType.badResponse:
        return ServerFailure(
          errMessage: "Received an unexpected response from the server.",
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request was cancelled.");
      case DioExceptionType.connectionError:
        return ServerFailure(
          errMessage: "No internet connection. Please check your network.",
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage: "An unknown error occurred. Please try again.",
        );
    }
  }
}
