import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learner_prokit/utils/LearnerColors.dart';
import 'package:learner_prokit/utils/LearnerImages.dart';
import 'package:learner_prokit/utils/LearnerStrings.dart';
import 'package:learner_prokit/utils/LearnerWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../main.dart';

class LearnerSignUp extends StatefulWidget {
  LearnerSignUp();

  @override
  _LearnerSignUpState createState() => _LearnerSignUpState();
}

class _LearnerSignUpState extends State<LearnerSignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> _signUp() async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
        data: {'full_name': _fullNameController.text},
      );

      if (res.user != null) {
        // Başarıyla kayıt olundu
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up successful!')),
        );
        finish(context);
        // Burada kullanıcıyı başka bir sayfaya yönlendirebilirsiniz
      }
    } catch (e) {
      // Hata mesajı göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  finish(context);
                },
                color: learner_colorPrimary,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: learner_white, width: 4)),
                          child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(learner_ic_Profile), radius: width / 8.5),
                        ),
                        SizedBox(height: 30),
                        LearnerEditTextStyle(
                          learner_hint_full_name,
                          isPassword: false,
                          controller: _fullNameController,
                        ),
                        SizedBox(height: 16),
                        LearnerEditTextStyle(
                          learner_hint_email,
                          isPassword: false,
                          controller: _emailController,
                        ),
                        SizedBox(height: 16),
                        LearnerEditTextStyle(
                          learner_hint_password,
                          isPassword: true,
                          controller: _passwordController,
                        ),
                        SizedBox(height: 50),
                        Container(
                          width: 120,
                          alignment: Alignment.center,
                          child: LearnerButton(
                            onPressed: _signUp,
                            textContent: learner_lbl_join,
                          ),
                        ),
                        16.height,
                        Text(learner_sign_up_info, style: boldTextStyle(color: appStore.textSecondaryColor)),
                        4.height,
                        Text(
                          learner_txt_terms_condition,
                          style: primaryTextStyle(decoration: TextDecoration.underline, color: t9_colorPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
