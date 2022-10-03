import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/presentation/blocs/cep_search/cep_search_bloc.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

class SearchView extends HookWidget {
  const SearchView({Key? key}) : super(key: key);

  void _getCep(BuildContext context, String code) =>
      context.read<CepSearchBloc>().add(CepSearched(code));

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;
    final cepController = useTextEditingController();
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
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            controller: cepController,
            cursorColor: Colors.green,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              fillColor: Colors.black12,
              filled: true,
              hintText: 'digite um CEP para começar',
              hintStyle: TextStyle(color: Colors.black45),
            ),
            textAlign: TextAlign.center,
          ),
          KonsiPrimaryButton(
            showLoadIndicator: showProgress.value,
            onPressed: cepController.text.isNotEmpty
                ? () => _getCep(context, cepController.text)
                : null,
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
            const KonsiVerticalSpacer(16),
            KonsiSecondaryButton(
              onPressed: () {},
              child: const Text('NOVA CONSULTA'),
            ),
            const KonsiVerticalSpacer(16),
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
