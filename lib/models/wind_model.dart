class Wind {
  final num speed;

  Wind({this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Wind();
    }

    return Wind(
      speed: double.parse(json['speed'].toString()),
    );
  }
}
