class Message {

  Message({
    required this.id,
    required this.name,
    required this.contactEmail,
    required this.subject,
    required this.message,
    required this.dateAndTime,
  });

  final String id;
  final String name;
  final String contactEmail;
  final String subject;
  final String message;
  final String dateAndTime;

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
