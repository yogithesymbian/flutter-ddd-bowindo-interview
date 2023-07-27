import 'package:dio/dio.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/dto/auth_dto.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/payload/auth_payload.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/provider/network_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'credential_network_service.g.dart';

final credentialNetworkServiceProvider =
    Provider((ref) => CredentialNetworkService(ref.read));

@RestApi()
abstract class CredentialNetworkService {
  factory CredentialNetworkService(Reader reader) =>
      _CredentialNetworkService(reader(networkClientProvider));

  @POST('/login')
  Future<AuthDTO> signIN(@Body() AuthPayload payload);

  @POST('/v1/logout')
  Future<void> logout();
}
