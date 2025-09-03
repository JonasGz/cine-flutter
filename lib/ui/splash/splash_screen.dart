import 'package:cinebox/data/core/providers/auth_providers.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderAndMessage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
                ElevatedButton.icon(
                  onPressed: () async {
                    final repo = ref.read(authRepositoryProvider);
                    final navigator = Navigator.of(context);
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    try {
                      await repo.signInWithGoogle();
                      navigator.pushNamed('/home');
                    } catch (e) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(content: Text('Erro no login: $e')),
                      );
                    }
                  },
                  label: const Text(
                    'Sign in with Google',
                    style: AppTextStyles.regularSmall,
                  ),
                  icon: Image.asset(R.ASSETS_IMAGES_GOOGLE_LOGO_PNG),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
