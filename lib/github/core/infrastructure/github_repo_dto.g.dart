// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubRepoDTO _$$_GithubRepoDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_GithubRepoDTO',
      json,
      ($checkedConvert) {
        final val = _$_GithubRepoDTO(
          owner: $checkedConvert(
              'owner', (v) => UserDTO.fromJson(v as Map<String, dynamic>)),
          name: $checkedConvert('name', (v) => v as String),
          description:
              $checkedConvert('description', (v) => _descriptionFromJson(v)),
          stargazersCount: $checkedConvert('stargazers_count', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {'stargazersCount': 'stargazers_count'},
    );

Map<String, dynamic> _$$_GithubRepoDTOToJson(_$_GithubRepoDTO instance) =>
    <String, dynamic>{
      'owner': instance.owner.toJson(),
      'name': instance.name,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
    };
