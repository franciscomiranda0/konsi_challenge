import 'package:floor/floor.dart';
import 'package:konsi_challenge/src/core/utils/constants.dart';

@Entity(tableName: Constants.cepTableName)
class Cep {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String code;
  final String state;
  final String city;
  final String neighborhood;
  final String street;

  const Cep({
    required this.id,
    required this.code,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.street,
  });
}
