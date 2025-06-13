class Joke {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  Joke({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'] as String,
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
      id: json['id'] as int,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'setup': setup,
      'punchline': punchline,
      'id': id,
    };
  }


}