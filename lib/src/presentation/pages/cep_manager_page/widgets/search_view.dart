import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/core/injection/injector.dart';
import 'package:konsi_challenge/src/core/utils/validators.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/presentation/blocs/cep_search/cep_search_bloc.dart';
import 'package:konsi_challenge/src/presentation/blocs/local_cep/local_cep_cubit.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';
import 'package:maps_launcher/maps_launcher.dart';

part 'searched_cep_date.dart';

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
              builder: (_, state) {
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
              keyboardType: TextInputType.number,
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
