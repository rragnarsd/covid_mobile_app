class News {
  String title;
  String text;
  String media;
  String time;
  String img;

  News(
      {required this.title,
        required this.text,
        required this.media,
        required this.time,
        required this.img
      });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      text: json['text'],
      media: json['media'],
      time: json['time'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['text'] = text;
    data['media'] = media;
    data['time'] = time;
    data['img'] = img;
    return data;
  }
}
