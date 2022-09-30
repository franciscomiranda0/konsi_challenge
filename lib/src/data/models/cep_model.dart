import 'package:konsi_challenge/src/domain/entities/cep.dart';

class CEPModel extends CEP {
  const CEPModel({
    required super.code,
    required super.state,
    required super.city,
    required super.neighborhood,
    required super.street,
  });

  factory CEPModel.fromMap(Map<String, dynamic> map) {
    return CEPModel(
      code: map['code'],
      state: map['state'],
      city: map['city'],
      neighborhood: map['district'],
      street: map['address'],
    );
  }
}
