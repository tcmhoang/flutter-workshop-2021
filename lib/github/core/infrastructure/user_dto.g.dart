// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_UserDTO',
      json,
      ($checkedConvert) {
        final val = _$_UserDTO(
          name: $checkedConvert('login', (v) => v as String),
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'name': 'login', 'avatarUrl': 'avatar_url'},
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'login': instance.name,
      'avatar_url': instance.avatarUrl,
    };
