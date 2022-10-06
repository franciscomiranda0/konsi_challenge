part of 'notebook_view.dart';

class _NotebookViewSearchHeader extends HookWidget {
  const _NotebookViewSearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cepController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KonsiTextFormField(
          controller: cepController,
          hint: 'digite um CEP para encontrar',
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          keyboardType: TextInputType.number,
          validator: Validators.cepValidator,
        ),
        KonsiPrimaryButton(
          onPressed: () {
            context.read<LocalCepCubit>().getCepByCode(cepController.text);
            cepController.clear();
          },
          child: const Text('PROCURAR SALVOS'),
        ),
        const KonsiVerticalSpacer(16),
        KonsiSecondaryButton(
          onPressed: () => context.read<LocalCepCubit>().getAllSavedCeps(),
          child: const Text('VER TODOS OS SALVOS'),
        ),
      ],
    );
  }
}
