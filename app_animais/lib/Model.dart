class Animal {
  // atributos
  String _especie;
  String _urlFoto;
  String _urlAudio;

  // construtor
  Animal(this._especie, this._urlFoto, this._urlAudio) {
    this._especie = especie;
    this._urlFoto = urlFoto;
    this._urlAudio = urlAudio;
  }

  String get especie => _especie;
  String get urlFoto => _urlFoto;
  String get urlAudio => _urlAudio;
  set especie(String especie) {
    this._especie = especie;
  }

  set urlFoto(String urlFoto) {
    this._urlFoto = urlFoto;
  }

  set urlAudio(String urlAudio) {
    this._urlAudio = urlAudio;
  }
}
