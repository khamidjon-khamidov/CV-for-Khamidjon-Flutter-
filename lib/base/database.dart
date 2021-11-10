import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/aboutme_db_provider.dart';
import 'package:encrypt/encrypt.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../config.dart';
import 'logger.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();

  static AppDatabase get instance => _singleton;

  Completer<Database>? _dbOpenCompleter;

  AppDatabase._();

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer<Database>();
      final Directory appDocumentDir = await getApplicationDocumentsDirectory();
      await appDocumentDir.create(recursive: true);
      final String dbPath = join(appDocumentDir.path, Config.DB_NAME);
      final SembastCodec? codec = Config.appFlavor == Flavor.development
          ? null
          : SembastCodec(
              signature: 'encrypt',
              codec: _EncryptCodec(sha256.convert(utf8.encode(Config.DB_PASSWORD)).bytes),
            );
      _dbOpenCompleter!.complete(
        databaseFactoryIo.openDatabase(
          dbPath,
          codec: codec,
          version: Config.DB_VERSION,
          onVersionChanged: (database, oldVersion, newVersion) async {
            if (oldVersion < newVersion) {
              await AboutMeDbProvider(database).clear();
              //
              // final accountProvider = AccountDbProvider(database);
              //
              // await accountProvider.deleteProfile();
              // await accountProvider.deleteCompany();
              //saving token for update profile
            }
            simpleLogger.d("Database was migrate from $oldVersion to $newVersion");
            return;
          },
        ),
      );
    }
    return _dbOpenCompleter!.future;
  }
}

class _EncryptEncoder extends Converter<Map<String, dynamic>, String> {
  final Salsa20 salsa20;

  _EncryptEncoder(this.salsa20);

  @override
  String convert(Map<String, dynamic> input) {
    String encoded = Encrypter(salsa20).encrypt(json.encode(input), iv: IV.fromLength(8)).base64;
    return encoded;
  }
}

class _EncryptDecoder extends Converter<String, Map<String, dynamic>> {
  final Salsa20 salsa20;

  _EncryptDecoder(this.salsa20);

  @override
  Map<String, dynamic> convert(String input) {
    dynamic decoded = json.decode(Encrypter(salsa20).decrypt64(input, iv: IV.fromLength(8)));
    if (decoded is Map) {
      return decoded.cast<String, dynamic>();
    }
    throw FormatException('invalid input $input');
  }
}

class _EncryptCodec extends Codec<Map<String, dynamic>, String> {
  late _EncryptEncoder _encoder;
  late _EncryptDecoder _decoder;

  _EncryptCodec(List<int> passwordBytes) {
    Salsa20 salsa20 = Salsa20(Key(Uint8List.fromList(passwordBytes)));
    _encoder = _EncryptEncoder(salsa20);
    _decoder = _EncryptDecoder(salsa20);
  }

  @override
  Converter<String, Map<String, dynamic>> get decoder => _decoder;

  @override
  Converter<Map<String, dynamic>, String> get encoder => _encoder;
}
