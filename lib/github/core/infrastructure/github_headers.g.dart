// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_headers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubHeaders _$$_GithubHeadersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_GithubHeaders',
      json,
      ($checkedConvert) {
        final val = _$_GithubHeaders(
          etag: $checkedConvert('etag', (v) => v as String?),
          link: $checkedConvert(
              'link',
              (v) => v == null
                  ? null
                  : PaginationLink.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GithubHeadersToJson(_$_GithubHeaders instance) =>
    <String, dynamic>{
      'etag': instance.etag,
      'link': instance.link?.toJson(),
    };

_$_PaginationLink _$$_PaginationLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_PaginationLink',
      json,
      ($checkedConvert) {
        final val = _$_PaginationLink(
          maxPage: $checkedConvert('max_page', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {'maxPage': 'max_page'},
    );

Map<String, dynamic> _$$_PaginationLinkToJson(_$_PaginationLink instance) =>
    <String, dynamic>{
      'max_page': instance.maxPage,
    };
