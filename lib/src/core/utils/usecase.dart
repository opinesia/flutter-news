import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failures.dart';

abstract class UseCase<Type, Payload> {
  Future<Type> call(Payload payload);
}

abstract class UseCaseEither<Type, Payload> {
  Future<Either<Failure, Type>> call(Payload payload);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class NoParam {}
