import 'package:flutter/material.dart';
import 'usuario.dart';

class UserProvider with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  void setUsuario(Usuario usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  void clearUsuario() {
    _usuario = null;
    notifyListeners();
  }
}