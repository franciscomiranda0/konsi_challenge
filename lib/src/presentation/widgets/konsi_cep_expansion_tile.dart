import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

part 'konsi_cep_expansion_tile_detail_row.dart';

enum CepExpansionTileStyle { cepEmphasis, neighborhoodEmphasis }

class KonsiCepExpansionTile extends HookWidget {
  static const _headingLabelStyle = TextStyle(
    fontWeight: FontWeight.w700,
  );

  final Cep _cep;
  final CepExpansionTileStyle _cepExpansionTileStyle;
  final void Function(Cep)? onDeletePressed;

  const KonsiCepExpansionTile({
    required Cep cep,
    required CepExpansionTileStyle cepExpansionTileStyle,
    this.onDeletePressed,
    Key? key,
  })  : _cep = cep,
        _cepExpansionTileStyle = cepExpansionTileStyle,
        super(key: key);

  bool get _isCepStyle =>
      _cepExpansionTileStyle == CepExpansionTileStyle.cepEmphasis;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return ExpansionTile(
      backgroundColor: Colors.black12,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      initiallyExpanded: _isCepStyle ? false : true,
      onExpansionChanged: (_isExpanded) => isExpanded.value = _isExpanded,
      subtitle: Text(
        _isCepStyle ? _cep.neighborhood : _cep.code,
        style: _headingLabelStyle,
      ),
      title: Text(
        _isCepStyle ? _cep.code : _cep.neighborhood.toUpperCase(),
        style: _headingLabelStyle,
      ),
      trailing: Text('ver ${isExpanded.value ? '-' : '+'}'),
      childrenPadding: const EdgeInsets.all(8),
      children: [
        _KonsiCepExpansionTileDetailRow(
          label: 'RUA',
          value: _cep.street,
        ),
        const KonsiVerticalSpacer(8),
        _KonsiCepExpansionTileDetailRow(
          label: 'MUNICÍPIO',
          value: _cep.city,
        ),
        const KonsiVerticalSpacer(8),
        _KonsiCepExpansionTileDetailRow(
          label: 'UF',
          value: _cep.state,
        ),
        if (_cepExpansionTileStyle == CepExpansionTileStyle.cepEmphasis) ...[
          const KonsiVerticalSpacer(32),
          KonsiSecondaryButton(
            onPressed: () => onDeletePressed?.call(_cep),
            child: const Text('EXCLUIR'),
          ),
        ],
      ],
    );
  }
}
