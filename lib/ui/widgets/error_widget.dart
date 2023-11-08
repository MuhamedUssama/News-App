import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';

class BuildErrorWidget extends StatelessWidget {
  final double height;
  final String errorMessage;
  const BuildErrorWidget(
      {super.key, required this.height, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes the shadow position
              ),
            ],
          ),
          child: Center(
            child: Text(
              errorMessage,
              style: AppTheme.errorText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
