import 'package:json_annotation/json_annotation.dart';

part 'amadeus_token_dto.g.dart';

@JsonSerializable()
class AmadeusTokenDto {
  final String type;
  final String username;
  @JsonKey(name: 'application_name')
  final String applicationName;
  @JsonKey(name: 'client_id')
  final String clientId;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  final String state;
  final String scope;

  const AmadeusTokenDto({
    required this.type,
    required this.username,
    required this.applicationName,
    required this.clientId,
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
    required this.state,
    required this.scope,
  });

  factory AmadeusTokenDto.fromJson(Map<String, dynamic> json) {
    return _$AmadeusTokenDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AmadeusTokenDtoToJson(this);
}
