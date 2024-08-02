import 'package:dartz/dartz.dart';
import 'package:edge_pro/core/errors/failure.dart';
import 'package:edge_pro/core/network/network_checker.dart';
import 'package:edge_pro/module/user/data/data_source/user_local_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/user.dart';

class UserRepository {
  final NetworkChecker networkChecker;
  final UserLocaleDataSource localDataSource;

  UserRepository({required this.networkChecker, required this.localDataSource});

  Future<Either<Failure, User>> getCachedUser() async {
    try {
      final User user = await localDataSource.getCachedUser();
      return Right(user);
    } on EmptyCashException {
      return Left(EmptyCacheFailure());
    }
  }

  Future<Either<Failure, Unit>> cacheUser({required User user}) async {
    try {
      return Right(await localDataSource.cacheUser(user: user));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Unit> removeCachedUser() async => await localDataSource.removeCachedUser();
}
