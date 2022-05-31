import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/detail/domain/github_repo_detail.dart';
import 'package:sembast/sembast.dart';

part 'github_repo_detail_dto.g.dart';
part 'github_repo_detail_dto.freezed.dart';

@freezed
class GithubRepoDetailDto with _$GithubRepoDetailDto {
  const factory GithubRepoDetailDto({
    required String html,
    required bool starred,
    required String fullName,
  }) = _GithubRepoDetailDto;

  factory GithubRepoDetailDto.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDetailDtoFromJson(json);

  GithubRepoDetail toDomain() => GithubRepoDetail(
        html: html,
        starred: starred,
        fullName: fullName,
      );

  Map<String, dynamic> toSembast() => toJson()..remove('fullName');

  factory GithubRepoDetailDto.fromSembast(
    RecordSnapshot<String, Map<String, dynamic>> snapshot,
  ) {
    final Map<String, dynamic> cpMap = Map.from(snapshot.value);
    cpMap['fullName'] = snapshot.key;
    return GithubRepoDetailDto.fromJson(cpMap);
  }
}
