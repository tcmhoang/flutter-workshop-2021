import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo_detail.freezed.dart';

@freezed
class GithubRepoDetail with _$GithubRepoDetail {
  const factory GithubRepoDetail({
    required String html,
    required bool starred,
    required String fullName,
  }) = _GithubRepoDetail;
}
