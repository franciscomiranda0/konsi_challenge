import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsi_challenge/src/presentation/blocs/local_cep/local_cep_cubit.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

// const _cepMock = Cep(
//   id: 21,
//   code: '88000123',
//   state: 'SC',
//   city: 'Florianópolis',
//   neighborhood: 'Campeche',
//   street: 'Av. Pequeno Príncipe - lado par',
// );
//
// const _cepsMock = [
//   _cepMock,
//   _cepMock,
//   _cepMock,
//   _cepMock,
//   _cepMock,
//   _cepMock,
//   _cepMock,
//   _cepMock,
//   _cepMock,
//   _cepMock,
// ];

class NotebookView extends StatelessWidget {
  const NotebookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.refresh,
          color: Colors.amber,
          size: 32,
        ),
        onPressed: () {
          context.read<LocalCepCubit>().getAllSavedCeps();
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.amber),
          foregroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.amber),
        ),
      ),
      body: BlocConsumer<LocalCepCubit, LocalCepState>(
        listener: (context, state) {
          if (state is LocalCepInitial ||
              state is WriteSuccess ||
              state is EraseSuccess) {
            context.read<LocalCepCubit>().getAllSavedCeps();
          }
        },
        builder: (_, state) {
          if (state is WithData) {
            if (state.ceps.isEmpty) {
              return const Center(
                child: Text('Ainda não há nada cadastrado.'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: state.ceps.length,
              itemBuilder: (_, int index) {
                return KonsiCepExpansionTile(
                  cep: state.ceps[index],
                  cepExpansionTileStyle: CepExpansionTileStyle.cepEmphasis,
                );
              },
            );
          } else if (state is AccessInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
