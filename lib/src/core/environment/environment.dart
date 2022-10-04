import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductionEnvironment {
  const ProductionEnvironment._();

  static String? get cepApiScheme => dotenv.env['CEP_API_SCHEME'];
  static String? get cepApiHost => dotenv.env['CEP_API_HOST'];
  static String? get cepApiPathStart => dotenv.env['CEP_API_PATH_START'];
  static String? get cepApiPathEnd => dotenv.env['CEP_API_PATH_END'];
}
