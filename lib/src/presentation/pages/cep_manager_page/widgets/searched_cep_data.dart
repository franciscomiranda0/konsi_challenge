part of 'search_view.dart';

class _SearchedCepData extends StatelessWidget {
  final void Function(Cep) onMapsPressed;
  final void Function(BuildContext, Cep) onSavePressed;

  const _SearchedCepData({
    required this.onMapsPressed,
    required this.onSavePressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<CepSearchBloc, CepSearchState>(
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
                onPressed: () => onMapsPressed(state.cep),
                child: const Text('VER NO MAPA'),
              ),
              const KonsiVerticalSpacer(16),
              KonsiPrimaryButton(
                onPressed: () => onSavePressed(context, state.cep),
                child: const Text('SALVAR'),
              ),
              const KonsiVerticalSpacer(16),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
