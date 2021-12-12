class TaskEvent {
  int? id;
  String? event;
  String? leader;
  String? team;

  TaskEvent({
    this.id,
    this.event,
    this.leader,
    this.team,
  });

  TaskEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    event = json['event'];
    leader = json['leader'];
    team = json['team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data_event = new Map<String, dynamic>();
    data_event['id'] = this.id;
    data_event['event'] = this.event;
    data_event['leader'] = this.leader;
    data_event['team'] = this.team;
    return data_event;
  }
}