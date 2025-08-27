import 'package:cinebox/cine_main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSignIn.instance.initialize(
    serverClientId:
        "718073741375-ue7a3uutk6u82tbtpfbuhsigu1kn313m.apps.googleusercontent.com",
  );

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(ProviderScope(child: CineMainApp()));
}
