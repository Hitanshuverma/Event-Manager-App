class Task {
  int? id;
  String? title;
  String? des;
  int? isCompleted;
  String? date;
  int? color;
  int? remind;

  Task({
    this.id,
    this.title,
    this.des,
    this.isCompleted,
    this.date,
    this.color,
    this.remind,
});

  Task.fromJson(Map<String, dynamic> json) {
   id = json['id'];
   title = json['title'];
   des = json['des'];
   isCompleted = json['isCompleted'];
   date = json['date'];
   color = json['color'];
   remind = json['remind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['des'] = this.des;
    data['isCompleted'] = this.isCompleted;
    data['date'] = this.date;
    data['color'] = this.color;
    data['remind'] = this.remind;
    return data;
  }
}