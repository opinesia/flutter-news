import 'package:flutter_application_1/src/core/domain/entity/source_entity.dart';

class SourceModel extends SourceEntity {
  const SourceModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );
  factory SourceModel.fromJson(dynamic json) {
    return SourceModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
