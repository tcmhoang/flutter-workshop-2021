import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_header.freezed.dart';

part 'github_header.g.dart';

@freezed
class GithubHeader with _$GithubHeader {
  const GithubHeader._();

  const factory GithubHeader({String? etag, PaginationLink? link}) =
      _GithubHeader;

  factory GithubHeader.parse(Response response) {
    final link = response.headers.map['Link']?[-1];
    return GithubHeader(
      etag: response.headers.map['ETag']?[0],
      link: link == null
          ? null
          : PaginationLink.parse(
              link.split(','),
              requestUrl: response.requestOptions.uri.toString(),
            ),
    );
  }

  factory GithubHeader.fromJson(Map<String, dynamic> json) {
    return _$GithubHeaderFromJson(json);
  }
}

@freezed
class PaginationLink with _$PaginationLink {
  const PaginationLink._();

  const factory PaginationLink({
    required int maxPage,
  }) = _PaginationLink;

  factory PaginationLink.parse(
    List<String> values, {
    required String requestUrl,
  }) {
    return PaginationLink(
      maxPage: _extractPageNumber(
        values.firstWhere(
          (element) => element.contains('rel="last"'),
          orElse: () => requestUrl,
        ),
      ),
    );
  }

  static int _extractPageNumber(String value) {
    final urlString = RegExp(
            r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)')
        .stringMatch(value);
    return int.parse(
      Uri.parse(urlString!).queryParameters['page']!,
    );
  }

  factory PaginationLink.fromJson(Map<String, dynamic> json) {
    return _$PaginationLinkFromJson(json);
  }
}
