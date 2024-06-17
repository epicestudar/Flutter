class AudioModel {
  //atributos
  final String title;
  final String artist;
  final String url;

  AudioModel({required this.title, required this.artist, required this.url});

  //fromMap
  factory AudioModel.fromMap(Map<String, dynamic> map) {
    return AudioModel(
      title: map['title'],
      artist: map['artist'],
      url: map['url'],
    );
  }
}