import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required this.message,
    required this.undoLabel,
    required this.onUndid,
  }) : super(
          content: Text(message),
          action: SnackBarAction(
            label: undoLabel,
            onPressed: onUndid,
          ),
          duration: const Duration(seconds: 1),
        );

  final String message;
  final String undoLabel;
  final void Function() onUndid;
}

class CustomErrorSnackBar extends SnackBar {
  CustomErrorSnackBar({super.key, required this.message})
      : super(
          content: Text(message),
          duration: const Duration(seconds: 1),
        );

  final String message;
}
