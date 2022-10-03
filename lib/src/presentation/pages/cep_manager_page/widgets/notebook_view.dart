import 'package:flutter/material.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

const _cepMock = Cep(
  code: '88000123',
  state: 'SC',
  city: 'Florianópolis',
  neighborhood: 'Campeche',
  street: 'Av. Pequeno Príncipe - lado par',
);

const _cepsMock = [
  _cepMock,
  _cepMock,
  _cepMock,
  _cepMock,
  _cepMock,
  _cepMock,
  _cepMock,
  _cepMock,
  _cepMock,
  _cepMock,
];

class NotebookView extends StatelessWidget {
  const NotebookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: _cepsMock.length,
      itemBuilder: (_, int index) {
        return KonsiCepExpansionTile(
          cep: _cepsMock[index],
          cepExpansionTileStyle: CepExpansionTileStyle.cepEmphasis,
        );
      },
    );
  }
}
