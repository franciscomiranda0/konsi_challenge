import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

class SearchView extends HookWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;
    final hasSearched = useState(false);
    final showProgress = useState(false);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const KonsiVerticalSpacer(16),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 1250),
            height: hasSearched.value ? 0 : viewHeight * .3,
          ),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              fillColor: Colors.black12,
              filled: true,
              hintText: 'digite um CEP para começar',
            ),
            textAlign: TextAlign.end,
          ),
          KonsiPrimaryButton(
            showLoadIndicator: showProgress.value,
            onPressed: () {
              hasSearched.value = !hasSearched.value;
              showProgress.value = !showProgress.value;
            },
            child: const Text('PESQUISAR'),
          ),
        ],
      ),
    );
  }
}
