// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubRepoDetailDto _$$_GithubRepoDetailDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_GithubRepoDetailDto',
      json,
      ($checkedConvert) {
        final val = _$_GithubRepoDetailDto(
          html: $checkedConvert('html', (v) => v as String),
          starred: $checkedConvert('starred', (v) => v as bool),
          fullName: $checkedConvert('full_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'fullName': 'full_name'},
    );

Map<String, dynamic> _$$_GithubRepoDetailDtoToJson(
        _$_GithubRepoDetailDto instance) =>
    <String, dynamic>{
      'html': instance.html,
      'starred': instance.starred,
      'full_name': instance.fullName,
    };
