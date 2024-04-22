// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amadeus_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmadeusTokenDto _$AmadeusTokenDtoFromJson(Map<String, dynamic> json) =>
    AmadeusTokenDto(
      type: json['type'] as String,
      username: json['username'] as String,
      applicationName: json['application_name'] as String,
      clientId: json['client_id'] as String,
      tokenType: json['token_type'] as String,
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
      state: json['state'] as String,
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$AmadeusTokenDtoToJson(AmadeusTokenDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'username': instance.username,
      'application_name': instance.applicationName,
      'client_id': instance.clientId,
      'token_type': instance.tokenType,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'state': instance.state,
      'scope': instance.scope,
    };
