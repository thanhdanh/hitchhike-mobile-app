import 'package:flutter/material.dart';
import 'package:hitchhike/data/repository.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final String TAG = "_ThemeStore";

  // repository instance
  final Repository _repository;

  // store variables:-----------------------------------------------------------
  @observable
  bool _darkMode = false;

  // getters:-------------------------------------------------------------------
  bool get darkMode => _darkMode;

  // constructor:---------------------------------------------------------------
  _ThemeStore(Repository repository) : this._repository = repository {
    init();
  }

  // general methods:-----------------------------------------------------------
  Future init() async {
    _darkMode = await _repository?.isDarkMode ?? false;
  }
}
