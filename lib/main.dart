import 'package:cinebox/cine_main_app.dart';
import 'package:cinebox/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSignIn.instance.initialize(
    serverClientId:
        "718073741375-kagpoihidseev3via2v2mt27cc64j70d.apps.googleusercontent.com",
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: CineMainApp()));
}
