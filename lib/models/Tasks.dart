class Tasks {
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  Tasks(
      {this.id = " ",
      required this.title,
      required this.description,
      required this.date,
      this.isDone = false});
  Map<String,dynamic>toJson()
  {
    return {
      "id": id,
      "title":title,
      "description":description,
      "date":date,
      "isDone":isDone,
    };
  }
  Tasks.fromJson(Map<String,dynamic> toJson):this(
    id: toJson["id"],
    title: toJson[ "title"],
    description: toJson[ "description"],
    date: toJson[ "date"],
    isDone: toJson[ "isDone"],
  );
}
