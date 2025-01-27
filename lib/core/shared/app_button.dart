import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.action,
    this.loading = false,
    this.style = const TextStyle(),
  });

  final String text;
  final VoidCallback action;
  final bool loading;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return loading
        ? loaderWidget() // Replace with your actual loader widget
        : InkWell(
            onTap: action,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: style.copyWith(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
Widget loaderWidget() =>  Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
      ),
    );