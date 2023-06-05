class Resp {}

class Ele {
  String message;
  List<dynamic> alarmElements;
  // List<AlarmCardInfo> alarmElements;
  Ele({
    required this.message,
    required this.alarmElements,
  });

  factory Ele.fromJson(Map<String, dynamic> json) {
    return Ele(
      message: json['message'],
      alarmElements: json['alarmarray'],
    );
  }
}

class AlarmCardInfo {
  final int priority;
  final int value;
  final String timestamp;
  final String tagname;
  final String ackstate;
  final String acktime;
  final String comments;
  final int user;
  final String wenttime;
  final String description;
  const AlarmCardInfo({
    required this.priority,
    required this.value,
    required this.timestamp,
    required this.tagname,
    required this.ackstate,
    required this.acktime,
    required this.comments,
    required this.user,
    required this.wenttime,
    required this.description,
  });

  factory AlarmCardInfo.fromJson(Map<String, dynamic> json) {
    return AlarmCardInfo(
      priority: json['priority'],
      value: json['value'],
      timestamp: json['time_stamp'],
      tagname: json['tagname'],
      ackstate: json['ack_state'],
      acktime: json['ack_timestamp'],
      comments: json['comments'],
      user: json['ack_user'],
      wenttime: json['wenttimestamp'],
      description: json['description'],
    );
  }
}
