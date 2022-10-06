part of 'search_view.dart';

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
