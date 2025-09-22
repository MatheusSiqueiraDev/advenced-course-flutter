// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTodoApiModel _$CreateTodoApiModelFromJson(Map<String, dynamic> json) =>
    CreateTodoApiModel(
      name: json['name'] as String,
      description: json['description'] as String,
      done: json['done'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateTodoApiModelToJson(CreateTodoApiModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'done': instance.done,
      'runtimeType': instance.$type,
    };

UpdateTodoApiModel _$UpdateTodoApiModelFromJson(Map<String, dynamic> json) =>
    UpdateTodoApiModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      done: json['done'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTodoApiModelToJson(UpdateTodoApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'done': instance.done,
      'runtimeType': instance.$type,
    };
