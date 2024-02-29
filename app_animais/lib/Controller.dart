import 'package:app_animais/Model.dart';

class AnimalController {
  List<Animal> _listAnimal = [];

  List<Animal> get listarAnimais => _listAnimal;

  void adicionarAnimal(_especie, _urlFoto, _urlAudio) {
    Animal novoAnimal = Animal(_especie, _urlFoto, _urlAudio);
    _listAnimal.add(novoAnimal);
  }
}
