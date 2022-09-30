import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IEnvironment {
  String? get cepApiHost;
  String? get cepApiPath;
  bool get isProduction;
}

class ProductionEnvironment implements IEnvironment {
  const ProductionEnvironment._();

  @override
  String? get cepApiHost => dotenv.env['CEP_API_HOST'];

  @override
  String? get cepApiPath => dotenv.env['CEP_API_PATH'];

  @override
  bool get isProduction => true;
}
