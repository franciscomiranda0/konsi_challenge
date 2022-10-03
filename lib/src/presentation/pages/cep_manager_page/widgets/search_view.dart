import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_widgets.dart';

class SearchView extends HookWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewHeight = MediaQuery.of(context).size.height;
    final hasSearched = useState(false);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const KonsiVerticalSpacer(16),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 1250),
            height: hasSearched.value ? viewHeight * .1 : viewHeight * .3,
          ),
          TextFormField(),
          KonsiPrimaryButton(
            onPressed: () {
              hasSearched.value = !hasSearched.value;
            },
            child: const Text('PESQUISAR'),
          ),
        ],
      ),
    );
  }
}
