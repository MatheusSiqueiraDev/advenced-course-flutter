// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTodoApiModel _$CreateTodoApiModelFromJson(Map<String, dynamic> json) =>
    CreateTodoApiModel(
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateTodoApiModelToJson(CreateTodoApiModel instance) =>
    <String, dynamic>{'name': instance.name, 'runtimeType': instance.$type};

UpdateTodoApiModel _$UpdateTodoApiModelFromJson(Map<String, dynamic> json) =>
    UpdateTodoApiModel(
      id: json['id'] as String,
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTodoApiModelToJson(UpdateTodoApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'runtimeType': instance.$type,
    };
