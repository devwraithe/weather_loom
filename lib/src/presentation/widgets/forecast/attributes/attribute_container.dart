import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_theme.dart';

class AttributeContainer extends StatelessWidget {
  const AttributeContainer({
    super.key,
    required this.loading,
    required this.child,
    required this.title,
  });

  final bool loading;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(
            loading ? 0.2 : 0.1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 180,
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextTheme.textTheme.labelMedium?.copyWith(
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}
