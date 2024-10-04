class NotificationModel {
  final String title;
  final String subtitle;
  final DateTime time;
  bool isAppear;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    this.isAppear = false,
  });

  factory NotificationModel.fromJson(json) {
    return NotificationModel(
        title: json['title'],
        subtitle: json['subtitle'],
        time: json['time'].toDate(),
        isAppear: json['isAppear']);
  }

  static toJson(NotificationModel model) {
    return {
      'title': model.title,
      'subtitle': model.subtitle,
      'time': model.time,
      'isAppear': model.isAppear
    };
  }
}
