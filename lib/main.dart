import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:konsi_challenge/src/konsi_challenge_app.dart';

void main() async {
  await dotenv.load();

  runApp(const KonsiChallengeApp());
}
