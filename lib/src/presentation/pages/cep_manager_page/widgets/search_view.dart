import 'package:flutter/material.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_primary_button.dart';
import 'package:konsi_challenge/src/presentation/widgets/konsi_vertical_spacer.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const KonsiVerticalSpacer(16),
          TextFormField(),
          KonsiPrimaryButton(
            onPressed: () {},
            child: const Text('PESQUISAR'),
          ),
        ],
      ),
    );
  }
}
