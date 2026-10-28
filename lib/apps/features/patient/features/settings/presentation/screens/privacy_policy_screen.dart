import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/header_appbar.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final direction = isArabic ? TextDirection.rtl : TextDirection.ltr;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Directionality(
              textDirection: direction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: context.h(16),
                      bottom: context.h(24),
                    ),
                    child: HeaderAppBar(
                      title: context.t.privacyPolicyTitle,
                      showAction: false,
                      onBackPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        context.w(20),
                        0,
                        context.w(20),
                        context.h(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildParagraph(
                            context,
                            context.t.privacyPolicyLastUpdated,
                          ),
                          SizedBox(height: context.h(20)),
                          _buildSection(
                            context,
                            context.t.privacyPolicyIntroductionTitle,
                            context.t.privacyPolicyIntroductionBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicyInformationTitle,
                            context.t.privacyPolicyInformationBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicyUsageTitle,
                            context.t.privacyPolicyUsageBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicySecurityTitle,
                            context.t.privacyPolicySecurityBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicySharingTitle,
                            context.t.privacyPolicySharingBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicyRightsTitle,
                            context.t.privacyPolicyRightsBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicyChildrenTitle,
                            context.t.privacyPolicyChildrenBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicyChangesTitle,
                            context.t.privacyPolicyChangesBody,
                          ),
                          _buildSection(
                            context,
                            context.t.privacyPolicyContactTitle,
                            context.t.privacyPolicyContactBody,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String body) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: context.boldPx18.copyWith(
              fontSize: context.sp(18),
              color: AppColors.textPlaceholder,
            ),
          ),
          SizedBox(height: context.h(10)),
          _buildParagraph(context, body),
        ],
      ),
    );
  }

  Widget _buildParagraph(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: context.regularPx14.copyWith(
        fontSize: context.sp(14),
        height: 1.7,
        color: AppColors.textSub,
      ),
    );
  }
}
