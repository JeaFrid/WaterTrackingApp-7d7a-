import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';

void alert(BuildContext context, String title, String about, String confirmText,
    void Function()? onPressed) {
  CosmosAlert.showCustomAlert(
    context,
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: 300,
          decoration: BoxDecoration(
            color: containerColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: textColor.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    about,
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      confirmText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
