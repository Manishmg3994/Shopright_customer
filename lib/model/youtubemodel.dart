class YoutubeModel {
  final String image;
  final String link;
  final String title;
  final String ch_name;


  YoutubeModel._({this.image, this.link,this.title,this.ch_name});

  factory YoutubeModel.fromJson(Map<String, dynamic> json) {
    return new YoutubeModel._(
      image: json['image'],
      link: json['link'],
      title: json['title'],
      ch_name: json['ch_name'],
    );
  }
}