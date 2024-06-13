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
}