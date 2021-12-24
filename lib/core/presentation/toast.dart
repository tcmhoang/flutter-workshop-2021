import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<void> showNoConnectionToast(
  BuildContext context,
  String message,
) async {
  await showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (context, controller) {
      return Flash.dialog(
        controller: controller,
        backgroundColor:
            Theme.of(context).colorScheme.secondaryVariant.withOpacity(.7),
        borderRadius: BorderRadius.circular(9),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
