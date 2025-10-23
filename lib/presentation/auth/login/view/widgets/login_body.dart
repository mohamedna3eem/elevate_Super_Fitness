import 'dart:ui';

import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_auth_bg.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view/widgets/section_text_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return CustomAuthBg(
      child: Column(
        children: [
          SizedBox(height: 77.h, width: double.infinity),
          const SectionTextLogin(),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 34.6, sigmaY: 34.6),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF242424).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Column(children: [SizedBox(height: 360)]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
