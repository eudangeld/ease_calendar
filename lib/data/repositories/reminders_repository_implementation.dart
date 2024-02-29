import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/datasource/reminders_remote_datasource.dart';
import '../../domain/entities/index.dart';
import '../../domain/repositories/index.dart';
import '../../domain/usecases/index.dart';

class RemindersRepositoryImplementation implements RemindersRepository {
  final RemindersDataSource remoteDatasource;

  RemindersRepositoryImplementation(this.remoteDatasource);

  @override
  Future<Either<Failure, Reminder>> createReminder(
      CreateReminderParams reminder) async {
    try {
      final response = await remoteDatasource.createReminder(reminder);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<DateTime>>> getDates(
      GetReminderDatesParams params) async {
    try {
      final response = await remoteDatasource.getDates(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Reminder>>> getRemindersByDate(
      RetrieveReminderByDateParams params) async {
    try {
      final response = await remoteDatasource.getRemindersByDate(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Reminder>> getReminderById(
      RetrieveReminderByIdParams params) async {
    try {
      final response = await remoteDatasource.getReminderById(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Reminder>> editReminder(
      EditReminderParams params) async {
    try {
      final response = await remoteDatasource.editReminder(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteReminder(
      DeleteReminderParams params) async {
    try {
      final response = await remoteDatasource.deleteReminder(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Token>> retrieveToken(
      RetrieveTokenParams params) async {
    try {
      final response = await remoteDatasource.retrieveToken(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
