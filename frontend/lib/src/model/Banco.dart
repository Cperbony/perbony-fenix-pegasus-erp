import 'package:flutter/material.dart';
import 'package:mvc_application/mvc.dart';

class Banco implements Comparable<Banco> {
  Banco();

  String _id, _codigo, _nome, _url;

  String get id => _id;

  set id(String value) {
    value = checkIfValueIsNull(value);
    _id = value;
  }

  String get codigo => _codigo;

  set codigo(value) {
    value = checkIfValueIsNull(value);
    _codigo = value;
  }

  String get nome => _nome;

  set nome(value) {
    value = checkIfValueIsNull(value);
    _nome = value;
  }

  String get url => _url;

  set url(value) {
    value = checkIfValueIsNull(value);
    _url = value;
  }

  String checkIfValueIsNull(String value) {
    if (value == null) {
      value = checkIfValueIsNull(value);
      value = "";
    }
    return value;
  }

  Banco.fromMap(Map m) {
    id = m["id"];
    codigo = m["codigo"];
    nome = m["nome"];
    url = m["url"];
  }

  Map<String, dynamic> get toMap {
    return {
      "id": _id,
      "codigo": _codigo,
      "nome": _nome,
      "url": _url,
    };
  }

  @override
  int compareTo(Banco other) => _nome.compareTo(other._nome);
}

class Id extends FieldWidgets<Banco> {
  Id([Banco banco]) : super(object: banco, label: 'Id', value: banco?.id);

  void onSaved(v) => object?.id = value = v;
}

class Codigo extends FieldWidgets<Banco> {
  Codigo([Banco banco])
      : super(
            object: banco,
            label: 'Código',
            value: banco?.codigo,
            keyboardType: TextInputType.number);

  void onSaved(v) => object?.codigo = value = v;

  @override
  CircleAvatar get circleAvatar =>
      CircleAvatar(child: Text(value.length > 1 ? value?.substring(0, 3) : ""));
}

class Nome extends FieldWidgets<Banco> {
  Nome([Banco banco])
      : super(
            object: banco,
            label: 'Nome',
            value: banco?.nome,
            keyboardType: TextInputType.text);

  void onSaved(v) => object?.nome = value = v;
}

class Url extends FieldWidgets<Banco> {
  Url([Banco banco])
      : super(
            object: banco,
            label: 'URL',
            value: banco?.url,
            keyboardType: TextInputType.url);

  void onSaved(v) => object?.url = value = v;
}
