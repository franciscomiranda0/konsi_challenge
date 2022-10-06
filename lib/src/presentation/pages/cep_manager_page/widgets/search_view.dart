import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/core/injection/injector.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/presentation/blocs/cep_search/cep_search_bloc.dart';
import 'package:konsi_challenge/src/presentation/blocs/local_cep/local_cep_cubit.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';
import 'package:maps_launcher/maps_launcher.dart';

class SearchView extends HookWidget {
  const SearchView({Key? key}) : super(key: key);

  void _validateAndGetCep(
    BuildContext context,
    String code,
    GlobalKey<FormFieldState> key,
  ) {
    if (key.currentState?.validate() ?? false) {
      context.read<CepSearchBloc>().add(CepSearched(code));
      _dismiss(context);
    }
  }

  void _dismiss(BuildContext context) => FocusScope.of(context).unfocus();

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;
    final cepController = useTextEditingController();
    final cepFieldKey = useState(GlobalKey<FormFieldState>());

    return BlocProvider<CepSearchBloc>(
      create: injector(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const KonsiVerticalSpacer(16),
            BlocBuilder<CepSearchBloc, CepSearchState>(
              builder: (context, state) {
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1250),
                  height: state is CepInitial ||
                          state is CepLoadInProgress ||
                          state is CepLoadError
                      ? viewHeight * .3
                      : 0,
                );
              },
            ),
            TextFormField(
              controller: cepController,
              cursorColor: Colors.green,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                fillColor: Colors.black12,
                filled: true,
                hintText: 'digite um CEP para começar',
                hintStyle: TextStyle(color: Colors.black45),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              key: cepFieldKey.value,
              textAlign: TextAlign.center,
              validator: Validators.cepValidator,
            ),
            BlocBuilder<CepSearchBloc, CepSearchState>(
                builder: (context, state) {
              return KonsiPrimaryButton(
                showLoadIndicator: state is CepLoadInProgress,
                onPressed: () => _validateAndGetCep(
                  context,
                  cepController.text,
                  cepFieldKey.value,
                ),
                child: const Text('PESQUISAR'),
              );
            }),
            const _SearchedCepData(),
          ],
        ),
      ),
    );
  }
}

class _SearchedCepData extends StatelessWidget {
  const _SearchedCepData({Key? key}) : super(key: key);

  void _launchMapsFromCep(Cep cep) => MapsLauncher.launchQuery(
      '${cep.street}, ${cep.city} - ${cep.state} ${cep.code}');

  void _save(BuildContext context, Cep cep) =>
      context.read<LocalCepCubit>().saveCep(cep);

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;

    return BlocListener<LocalCepCubit, LocalCepState>(
      listener: (_, state) {
        if (state is WriteSuccess || state is EraseSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Operação realizada com sucesso'),
            ),
          );
        }
      },
      child: BlocBuilder<CepSearchBloc, CepSearchState>(
        builder: (context, state) {
          if (state is CepLoadInProgress) {
            return const SizedBox.shrink();
          } else if (state is CepLoadSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                KonsiVerticalSpacer(viewHeight * .2),
                KonsiCepExpansionTile(
                  cep: state.cep,
                  cepExpansionTileStyle:
                      CepExpansionTileStyle.neighborhoodEmphasis,
                ),
                const KonsiVerticalSpacer(16),
                KonsiPrimaryButton(
                  onPressed: () => _launchMapsFromCep(state.cep),
                  child: const Text('VER NO MAPA'),
                ),
                const KonsiVerticalSpacer(16),
                KonsiPrimaryButton(
                  onPressed: () => _save(context, state.cep),
                  child: const Text('SALVAR'),
                ),
                const KonsiVerticalSpacer(16),
                KonsiSecondaryButton(
                  onPressed: () {},
                  child: const Text('NOVA CONSULTA'),
                ),
                const KonsiVerticalSpacer(16),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class Validators {
  const Validators._();

  static String? cepValidator(String? cep) {
    String? errorText;

    if (cep != null) {
      if (cep.length != 10) {
        errorText = 'Formato de CEP inválido.';
      }
    }

    return errorText;
  }
}
