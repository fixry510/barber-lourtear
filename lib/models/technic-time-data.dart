class TechnicTimeData {
  late int scheduleId;
  late String fromTime;
  late String toTime;
  late String userId;
  late int isAvalible;
  late String dateWork;

  TechnicTimeData({
    required this.scheduleId,
    required this.fromTime,
    required this.toTime,
    required this.userId,
    required this.isAvalible,
    required this.dateWork,
  });

  get timeString => "${this.fromTime} น.  -  ${this.toTime} น.";

  TechnicTimeData.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    userId = json['user_id'];
    isAvalible = json['isAvalible'];
    dateWork = json['dateWork'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_id'] = this.scheduleId;
    data['fromTime'] = this.fromTime;
    data['toTime'] = this.toTime;
    data['user_id'] = this.userId;
    data['isAvalible'] = this.isAvalible;
    data['dateWork'] = this.dateWork;
    return data;
  }
}
