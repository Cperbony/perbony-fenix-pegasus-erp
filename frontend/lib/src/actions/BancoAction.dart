import 'package:flutter/material.dart';
import 'package:mvc_application/mvc.dart';
import 'package:perboni_erp_fenix/src/controller/BancoController.dart';
import 'package:perboni_erp_fenix/src/model/Banco.dart';
import 'package:perboni_erp_fenix/src/service/BancoService.dart';

class BancoPersistindo extends BancoEditando {
  /// Sobrescrever pois em algum momento preciso inicializar o objeto
  /// O método init, foi definido no BancoListando.
  @override
  void init([Object banco]) {
    super.init(banco);
  }

  /// Recebo o contexto como parâmetro opcional
  /// Se o estado do formulário for vazio, retorno nada
  /// Se passar, salvo estado corrente dele, setando novamente o estado do formulário para false
  void onPressed([BuildContext context]) {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    _inform = false;
    persistir();
    refresh();
  }
}

class BancoEditando extends BancoListando {
  bool _inform = false;

  /// Pega o estado deste formlário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Controlar o estado do formulário
  GlobalKey<FormState> get formKey {
    if (!_inform) {
      _inform = true;
    }
    return _formKey;
  }

  Future persistir([Banco banco]) {
    if (banco == null) {
      banco = _banco;
    }
    return BancoService.salvar(banco.toMap);
  }

  Future<bool> excluir([Banco banco]) async {
    if (banco == null) {
      banco = _banco;
    }
    return await BancoService.excluir(banco.toMap);
  }
}

class BancoListando extends BancoCampos {
  Banco _banco;

  /// Chave global do estado do scaffold, onde os widgets podem ter um parâmetro *key*
  /// Onde podemos passar um estado de um widget para outro, ou de uma árvore de estados para outros
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Banco> get items => _listaBanco;
  List<Banco> _listaBanco;

  /// Retorna uma lista de banco de forma assíncrona
  /// Pegar a lista no controller de banco
  Future<List<Banco>> refresh() async {
    _listaBanco = await BancoController.getListaBanco();
    // BancoController.recarregar();
    return _listaBanco;
  }

  void sort() async {
    // _listaBanco = BancoController.ordenar();
    BancoController.refrescarTela();
  }

  /// Recebe uma instância do banco
  void init([Object banco]) {
    if (banco == null) {
      _banco = Banco();
    } else {
      if (banco is! Banco) return;
      _banco = (banco as Banco);
    }
    _id = Id(_banco);
    _codigo = Codigo(_banco);
    _nome = Nome(_banco);
    _url = Url(_banco);
  }
}

class BancoCampos {
  FieldWidgets<Banco> _id, _codigo, _nome, _url;

  Id get id => _id;
  set id(Id id) => _id = id;

  Codigo get codigo => _codigo;
  set codigo(Codigo codigo) => _codigo = codigo;

  Nome get nome => _nome;
  set nome(nome) => _nome = nome;

  Url get url => _url;
  set url(Url url) => _url = url;
}
