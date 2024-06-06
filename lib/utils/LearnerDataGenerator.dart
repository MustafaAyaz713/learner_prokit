

import 'package:flutter/material.dart';
import 'package:learner_prokit/model/LearnerModels.dart';
import 'package:learner_prokit/utils/LearnerColors.dart';
import 'package:learner_prokit/utils/LearnerConstant.dart';
import 'package:learner_prokit/utils/LearnerImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:learner_prokit/supabase_client.dart';

List<LearnerWalk> learnerWalkImg() {
  List<LearnerWalk> list = [];

  var img1 = LearnerWalk();
  img1.img = learner_walk_1;
  list.add(img1);

  var img2 = LearnerWalk();
  img2.img = learner_walk_2;
  list.add(img2);

  var img3 = LearnerWalk();
  img3.img = learner_walk_3;
  list.add(img3);

  return list;
}

 Future<List<LearnerCategoryModel>> learnerGetCategories() async {
  List<LearnerCategoryModel> list = [];
  final data = await supabase.from('learnercategorymodel').select();
    for(var row in data){
      list.add(new LearnerCategoryModel(row["img"],row["name"]));
  }

  return list;
}
 Future<List<LearnerFeaturedModel>> LearnerGetFeatured() async {
  List<LearnerFeaturedModel> list = [];
  final data = await supabase.from('learnerfeaturedmodel').select();
    for(var row in data){
      list.add(new LearnerFeaturedModel(row["img"],row["name"],row["price"],row["strikeprice"],row["type"]));
  }

  return list;
}


Future<List<LearnerPeopleModel>> learnerGetRecommended() async {
  List<LearnerPeopleModel> list = [];
  final data = await supabase.from('learnerpeoplemodel').select();
    for(var row in data){
      list.add(new LearnerPeopleModel(row["img"],row["name"],row["points"],row["isonline"],row["subject"],row["email"],row["email"]));
  }

  return list;



  
}

Future<List<LearnerPeopleModel>> learnerGetInstructor() async {
  List<LearnerPeopleModel> list = [];
  final data = await supabase.from('learnerpeoplemodel').select();
    for(var row in data){
      list.add(new LearnerPeopleModel(row["img"],row["name"],row["points"],row["isonline"],row["subject"],row["email"],row["email"]));
  }

  return list;

}


  Future<List<LearnerBadgeModel>> learnerGetBadges() async {
  List<LearnerBadgeModel> list = [];
  final data = await supabase.from('learnerbadgemodel').select();
    for(var row in data){
      list.add(new LearnerBadgeModel(row["img"],row["name"],row["comment"],row["islocked"]));
  }

  return list;

}


Future<List<LearnerPeopleModel>> learnerGetPending() async {
  List<LearnerPeopleModel> list = [];
  final data = await supabase.from('learnerpeoplemodel').select();
    for(var row in data){
      list.add(new LearnerPeopleModel(row["img"],row["name"],row["points"],row["isonline"],row["subject"],row["email"],row["email"]));
  }

  return list;

}


  
Future<List<LearnerCoursesModel>> learnerGetCourses() async {
  List<LearnerCoursesModel> list = [];
  final data = await supabase.from('learnercoursesmodel').select();
    for(var row in data){
      list.add(new LearnerCoursesModel(row["img"],row["name"]));
  }

  return list;

}

Future<List<LearnerContentModel>> learnerGetContents() async {
  List<LearnerContentModel> list = [];
  final data = await supabase.from('learnercontentmodel').select();
    for(var row in data){
      list.add(new LearnerContentModel(row["name"],row["subtitle"],row["type"]));
  }

  return list;

}

Future<List<LearnerChatModel>> learnerGetChatData() async {
  List<LearnerChatModel> list = [];
  final data = await supabase.from('learnerchatmodel').select();
    for(var row in data){
      list.add(new LearnerChatModel(row["name"],row["msg"],row["img"],row["isonline"]));
  }

  return list;

}


Future<List<LearnerLectureModel>> learnerGetLectureData() async {
  List<LearnerLectureModel> list = [];
  final data = await supabase.from('learnerlecturemodel').select();
    for(var row in data){
      list.add(new LearnerLectureModel(row["no"],row["title"],row["subtitle"],row["type"]));
  }

  return list;

}


List<ChatModel> getMessages() {
  List<ChatModel> list = [];

  ChatModel model1 = ChatModel('1', 'Hello Nimisha');
  ChatModel model2 = ChatModel('1', 'I am Revision Bot, here to help you study your ongoing courses.');
  ChatModel model3 = ChatModel('1', 'select a course to begin Business Management Cloud Computing Moden Medicine');
  ChatModel model4 = ChatModel('2', 'Modren Medicine');

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);

  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: 'images/flag/ic_us.png'),
    LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(id: 3, name: 'Arabic', languageCode: 'ar', fullLanguageCode: 'ar-AR', flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(id: 4, name: 'French', languageCode: 'fr', fullLanguageCode: 'fr-FR', flag: 'images/flag/ic_fr.png'),
  ];
}
