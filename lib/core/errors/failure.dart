import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

// No internet connection
class OfflineFailure extends Failure {}

// Server Error (api doesn't return data from server)
class ServerFailure extends Failure {}

// Auth Validation
class ValidationFailure extends Failure {
  final String? message;
  ValidationFailure({this.message});
}

// Auth Unauthorized
class UnauthorizedFailure extends Failure {
  final String? message;
  UnauthorizedFailure({this.message});
}

// Empty cash exception
class EmptyCacheFailure extends Failure {}
class DataTypeChangeFailure extends Failure {}

