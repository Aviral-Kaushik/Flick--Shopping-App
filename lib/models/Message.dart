import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  Message({
    required this.id,
    required this.name,
    required this.contactEmail,
    required this.subject,
    required this.message,
    required this.dateAndTime,
  });

  String id;
  final String name;
  final String contactEmail;
  final String subject;
  final String message;
  final String dateAndTime;

  factory Message.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Message(
        id: data?["message_id"],
        name: data?["name"],
        contactEmail: data?["contact_email"],
        subject: data?["subject"],
        message: data?["message"],
        dateAndTime: data?["date_and_time"]);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "message_id": id,
      "name": name,
      "contact_email": contactEmail,
      "subject": subject,
      "message": message,
      "date_and_time": dateAndTime,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Message otherMessage = other as Message;
    return id == otherMessage.id;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      contactEmail.hashCode ^
      subject.hashCode ^
      message.hashCode ^
      dateAndTime.hashCode;
}
