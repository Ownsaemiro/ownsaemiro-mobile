import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ownsaemiro/data/provider/token/token_provider.dart';

class TokenProviderImpl implements TokenProvider {
  TokenProviderImpl({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _flutterSecureStorage = flutterSecureStorage;

  final FlutterSecureStorage _flutterSecureStorage;
  String? _accessToken;
  String? _refreshToken;

  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */

  /// Initialize token provider
  @override
  Future<void> onInit() async {
    _accessToken = await _flutterSecureStorage.read(
      key: ULPException.accessToken,
    );

    _refreshToken = await _flutterSecureStorage.read(
      key: ULPException.refreshToken,
    );
  }

  /// Clear all tokens from local storage
  @override
  Future<void> clearTokens() async {
    await _flutterSecureStorage.delete(
      key: ULPException.accessToken,
    );

    await _flutterSecureStorage.delete(
      key: ULPException.refreshToken,
    );

    _accessToken = null;
    _refreshToken = null;
  }

  /* ------------------------------------------------------------ */
  /* -------------------------  Getter -------------------------- */
  /* ------------------------------------------------------------ */

  /// Get access token from local storage
  @override
  String? get accessToken => _accessToken;

  /// Get refresh token from local storage
  @override
  String? get refreshToken => _refreshToken;

  /* ------------------------------------------------------------ */
  /* -------------------------  Setter -------------------------- */
  /* ------------------------------------------------------------ */

  /// Set access token to local storage
  @override
  Future<void> setAccessToken(String accessToken) async {
    await _flutterSecureStorage.write(
      key: ULPException.accessToken,
      value: accessToken,
    );

    _accessToken = accessToken;
  }

  /// Set refresh token to local storage
  @override
  Future<void> setRefreshToken(String refreshToken) async {
    await _flutterSecureStorage.write(
      key: ULPException.refreshToken,
      value: refreshToken,
    );

    _refreshToken = refreshToken;
  }
}
