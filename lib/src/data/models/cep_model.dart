import 'package:konsi_challenge/src/domain/entities/cep.dart';

class CepModel extends Cep {
  const CepModel({
    required super.code,
    required super.state,
    required super.city,
    required super.neighborhood,
    required super.street,
  });

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      code: map['code'],
      state: map['state'],
      city: map['city'],
      neighborhood: map['district'],
      street: map['address'],
    );
  }
}
