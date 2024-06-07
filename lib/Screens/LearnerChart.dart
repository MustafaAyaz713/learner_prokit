import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learner_prokit/Screens/LearnerDescription.dart';
import 'package:learner_prokit/model/LearnerModels.dart';
import 'package:learner_prokit/supabase_client.dart';
import 'package:learner_prokit/utils/AppWidget.dart';
import 'package:learner_prokit/utils/LearnerColors.dart';
import 'package:learner_prokit/utils/LearnerConstant.dart';
import 'package:learner_prokit/utils/LearnerDataGenerator.dart';
import 'package:learner_prokit/utils/LearnerStrings.dart';
import 'package:nb_utils/nb_utils.dart';

import 'LearnerModrenMedicine.dart';

Future<List<LearnerCoursesModel>> learnerGetCourses() async {
  List<LearnerCoursesModel> list = [];
  final data = await supabase.from('learnercoursesmodel').select();
  for (var row in data) {
    list.add(new LearnerCoursesModel(row["img"], row["name"]));
  }

  return list;
}

class LearnerChart extends StatefulWidget {
  @override
  _LearnerChartState createState() => _LearnerChartState();
}

class _LearnerChartState extends State<LearnerChart> {
  late List<LearnerCoursesModel> mList1 = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    mList1 = await learnerGetCourses();

    // Adding the manually created cards after fetching from the database
    mList1.addAll([
      LearnerCoursesModel(
        "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*cC8P9hJxcbcP9OrooHeylQ.png",
        "Sistem Analizi ve Tasarımı",
      ),
      LearnerCoursesModel(
        "https://d1.awsstatic.com/acs/characters/Logos/Docker-Logo_Horizontel_279x131.b8a5c41e56b77706656d61080f6a0217a3ba356d.png",
        "Linux Sistem Yönetimi",
      ),

        LearnerCoursesModel(
        "https://divbyte.com/wp-content/uploads/2019/02/html-css.png",
        "Web Tabanlı Programlama",


      ),

      LearnerCoursesModel(
"https://atlacademy.az/images/cache/f6/f6132f_opp-nedir.jpg",
        "Nesne Tabanlı Programlama",


      ),




    ]);


  

    setState(() {});
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                learner_lbl_My_Courses,
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.black87, 
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: buildGridView(mList1, LearnerDescription.tag),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildGridView(List list, String tag) {
  return GridView.builder(
    scrollDirection: Axis.vertical,
    itemCount: list.length,
    padding: EdgeInsets.only(bottom: 50),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return LearnerCourses(list[index], index, tag);
    },
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
  );
}

}

class LearnerCourses extends StatelessWidget {
  final LearnerCoursesModel model;
  final String tags;

  LearnerCourses(this.model, int pos, this.tags);

  @override
  Widget build(BuildContext context) {
    double progressValue = 0.3;
    Color progressColor = learner_orange_dark;

    if (model.name == "Sistem Analizi ve Tasarımı") {
      progressValue = 0.6; 
      progressColor = Colors.orange; 
    }

    if (model.name == "Linux Sistem Yönetimi") {
      progressValue = 0.9; 
      progressColor = Colors.green; 
    }

    if (model.name == "Web Tabanlı Programlama") {
      progressValue = 0.7; 
      progressColor = Colors.green; 
    }


   if (model.name == "Nesne Tabanlı Programlama") {
      progressValue = 0.1; // Change this value as needed
      progressColor = Colors.redAccent; // Change this color as needed
    }



    return Container(
      alignment: Alignment.center,
      color: context.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            placeholder: (_, s) => placeholderWidget(),
            imageUrl: model.img,
            width: double.infinity,
            height: 100,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(10).paddingAll(8),
          SizedBox(height: 8),
          text(model.name, textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium, maxLine: 2).paddingOnly(left: 8, right: 8),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progressValue, 
            backgroundColor: textSecondaryColor.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(progressColor), 
          ).paddingOnly(left: 8, right: 8),
        ],
      ),
    ).cornerRadiusWithClipRRect(10.0).paddingOnly(top: 16, left: 16, right: 16).onTap(
      () {
        LearnerDescription().launch(context);
      },
    );
  }
}

class LearnerCoursesModel {
  String img;
  String name;

  LearnerCoursesModel(this.img, this.name);
}
