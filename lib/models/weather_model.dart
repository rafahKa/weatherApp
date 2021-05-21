class Weather {
  final num id;
  final String main;
  final String description;

  Weather({this.id, this.main, this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Weather();
    }

    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
    };
  }
}
