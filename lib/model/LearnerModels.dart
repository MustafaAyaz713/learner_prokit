import 'dart:ui';

class LearnerWalk {
  String? img;
}

class LearnerCategoryModel {
  var img = "";
  var name = "";

  LearnerCategoryModel(
    this.img,
    this.name,
    );
}

class LearnerFeaturedModel {
  var img = "";
  var name = "";
  var price = "";
  var strikePrice = "";
  var type;

  LearnerFeaturedModel(
    this.img,
    this.name,
    this.price,
    this.strikePrice,
    this.type,
  );
}

class LearnerPeopleModel {
  var img = "";
  var name = "";
  var points = "";
  var isOnline = false;
  var subject = "";
  var email = "";
  var frd = "";

  LearnerPeopleModel(
    this.img,
    this.name,
    this.points,
    this.isOnline,
    this.subject,
    this.email,
    this.frd,
  );
}

class LearnerBadgeModel {
  var img = "";
  Color? color;

  var name = "";
  var comment = "";
  var isLocked = false;
LearnerBadgeModel(
  this.img,
  this.name,
  this.comment,
  this.isLocked,
);
  
}

class LearnerContentModel {
  var name = "";
  var subtitle = "";
  var type = "";

  LearnerContentModel(
    this.name,
    this.subtitle,
    this.type,
  );
}

class LearnerCoursesModel {
  var name = "";
  var img = "";
  LearnerCoursesModel(
    this.name,
    this.img,
  );
}

class LearnerChatModel {
  var name = "";
  var msg = "";
  var img = "";
  var isOnline = false;
  LearnerChatModel(
    this.name,
    this.msg,
    this.img,
    this.isOnline,
  );
}

class LearnerLectureModel {
  var no = "";
  var title = "";
  var subtitle = "";
  var type = "";
  LearnerLectureModel(
    this.no,
    this.title,
    this.subtitle,
    this.type,
  );
}

class ChatModel {
  String id;
  String message;

  ChatModel(this.id, this.message);
}
