part of 'konsi_cep_expansion_tile.dart';

class _KonsiCepExpansionTileDetailRow extends StatelessWidget {
  static const _detailLabelStyle = TextStyle(
    fontWeight: FontWeight.w700,
  );

  final String label;
  final String value;

  const _KonsiCepExpansionTileDetailRow({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: _detailLabelStyle,
        ),
        Text(value),
      ],
    );
  }
}
