import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/core/infrastucture/user_dto.dart';

part 'github_repo_dto.freezed.dart';

part 'github_repo_dto.g.dart';

String _descriptionFromJson(Object? json) => (json as String?) ?? '';

@freezed
class GithubRepoDTO with _$GithubRepoDTO {
  const GithubRepoDTO._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GithubRepoDTO({
    required UserDTO owner,
    required String name,
    @JsonKey(fromJson: _descriptionFromJson) required String description,
    required int stargazersCount,
  }) = _GithubRepoDTO;

  factory GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDTOFromJson(json);

  factory GithubRepoDTO.fromDomain(GithubRepo _) {
    return GithubRepoDTO(
      owner: UserDTO.fromDomain(_.owner),
      name: _.name,
      description: _.description,
      stargazersCount: _.stargazersCount,
    );
  }

  GithubRepo toDomain() {
    return GithubRepo(
      owner: owner.toDomain(),
      name: name,
      description: description,
      stargazersCount: stargazersCount,
    );
  }
}
