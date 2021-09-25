import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/user.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserDTO({
    @JsonKey(name: 'login') required String name,
    required String avatarUrl,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User _) {
    return UserDTO(name: _.name, avatarUrl: _.avatarUrl);
  }

  User toDomain() {
    return User(
      name: name,
      avatarUrl: avatarUrl,
    );
  }
}
