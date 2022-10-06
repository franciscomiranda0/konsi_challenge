import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/core/utils/validators.dart';
import 'package:konsi_challenge/src/presentation/blocs/local_cep/local_cep_cubit.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

part 'notebook_view_search_header.dart';

class NotebookView extends StatelessWidget {
  const NotebookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const KonsiVerticalSpacer(16),
          const _NotebookViewSearchHeader(),
          BlocConsumer<LocalCepCubit, LocalCepState>(
            listener: (context, state) {
              if (state is EraseSuccess) {
                context.read<LocalCepCubit>().getAllSavedCeps();
              }
            },
            builder: (_, state) {
              final localCepsCubit = context.read<LocalCepCubit>();
              if (state is AccessInProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              if (localCepsCubit.ceps.isEmpty) {
                return const Center(
                  child: Text('Ainda não há nada cadastrado.'),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: localCepsCubit.ceps.length,
                itemBuilder: (_, int index) {
                  return KonsiCepExpansionTile(
                    cep: localCepsCubit.ceps[index],
                    cepExpansionTileStyle: CepExpansionTileStyle.cepEmphasis,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
