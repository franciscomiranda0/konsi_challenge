import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductionEnvironment {
  const ProductionEnvironment._();

  static String? get cepApiHost => dotenv.env['CEP_API_HOST'];
  static String? get cepApiPath => dotenv.env['CEP_API_PATH'];
}
