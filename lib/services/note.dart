class Poster {
  final String title;

  Poster({this.title});

  factory Poster.fromJson(Map<String, dynamic> json) {
    return Poster(
      title: json['title'] as String,
    );
  }
}
