// To parse this JSON data, do
//
//     final visitNotification = visitNotificationFromMap(jsonString);

import 'dart:convert';

List<VisitNotification> visitNotificationFromMap(String str) {
  final Iterable parsed = json.decode(str);
  return List<VisitNotification>.from(parsed.map((json) => VisitNotification.fromMap(json)));
}

String visitNotificationToMap(List<VisitNotification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class VisitNotification {
  int? id;
  String? notificationType;
  String? targetAudience;
  String? title;
  String? message;
  dynamic attachFile;
  bool? isSeen;
  String? createdAt;
  String? updatedAt;

  VisitNotification({
    this.id,
    this.notificationType,
    this.targetAudience,
    this.title,
    this.message,
    this.attachFile,
    this.isSeen,
    this.createdAt,
    this.updatedAt,
  });


  factory VisitNotification.fromMap(Map<String, dynamic> json) {
    return VisitNotification(
      id: json['id'],
      notificationType: json['Notification_Type'],
      targetAudience: json['Target_audience'],
      title: json['Title'],
      message: json['Message'],
      attachFile: json['Attach_File'],
      isSeen: json['is_seen'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'message': message,
      'timestamp': createdAt,
      'user': targetAudience,
    };
  }
}