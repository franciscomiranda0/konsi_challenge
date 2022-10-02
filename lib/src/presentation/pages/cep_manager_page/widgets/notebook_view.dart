import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';

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
        return _Item(cep: _cepsMock[index]);
      },
    );
  }
}

class _Item extends HookWidget {
  final Cep _cep;

  const _Item({Key? key, required Cep cep})
      : _cep = cep,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return ExpansionTile(
      backgroundColor: Colors.black12,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      onExpansionChanged: (_isExpanded) => isExpanded.value = _isExpanded,
      trailing: Text('ver ${isExpanded.value ? '-' : '+'}'),
      subtitle: Text(_cep.neighborhood),
      title: Text(_cep.code),
      childrenPadding: const EdgeInsets.all(8),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Rua:'),
            Text(_cep.street),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Município:'),
            Text(_cep.city),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('UF:'),
            Text(_cep.state),
          ],
        ),
      ],
    );
  }
}
