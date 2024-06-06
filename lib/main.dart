import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learner_prokit/Screens/LearnerSignUp.dart';
import 'package:learner_prokit/Screens/LearnerWalkThrough.dart';
import 'package:learner_prokit/store/AppStore.dart';
import 'package:learner_prokit/supabase_client.dart';
import 'package:learner_prokit/utils/AppTheme.dart';
import 'package:learner_prokit/utils/LearnerConstant.dart';
import 'package:learner_prokit/utils/LearnerDataGenerator.dart';
import 'package:learner_prokit/utils/LearnerStrings.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

AppStore appStore = AppStore();


void main() async {
  const String supabaseUrl ="https://amigipnjpmqhmkpelhml.supabase.co";
  const String supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFtaWdpcG5qcG1xaG1rcGVsaG1sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY3MjIzMTYsImV4cCI6MjAzMjI5ODMxNn0.ZickxubEFZ0FXY0V0uM1WeZGP-RC6mSAky17SruiX6E";

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey
    
  );

  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learner ${!isMobile ? ' ${platformName()}' : ''}',
        home: LearnerWalkThrough(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}


