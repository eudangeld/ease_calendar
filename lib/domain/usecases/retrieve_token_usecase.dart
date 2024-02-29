import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:easy_calendar/domain/entities/token.dart';
import '../../core/error/failures.dart';
import '../../core/usecase_interface.dart';
import '../repositories/reminders_repository.dart';

class RetrieveTokenUseCase implements AsyncUseCase<Token, RetrieveTokenParams> {
  RetrieveTokenUseCase(this.repository);

  final RemindersRepository repository;

  @override
  Future<Either<Failure, Token>> call(RetrieveTokenParams params) async {
    return await repository.retrieveToken(params);
  }
}

class RetrieveTokenParams {
  String name;

  RetrieveTokenParams({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory RetrieveTokenParams.fromMap(Map<String, dynamic> map) {
    return RetrieveTokenParams(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RetrieveTokenParams.fromJson(String source) =>
      RetrieveTokenParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
