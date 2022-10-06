import 'package:konsi_challenge/src/domain/entities/cep.dart';

class CepModel extends Cep {
  const CepModel._({
    required super.code,
    required super.state,
    required super.city,
    required super.neighborhood,
    required super.street,
  }) : super();

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel._(
      code: map['cep'],
      state: map['uf'],
      city: map['localidade'],
      neighborhood: map['bairro'],
      street: map['logradouro'],
    );
  }
}
