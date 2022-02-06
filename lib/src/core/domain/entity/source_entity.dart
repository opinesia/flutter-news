import 'package:equatable/equatable.dart';

class SourceEntity extends Equatable {
  final String id;
  final String name;

  const SourceEntity({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];

  SourceEntity copyWith({
    String? id,
    String? name,
  }) =>
      SourceEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
