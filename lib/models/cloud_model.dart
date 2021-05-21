class Clouds {
  final num all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Clouds();
    }

    return Clouds(
      all: json['all'],
    );
  }
}
