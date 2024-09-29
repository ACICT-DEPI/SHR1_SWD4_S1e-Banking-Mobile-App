class NotificationModel {
  final String title;
  final String subtitle;
  final DateTime time;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  factory NotificationModel.fromJson(json) {
    return NotificationModel(
      title: json['title'],
      subtitle: json['subtitle'],
      time: json['time'].toDate(),
    );
  }

  static toJson(NotificationModel model) {
    return {
      'title': model.title,
      'subtitle': model.subtitle,
      'time': model.time,
    };
  }
}
