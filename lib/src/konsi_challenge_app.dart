import 'package:flutter/material.dart';
import 'package:konsi_challenge/src/core/utils/constants.dart';
import 'package:konsi_challenge/src/presentation/pages/cep_manager_page/cep_manager_page.dart';

class KonsiChallengeApp extends StatelessWidget {
  const KonsiChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      home: CepManagerPage(),
    );
  }
}
