import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

class SearchView extends HookWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;
    final hasSearched = useState(false);
    final showProgress = useState(false);
    final showResult = useState(false);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const KonsiVerticalSpacer(16),
          AnimatedContainer(
            onEnd: () =>
                showResult.value = !showResult.value ? true : showResult.value,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 1250),
            height: hasSearched.value ? 0 : viewHeight * .3,
          ),
          TextFormField(
            cursorColor: Colors.green,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              fillColor: Colors.black12,
              filled: true,
              hintText: 'digite um CEP para começar',
              hintStyle: TextStyle(color: Colors.black45),
            ),
            textAlign: TextAlign.start,
          ),
          KonsiPrimaryButton(
            showLoadIndicator: showProgress.value,
            onPressed: () {
              showResult.value = showResult.value ? false : showResult.value;
              hasSearched.value = !hasSearched.value;
              showProgress.value = !showProgress.value;
            },
            child: const Text('PESQUISAR'),
          ),
          if (hasSearched.value) ...[
            KonsiVerticalSpacer(viewHeight * .2),
            const KonsiCepExpansionTile(
              cep: _cepMock,
              cepExpansionTileStyle: CepExpansionTileStyle.neighborhoodEmphasis,
            ),
            const KonsiVerticalSpacer(16),
            KonsiPrimaryButton(
              onPressed: () {},
              child: const Text('VER NO MAPA'),
            ),
            const KonsiVerticalSpacer(16),
            KonsiPrimaryButton(
              onPressed: () {},
              child: const Text('SALVAR'),
            ),
          ],
        ],
      ),
    );
  }
}

const _cepMock = Cep(
  code: '88000123',
  state: 'SC',
  city: 'Florianópolis',
  neighborhood: 'Campeche',
  street: 'Av. Pequeno Príncipe - lado par',
);
