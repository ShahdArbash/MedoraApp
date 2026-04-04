import 'package:flutter/material.dart';
import 'package:medoraapp/constants/assets.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({super.key});

  Future<void> _signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Navigate to home or handle success
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (_) => const HomeView()),
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.googleSignInSuccess),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.googleSignInFailed),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.signInWithGoogle,
          style: CairoFonts.bold(color: AppColors.whiteColor, fontSize: 14),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => _signInWithGoogle(context),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Image.asset(Assets.google, width: 40, height: 40),
          ),
        ),
      ],
    );
  }
}
