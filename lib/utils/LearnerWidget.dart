import 'package:flutter/material.dart';
import 'package:learner_prokit/main.dart';
import 'package:learner_prokit/utils/AppWidget.dart';
import 'package:learner_prokit/utils/LearnerColors.dart';
import 'package:nb_utils/nb_utils.dart';

// Güncellenmiş LearnerEditTextStyle fonksiyonu
Container LearnerEditTextStyle(var hintText, {isPassword = false, required TextEditingController? controller}) {
  return Container(
    decoration: boxDecoration(radius: 40, showShadow: true, bgColor: learner_white),
    child: TextFormField(
      controller: controller, // Controller parametresi burada atanıyor
      style: primaryTextStyle(),
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        hintStyle: primaryTextStyle(),
        filled: true,
        fillColor: appStore.isDarkModeOn ? scaffoldDarkColor : learner_white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: learner_white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: learner_white, width: 0.0),
        ),
      ),
    ),
  );
}

// Güncellenmiş LearnerButton widget'ı
class LearnerButton extends StatelessWidget {
  final String textContent;
  final VoidCallback onPressed;

  const LearnerButton({required this.textContent, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        backgroundColor: learner_colorPrimary,
        padding: const EdgeInsets.all(0.0),
        elevation: 4,
        textStyle: TextStyle(color: learner_white),
      ),
      onPressed: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              textContent,
              style: boldTextStyle(color: white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
