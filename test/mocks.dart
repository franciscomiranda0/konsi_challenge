import 'package:konsi_challenge/src/domain/entities/cep.dart';

class Mocks {
  const Mocks._();

  static const cep = Cep(
    code: 'code',
    state: 'state',
    city: 'city',
    neighborhood: 'neighborhood',
    street: 'street',
  );
  static const cepSearch = '12345678';
}
