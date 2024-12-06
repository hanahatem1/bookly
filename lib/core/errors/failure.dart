import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError){
    switch(dioError.type){
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate received from the server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request canceled');
      case DioExceptionType.connectionError:
       return ServerFailure(
            'Failed to connect to the server. Check your internet connection');
      case DioExceptionType.unknown:
         return ServerFailure(
            'An unknown error occurred. Please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode,dynamic response){
    if(statusCode==400 || statusCode==401 ||statusCode==403){
      return ServerFailure(response['error']['message']);
    } else if(statusCode==404){
      return ServerFailure('your request not found, try later');
    } else if(statusCode==500){
      return ServerFailure('there is intenal problem, try later');
    } else{
      return ServerFailure('oops ,try again');
    }
  }
}