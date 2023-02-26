// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? Id;
  String? title;
  String? desc;
  Timestamp? date;
  String? imageUrl;
  List? Users;

  PostModel({
    this.Id,
    this.title,
    this.desc,
    this.date,
    this.imageUrl,
    this.Users,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    title = json['Title'];
    desc = json['desc'];
    date = json['date'];
    imageUrl = json['imageUrl'];
    Users = json['Users'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': Id,
      'Title': title,
      'desc': desc,
      'date': date,
      'imageUrl': imageUrl,
      'Users': Users,
    };
  }
}
