// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
TodoApiModel _$TodoApiModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'create':
          return CreateTodoApiModel.fromJson(
            json
          );
                case 'update':
          return UpdateTodoApiModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'TodoApiModel',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$TodoApiModel {

 String get name; String get description; bool get done;
/// Create a copy of TodoApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoApiModelCopyWith<TodoApiModel> get copyWith => _$TodoApiModelCopyWithImpl<TodoApiModel>(this as TodoApiModel, _$identity);

  /// Serializes this TodoApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoApiModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.done, done) || other.done == done));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,done);

@override
String toString() {
  return 'TodoApiModel(name: $name, description: $description, done: $done)';
}


}

/// @nodoc
abstract mixin class $TodoApiModelCopyWith<$Res>  {
  factory $TodoApiModelCopyWith(TodoApiModel value, $Res Function(TodoApiModel) _then) = _$TodoApiModelCopyWithImpl;
@useResult
$Res call({
 String name, String description, bool done
});




}
/// @nodoc
class _$TodoApiModelCopyWithImpl<$Res>
    implements $TodoApiModelCopyWith<$Res> {
  _$TodoApiModelCopyWithImpl(this._self, this._then);

  final TodoApiModel _self;
  final $Res Function(TodoApiModel) _then;

/// Create a copy of TodoApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? done = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoApiModel].
extension TodoApiModelPatterns on TodoApiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateTodoApiModel value)?  create,TResult Function( UpdateTodoApiModel value)?  update,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateTodoApiModel() when create != null:
return create(_that);case UpdateTodoApiModel() when update != null:
return update(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateTodoApiModel value)  create,required TResult Function( UpdateTodoApiModel value)  update,}){
final _that = this;
switch (_that) {
case CreateTodoApiModel():
return create(_that);case UpdateTodoApiModel():
return update(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateTodoApiModel value)?  create,TResult? Function( UpdateTodoApiModel value)?  update,}){
final _that = this;
switch (_that) {
case CreateTodoApiModel() when create != null:
return create(_that);case UpdateTodoApiModel() when update != null:
return update(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String description,  bool done)?  create,TResult Function( String id,  String name,  String description,  bool done)?  update,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateTodoApiModel() when create != null:
return create(_that.name,_that.description,_that.done);case UpdateTodoApiModel() when update != null:
return update(_that.id,_that.name,_that.description,_that.done);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String description,  bool done)  create,required TResult Function( String id,  String name,  String description,  bool done)  update,}) {final _that = this;
switch (_that) {
case CreateTodoApiModel():
return create(_that.name,_that.description,_that.done);case UpdateTodoApiModel():
return update(_that.id,_that.name,_that.description,_that.done);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String description,  bool done)?  create,TResult? Function( String id,  String name,  String description,  bool done)?  update,}) {final _that = this;
switch (_that) {
case CreateTodoApiModel() when create != null:
return create(_that.name,_that.description,_that.done);case UpdateTodoApiModel() when update != null:
return update(_that.id,_that.name,_that.description,_that.done);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CreateTodoApiModel implements TodoApiModel {
  const CreateTodoApiModel({required this.name, required this.description, required this.done, final  String? $type}): $type = $type ?? 'create';
  factory CreateTodoApiModel.fromJson(Map<String, dynamic> json) => _$CreateTodoApiModelFromJson(json);

@override final  String name;
@override final  String description;
@override final  bool done;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TodoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTodoApiModelCopyWith<CreateTodoApiModel> get copyWith => _$CreateTodoApiModelCopyWithImpl<CreateTodoApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTodoApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTodoApiModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.done, done) || other.done == done));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,done);

@override
String toString() {
  return 'TodoApiModel.create(name: $name, description: $description, done: $done)';
}


}

/// @nodoc
abstract mixin class $CreateTodoApiModelCopyWith<$Res> implements $TodoApiModelCopyWith<$Res> {
  factory $CreateTodoApiModelCopyWith(CreateTodoApiModel value, $Res Function(CreateTodoApiModel) _then) = _$CreateTodoApiModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, bool done
});




}
/// @nodoc
class _$CreateTodoApiModelCopyWithImpl<$Res>
    implements $CreateTodoApiModelCopyWith<$Res> {
  _$CreateTodoApiModelCopyWithImpl(this._self, this._then);

  final CreateTodoApiModel _self;
  final $Res Function(CreateTodoApiModel) _then;

/// Create a copy of TodoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? done = null,}) {
  return _then(CreateTodoApiModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UpdateTodoApiModel implements TodoApiModel {
  const UpdateTodoApiModel({required this.id, required this.name, required this.description, required this.done, final  String? $type}): $type = $type ?? 'update';
  factory UpdateTodoApiModel.fromJson(Map<String, dynamic> json) => _$UpdateTodoApiModelFromJson(json);

 final  String id;
@override final  String name;
@override final  String description;
@override final  bool done;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TodoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTodoApiModelCopyWith<UpdateTodoApiModel> get copyWith => _$UpdateTodoApiModelCopyWithImpl<UpdateTodoApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTodoApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTodoApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.done, done) || other.done == done));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,done);

@override
String toString() {
  return 'TodoApiModel.update(id: $id, name: $name, description: $description, done: $done)';
}


}

/// @nodoc
abstract mixin class $UpdateTodoApiModelCopyWith<$Res> implements $TodoApiModelCopyWith<$Res> {
  factory $UpdateTodoApiModelCopyWith(UpdateTodoApiModel value, $Res Function(UpdateTodoApiModel) _then) = _$UpdateTodoApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, bool done
});




}
/// @nodoc
class _$UpdateTodoApiModelCopyWithImpl<$Res>
    implements $UpdateTodoApiModelCopyWith<$Res> {
  _$UpdateTodoApiModelCopyWithImpl(this._self, this._then);

  final UpdateTodoApiModel _self;
  final $Res Function(UpdateTodoApiModel) _then;

/// Create a copy of TodoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? done = null,}) {
  return _then(UpdateTodoApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
